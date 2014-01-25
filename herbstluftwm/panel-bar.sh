#!/bin/bash

# todo: fontello icons

# disable path name expansion or * will be expanded in the line
# cmd=( $line )
set -f

function uniq_linebuffered() {
    awk -W interactive '$0 != l { print ; l=$0 ; fflush(); }' "$@"
}
function get_mpd_song() {
    # use mpc to get currently playing song, uppercase it
    song=$(mpc current -h $HOME/.mpdsock -f %title%)
    # let's skip ft. parts, etc. to get some more space
    echo -n $song | sed 's/\(.*\)/\U\1/' | sed 's/(.*//' | sed 's/ -.*//' | sed 's/ 
$//'
}

monitor=${1:-0}
geometry=( $(herbstclient monitor_rect "$monitor") )
if [ -z "$geometry" ] ;then
    echo "Invalid monitor $monitor"
    exit 1
fi
# geometry has the format: WxH+X+Y
x=${geometry[0]}
y=${geometry[1]}
panel_width=${geometry[2]}

separator="\f0  |  \fr"
song=$(get_mpd_song)

herbstclient pad $monitor 18
{
    # events:
    # mpc events
    mpc -h $HOME/.mpdsock idleloop player &
    mpc_pid=$!

    # date
    while true ; do
        date +'date_day %A %e.  '
        date +'date_min %H:%M  '
        sleep 1 || break
    done > >(uniq_linebuffered) &
    date_pid=$!

    # hlwm events
    herbstclient --idle

    # exiting; kill stray event-emitting processes
    kill $date_pid $mpd_pid
} 2> /dev/null | {
    TAGS=( $(herbstclient tag_status $monitor) )
    unset TAGS[${#TAGS[@]}-1]
    date_day=""
    date_min=""
    visible=true

    while true ; do
        echo -n "\c"
        for i in "${TAGS[@]}" ; do
            case ${i:0:1} in
                '#') # current tag
                    echo -n "\u6\fr"
                    ;;
                '+') # active on other monitor
                    echo -n "\u2\fr"
                    ;;
                ':')
                    echo -n "\ur\fr"
                    ;;
                '!') # urgent tag
                    echo -n "\u1\f1"
                    ;;
                *)
                    echo -n "\ur\f2"
                    ;;
            esac
            echo -n "   ${i:1}   " | tr '[:lower:]' '[:upper:]'
        done
        # align left
        echo -n "\l"
        # display song and separator only if something's playing
        if [[ $song ]]; then
            echo -n "\ur\fr  $song$separator"
        fi

        # align right
        echo -n "\r\ur\fr\br"
        echo -n "$separator"
        echo -n "$date_day" | tr '[:lower:]' '[:upper:]'
        echo -n " \f2"
        echo -n "$date_min  " | tr '[:lower:]' '[:upper:]'
        echo
        # wait for next event
        read line || break
        cmd=( $line )
        # find out event origin
        case "${cmd[0]}" in
            tag*)
                TAGS=( $(herbstclient tag_status $monitor) )
                unset TAGS[${#TAGS[@]}-1]
                ;;
            date_day)
                date_day="${cmd[@]:1}"
                ;;
            date_min)
                date_min="${cmd[@]:1}"
                ;;
            player)
                song=$(get_mpd_song)
                ;;
            quit_panel)
                exit
                ;;
            reload)
                exit
                ;;
        esac
    done
} 2> /dev/null | bar $1 -w $panel_width -x $x 

