;;; Programming Configuration

;; Flymake
(add-hook 'find-file-hook 'flymake-find-file-hook)
(setq flymake-gui-warnings-enabled nil)

;; Require rainbow delimiters post init
(add-hook 'after-init-hook (lambda () (require 'rainbow-delimiters)))

;; load config files for specific languages
(load "config/elisp-config.el")
(load "config/python-config.el")
(load "config/js-config.el")
(load "config/erlang-config.el")
(load "config/racket-config.el")
(load "config/clojure-config.el")
(load "config/php-config.el")
(load "config/html-config.el")

