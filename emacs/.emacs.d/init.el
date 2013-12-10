;;evil
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

;;quicklisp
(load (expand-file-name "~/quicklisp/slime-helper.el"))
;;Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl")
(require 'slime)
(require 'slime-autoloads)
(slime-setup '(slime-fancy))


;;global shit
(global-linum-mode t)
(global-font-lock-mode 1)
(global-set-key (kbd "RET") 'newline-and-indent)

(menu-bar-mode 0)
