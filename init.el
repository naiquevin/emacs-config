;;;; Vineet's emacs init file
;; Refactored on Sat Jun 16 19:16:13 IST 2012

;; Custom file where Customize-* will write
(setq custom-file "~/emacs/site/custom.el")
(load custom-file)

;; Add lib dir to load path
;; Drop any one-file-mode inside this directory
(add-to-list 'load-path (expand-file-name "~/emacs/site/lib"))


;;;; General Settings 

(menu-bar-mode -1) ; Get rid of the menu bar first!
(tool-bar-mode -1) ; and then the tool bar
(mouse-avoidance-mode 'cat-and-mouse) ; then the mouse
(setq x-select-enable-clipboard t) ; x-copy-paste
(setq inhibit-startup-message t) ; Get rid of the startup message
(setq c-basic-offset 4) ; basic c/php indentation to 4 spaces
(setq-default indent-tabs-mode nil) ; I hate tabs!
(setq-default truncate-lines t) ; I hate line-wrapping!
(iswitchb-mode 1) ; enable iswitch buffer
(icomplete-mode t)  ; Show completions in mini buffer
(which-function-mode t) ; enable which function mode
;; (global-linum-mode t) ; Show line nums on left
(show-paren-mode t) ; Show matching paren

;;; unique buffer names
(require 'uniquify) ; uniquify is packed in emacs
(setq uniquify-buffer-name-style 'post-forward)
(setq uniquify-separator "|")
(setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

;;; Ace-Jump Mode
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;;; Load self defined utility functions
(load "mylib.el")


;;;; Programming

;;; Flymake 
(add-hook 'find-file-hook 'flymake-find-file-hook)
(require 'flymake-cursor)
(setq flymake-gui-warnings-enabled nil)


;;; Python

;; Pyflakes
(when (load "flymake" t) 
  (defun flymake-pyflakes-init () 
    (let* ((temp-file (flymake-init-create-temp-buffer-copy 
                       'flymake-create-temp-inplace)) 
           (local-file (file-relative-name 
                        temp-file 
                        (file-name-directory buffer-file-name)))) 
      (list "pyflakes" (list local-file))))
  
  (add-to-list 'flymake-allowed-file-name-masks 
               '("\\.py\\'" flymake-pyflakes-init)))


;;; Javascript 

;; js-mode (earlier known as espresso mode, now packaged with emacs)
(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))

;; json (Josh's lite weight json major mode)
(autoload 'json-mode "json-mode.el" "Major mode for editing json files" t)
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))


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


;;; Jinja2 Templates
(require 'jinja2-mode)

;; For all .html under /python/../templates/, jinja2-mode activated on
;; find-file
(add-hook
 'find-file-hook
 (lambda ()
   (when (and (string-match-p "/python/" (buffer-file-name))
              (string-match-p "/templates/" (buffer-file-name)))
     (jinja2-mode))))

;; Needs to be selectively activated in case of other html file using
;; C-c j
(define-key html-mode-map (kbd "C-c j") 'jinja2-mode)


;;;; Editing and Outlining

;;; Markdown mode
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t) 
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.markdown" . markdown-mode) auto-mode-alist))

;;; Org mode
(load "~/emacs/site/org.el")


;;;; Themes

;; custom-theme-load-path is new in Emacs24
(add-to-list 'custom-theme-load-path "~/emacs/site/themes")
(add-to-list 'custom-theme-load-path "~/emacs/site/themes/solarized")
(add-to-list 'custom-theme-load-path "~/emacs/site/themes/tomorrow-night")

;; solarized-dark - current theme of choice
(load-theme 'solarized-dark t)

;;;; On demand loading
(load "~/emacs/site/ondemand.el")


;;;; Start Server
(server-start)

