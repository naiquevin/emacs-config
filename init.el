;;; Emacs init file
;; Author: Vineet Naik <naikvin@gmail.com>
;; Last refactored: Sunday, Aug 18 2013

;; Custom file where Customize-* will write
(setq custom-file "~/emacs/site/custom.el")
(load custom-file)

;; Add current dir to load path
(add-to-list 'load-path (expand-file-name "~/emacs/site"))

;; Add lib to load path so that any one-file-mode can be dropped here
(add-to-list 'load-path (expand-file-name "~/emacs/site/lib"))

;; General preferences
(menu-bar-mode -1)                    ; Get rid of the menu bar first,
(tool-bar-mode -1)                    ; .. and the tool bar,
(scroll-bar-mode -1)                  ; .. and the scroll bar,
(setq inhibit-startup-message t)      ; .. and the startup message,
(mouse-avoidance-mode 'cat-and-mouse) ; .. and finally the mouse pointer!
(setq x-select-enable-clipboard t)    ; x-copy-paste
(setq c-basic-offset 4)               ; Basic ndentation to 4 spaces
(setq-default indent-tabs-mode nil)   ; Disable tabs
(setq-default truncate-lines t)       ; Disable line-wrapping
(icomplete-mode 1)                    ; Incremental completions in minibuffer
(which-function-mode t)               ; Enable which function mode
(show-paren-mode t)                   ; Show matching paren


;; ido-mode configs
(ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10)

;; Load various self written stuff
(load "naiquevin/defuns")

;; Load configurations
(load "config/prog")          ; Programming config
(load "config/misc")          ; Miscellaneous config
(load "config/themes-config") ; Theme config

;; Set package archive sources
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(load "~/emacs/site/pkg-tools.el")

;; Start Server
(server-start)

