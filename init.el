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
(tool-bar-mode -1)                    ; .. then the tool bar,
(setq inhibit-startup-message t)      ; .. then the startup message,
(mouse-avoidance-mode 'cat-and-mouse) ; .. and finally the mouse!
(setq x-select-enable-clipboard t)    ; x-copy-paste
(setq c-basic-offset 4)               ; Basic ndentation to 4 spaces
(setq-default indent-tabs-mode nil)   ; Disable tabs
(setq-default truncate-lines t)       ; Disable line-wrapping
(iswitchb-mode 1)                     ; Enable iswitch buffer
(icomplete-mode t)                    ; Show completions in mini buffer
(which-function-mode t)               ; Enable which function mode
(global-linum-mode t)                 ; Show line nums on left
(show-paren-mode t)                   ; Show matching paren
(setq split-height-threshold nil)     ; Always split horizontally
(setq split-width-threshold 0)        ; Always split horizontally

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

