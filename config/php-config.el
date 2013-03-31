;;; Php

;; Php 5.4 friendly mode from https://github.com/ejmr/php-mode
(require 'php-mode)

;; Flymake for php
(defun flymake-php-init ()
  "Use php to check the syntax of the current file."
  (let* ((temp (flymake-init-create-temp-buffer-copy 'flymake-create-temp-inplace))
	 (local (file-relative-name temp (file-name-directory buffer-file-name))))
    (list "php" (list "-f" local "-l"))))
(add-to-list 'flymake-err-line-patterns
             '("\\(Parse\\|Fatal\\) error: +\\(.*?\\) in \\(.*?\\) on line \\([0-9]+\\)$" 3 4 nil 2))
(add-to-list 'flymake-allowed-file-name-masks '("\\.php$" flymake-php-init))
