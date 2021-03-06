;; Config file for setting general preferences

(setq user-full-name "Vineet Naik"
      user-mail-address "naikvin@gmail.com"
      erc-nick "naiquevin"
      inhibit-startup-message t       ; donot show the startup msg
      x-select-enable-clipboard t     ; x-copy-paste
      c-basic-offset 4                ; Basic indentation to 4 spaces
      confirm-kill-emacs 'y-or-n-p
      ring-bell-function 'ignore)


;; more prefs
(setq-default indent-tabs-mode nil)   ; Disable tabs
(setq-default truncate-lines t)       ; Disable line-wrapping


;; more prefs
(menu-bar-mode -1)                    ; Get rid of the menu bar first,
(tool-bar-mode -1)                    ; .. and the tool bar,
(scroll-bar-mode -1)                  ; .. and the scroll bar,
(mouse-avoidance-mode 'cat-and-mouse) ; .. and finally the mouse pointer!
(icomplete-mode 1)                    ; Incremental completions in minibuffer
(which-function-mode t)               ; Enable which function mode
(show-paren-mode t)                   ; Show matching paren
(column-number-mode 1)                ; Show column number in mode line


;; prefer everything in utf-8
(prefer-coding-system 'utf-8)
(set-language-environment 'UTF-8)
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8
      buffer-file-coding-system 'utf-8
      coding-system-for-write 'utf-8
      default-process-coding-system '(utf-8 . utf-8))


(use-package uniquify
  :custom
  (uniquify-buffer-name-style 'post-forward)
  (uniquify-separator "|")
  (uniquify-after-kill-buffer-p t)
  (uniquify-ignore-buffers-re "^\\*" "Leave special buffers alone"))


(use-package projectile
  :ensure t
  :custom
  (projectile-mode-line '(:eval (format " Project:%s" (projectile-project-name))))
  :config
  (projectile-global-mode))


(use-package avy
  :ensure t
  :bind (("C-:" . avy-goto-char)
         ("M-g f" . avy-goto-line)
         ("M-g w" . avy-goto-word-1)))


(use-package windmove
  :config
  (windmove-default-keybindings)
  (setq windmove-wrap-around t))


(use-package ace-window
  :ensure t
  :custom
  (aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  :bind (("C-c q" . ace-window)))


(use-package multiple-cursors
  :ensure t
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))


(use-package imenu-anywhere
  :ensure t
  :bind (("C-=" . imenu-anywhere)))


(use-package persistent-scratch
  :ensure t
  :bind (("C-c M-s" . persistent-scratch-save)
         ("C-c M-r" . persistent-scratch-restore)))


(use-package mermaid-mode
  :mode ("\\.mmd\\'" . mermaid-mode)
  :config
  (setq mermaid-mmdc-location "/Users/naiquevin/.nvm/versions/node/v12.14.0/bin/mmdc"))


(use-package plantuml-mode
  :mode ("\\.plantuml\\'" . plantuml-mode)
  :config
  (setq plantuml-default-exec-mode 'jar)
  (setq plantuml-jar-path "/Users/naiquevin/helpshift/vendor/PlantUML/plantuml.jar"))


(use-package csv-mode
  :ensure t)


(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config))


(use-package sqlformat
  :ensure t
  :config
  (setq sqlformat-command 'pgformatter)
  :bind (("C-c C-f" . sqlformat-buffer)))


(use-package lilypond-mode
  :ensure nil
  :load-path "/Users/naiquevin/emacs/site/vendor/lilypond/"
  :mode ("\\.ly\\'" . LilyPond-mode)
  :custom
  (LilyPond-lilypond-command "/Applications/LilyPond.app/Contents/Resources/bin/lilypond")
  ;; FIXME: Open in emacs buffer
  (LilyPond-pdf-command "open"))
