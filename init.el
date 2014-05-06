;;; Emacs init file
;; Author: Vineet Naik <naikvin@gmail.com>


;; globally set various paths
(setq my/emacs-config-dir (expand-file-name "~/emacs/site")
      my/vendor-lib-dir (expand-file-name "lib" my/emacs-config-dir)
      my/self-lib-dir (expand-file-name "naiquevin" my/emacs-config-dir)
      my/config-dir (expand-file-name "config" my/emacs-config-dir)
      my/elpa-dir (expand-file-name "elpa" user-emacs-directory)
      my/themes-dir (expand-file-name "themes" my/emacs-config-dir)
      custom-file (expand-file-name "custom.el" my/emacs-config-dir))


;; Add dirs to load-path
(add-to-list 'load-path my/emacs-config-dir)
(add-to-list 'load-path my/vendor-lib-dir)
(add-to-list 'load-path my/self-lib-dir)


;; pkg-init initializes default package management mechanism (ELPA)
;; and ensures at startup that all required packages are installed
;; (stolen from emacs-prelude)
(require 'pkg-init)


;; Load an elisp file having self written utilities so that they may
;; be used in config files later
(require 'defuns)


;; Pre-config - Following lines need to be evaluated before config
;; files are loaded

;; Require Rainbow-delimiters
(add-hook 'after-init-hook (lambda () (require 'rainbow-delimiters)))


;; Set load-dirs to a list containing the config dir so that
;; load-dir.el may load all files in the dir. Note that load-dir.el is
;; not packaged with emacs.
(setq load-dirs (list my/config-dir))


;; Load the custom file
(load custom-file)


;; Start Server if it's not running
(require 'server)
(when (not (server-running-p))
  (server-start))
