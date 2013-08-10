;;; Vineet's emacs init file
;; Last refactored on Sun 31 Mar 2013

;; Custom file where Customize-* will write
(setq custom-file "~/emacs/site/custom.el")
(load custom-file)

;; Add current dir to load path
(add-to-list 'load-path (expand-file-name "~/emacs/site"))

;; Add lib to load path so that any one-file-mode can be dropped here
(add-to-list 'load-path (expand-file-name "~/emacs/site/lib"))

;; General preferences
(menu-bar-mode -1)                    ; Get rid of the menu bar first!
(tool-bar-mode -1)                    ; and then the tool bar
(mouse-avoidance-mode 'cat-and-mouse) ; then the mouse
(setq x-select-enable-clipboard t)    ; x-copy-paste
(setq inhibit-startup-message t)      ; Get rid of the startup message
(setq c-basic-offset 4)               ; basic c/php indentation to 4 spaces
(setq-default indent-tabs-mode nil)   ; No tabs!
(setq-default truncate-lines t)       ; No line-wrapping!
(iswitchb-mode 1)                     ; enable iswitch buffer
(icomplete-mode t)                    ; Show completions in mini buffer
(which-function-mode t)               ; enable which function mode
(global-linum-mode t)                 ; Show line nums on left
(show-paren-mode t)                   ; Show matching paren

;; load various self written stuff
(load "naiquevin/defuns")

;; load configurations
(load "config/prog")          ; programming config
(load "config/misc")          ; miscellaneous config
(load "config/themes-config") ; theme config

;; set package archive sources
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(load "~/emacs/site/pkg-tools.el")

;; Start Server
(server-start)

