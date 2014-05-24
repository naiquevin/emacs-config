;;; Php

;; Php 5.4 friendly mode from https://github.com/ejmr/php-mode
(require 'php-mode)

;; Flycheck
(add-hook 'php-mode-hook 'flycheck-mode)
