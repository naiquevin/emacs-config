(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(show-paren-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#042028" :foreground "#708183" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "bitstream" :family "Courier 10 Pitch"))))
 '(mumamo-background-chunk-major ((((class color) (min-colors 88) (background light)) nil)))
 '(mumamo-background-chunk-submode1 ((((class color) (min-colors 88) (background light)) nil))))

;; General Settings
(menu-bar-mode -1) ;; Get rid of the menu bar first!
(tool-bar-mode -1) ;; and then the tool bar
(mouse-avoidance-mode 'cat-and-mouse) ;; then the mouse
(setq x-select-enable-clipboard t) ;; x-copy-paste
(setq inhibit-startup-message t) ;; Get rid of the startup message
(setq c-basic-offset 4) ;; basic c/php indentation to 4 spaces
(setq-default indent-tabs-mode nil) ;; I hate tabs!
(setq-default truncate-lines t) ;; I hate line-wrapping!
(iswitchb-mode 1) ;; enable iswitch buffer
(icomplete-mode t)  ;; Show completions in mini buffer
(which-function-mode t) ;; enable which function mode
(global-linum-mode t) ;; Show line nums on left

;; for php, xhtml, js mixed docs etc.
(load "~/emacs/site/nxhtml/autostart.el")
(setq mumamo-background-colors nil) 
(add-to-list 'auto-mode-alist '("\\.html$" . django-html-mumamo-mode))

;; for better array indentation in php
(add-hook 'php-mode-hook (lambda ()
    (defun ywb-php-lineup-arglist-intro (langelem)
      (save-excursion
        (goto-char (cdr langelem))
        (vector (+ (current-column) c-basic-offset))))
    (defun ywb-php-lineup-arglist-close (langelem)
      (save-excursion
        (goto-char (cdr langelem))
        (vector (current-column))))
    (c-set-offset 'arglist-intro 'ywb-php-lineup-arglist-intro)
    (c-set-offset 'arglist-close 'ywb-php-lineup-arglist-close)))

;; add the common dir where all random modes will reside
(add-to-list 'load-path (expand-file-name "~/emacs/site/common"))

;; javascript mode (espresso)
;; (require 'espresso) wow! already included
(autoload #'espresso-mode "espresso" "Start espresso-mode" t)
(add-to-list 'auto-mode-alist '("\\.js$" . espresso-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . espresso-mode))

;; markdown-mode
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t) 
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))

;; color-theme
(add-to-list 'load-path "/usr/share/emacs/site-lisp/emacs-goodies-el/color-theme.el/file")
(require 'color-theme)

(add-to-list 'load-path "~/emacs/site/common/color-theme-solarized")
(require 'color-theme-solarized)
(color-theme-solarized-dark)

;; Org Mode
(setq load-path (cons "~/emacs/site/org-7.7/lisp" load-path))
(setq load-path (cons "~/emacs/site/org-7.7/contrib/lisp" load-path))
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)