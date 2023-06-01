;; Disclaimer! Following code to ensure that the required packages are
;; installed at startup is stolen from emacs-prelude
;; (https://github.com/bbatsov/prelude)

(require 'cl-lib)
(require 'package)


;; Set package archive sources
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ;; ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))


;; (require 'use-package)

;; Bootstrap 'use-package'
(eval-after-load 'gnutls
  '(add-to-list 'gnutls-trustfiles "/etc/ssl/cert.pem"))
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(require 'bind-key)
(setq use-package-always-ensure t)


;; DEPRECATED! Following code will be replaced with use-package

(defvar pkg-init-packages
  '(s dash load-dir ess flycheck geiser php-mode
      ctable concurrent go-mode
      deferred jinja2-mode js2-mode nodejs-repl json-mode
      bats-mode
      nginx-mode
      pkg-info epl popup rainbow-delimiters
      sml-mode
      yaml-mode ansible-doc)
  "A list of packages to ensure are installed at launch")


(defun pkg-init-packages-installed-p ()
  (cl-loop for p in pkg-init-packages
	   when (not (package-installed-p p)) do (cl-return nil)
	   finally (cl-return t)))


(unless (pkg-init-packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p pkg-init-packages)
    (when (not (package-installed-p p))
      (package-install p))))


(provide 'pkg-init)
