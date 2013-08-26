;;; Programming Configuration

;; Flymake
(add-hook 'find-file-hook 'flymake-find-file-hook)
(setq flymake-gui-warnings-enabled nil)

;; load config files for specific languages
(load "config/python-config.el")
(load "config/js-config.el")
(load "config/erlang-config.el")
(load "config/racket-config.el")
(load "config/clojure-config.el")
(load "config/php-config.el")
(load "config/html-config.el")

