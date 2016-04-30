;; Disclaimer! Following code to ensure that the required packages are
;; installed at startup is stolen from emacs-prelude
;; (https://github.com/bbatsov/prelude)

(require 'cl-lib)
(require 'package)


;; Set package archive sources
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)


(defvar pkg-init-packages
  '(s dash load-dir cider clojure-mode
      erlang ess flycheck geiser jedi php-mode
      auto-complete epc ctable concurrent go-mode
      deferred jinja2-mode js2-mode json-mode bats-mode
      git-commit gitconfig-mode gitignore-mode magit
      markdown-mode multiple-cursors nginx-mode paredit
      pkg-info epl popup rainbow-delimiters scala-mode2
      sml-mode virtualenvwrapper ace-jump-mode ace-window
      yaml-mode yasnippet unbound ledger-mode ansible-doc
      persistent-scratch)
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
