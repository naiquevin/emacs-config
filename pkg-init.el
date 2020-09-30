;; Disclaimer! Following code to ensure that the required packages are
;; installed at startup is stolen from emacs-prelude
;; (https://github.com/bbatsov/prelude)

(require 'cl-lib)
(require 'package)


;; Set package archive sources
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))


(require 'use-package)


;; DEPRECATED! Following code will be replaced with use-package

(defvar pkg-init-packages
  '(s dash load-dir erlang ess flycheck geiser jedi php-mode
      auto-complete epc ctable concurrent go-mode
      deferred jinja2-mode js2-mode nodejs-repl json-mode
      bats-mode git-commit gitconfig-mode gitignore-mode
      magit markdown-mode nginx-mode paredit
      pkg-info epl popup rainbow-delimiters scala-mode2
      sml-mode virtualenvwrapper
      yaml-mode unbound ledger-mode ansible-doc
      pytest)
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
