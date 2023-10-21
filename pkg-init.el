;; Disclaimer! Following code to ensure that the required packages are
;; installed at startup is stolen from emacs-prelude
;; (https://github.com/bbatsov/prelude)

(require 'cl-lib)
(require 'package)


;; Set package archive sources
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)


(provide 'pkg-init)
