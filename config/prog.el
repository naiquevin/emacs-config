;;; Programming Configuration

;; Flymake 
(add-hook 'find-file-hook 'flymake-find-file-hook)
(require 'flymake-cursor)
(setq flymake-gui-warnings-enabled nil)

;; load config files for specific languages
(load "config/python-config.el")
(load "config/js-config.el")
(load "config/erlang-config.el")
(load "config/php-config.el")
(load "config/html-config.el")

;; Scala
(add-to-list 'load-path "~/emacs/site/scala-mode2/")
(require 'scala-mode2)

;; Quack (Racket)
(require 'quack)
(setq quack-fontify-style 'emacs)

;; Rainbow delimiters (for scheme)
(require 'rainbow-delimiters)
(add-hook 'scheme-mode-hook 'rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)

