;; Config file for setting general preferences

(setq user-full-name "Vineet Naik"
      user-mail-address "naikvin@gmail.com"
      erc-nick "naiquevin"
      inhibit-startup-message t       ; donot show the startup msg
      x-select-enable-clipboard t     ; x-copy-paste
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


(global-whitespace-mode)
(setq whitespace-style '(face tabs tab-mark trailing))
(custom-set-faces
 '(whitespace-tab ((t (:foreground "#636363")))))
(setq whitespace-display-mappings
  '((tab-mark 9 [124 9] [92 9])))

(setq debug-on-quit nil)

;; All the library packages

(use-package s
  :ensure t)


(use-package dash
  :ensure t)


(use-package concurrent
  :ensure t)


(use-package deferred
  :ensure t)


;; Other generic packages

(use-package ctable
  :ensure t)


(use-package pkg-info
  :ensure t)


(use-package flx
  :ensure t)


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


(use-package imenu-list
  :ensure t
  :bind (("C-\"" . imenu-list-smart-toggle)))


(use-package persistent-scratch
  :ensure t
  :bind (("C-c M-s" . persistent-scratch-save)
         ("C-c M-r" . persistent-scratch-restore)))


(use-package filladapt
  :ensure t)


(use-package diminish
  :ensure t)


(use-package lilypond-mode
  :ensure nil
  :load-path "/Users/vineet/emacs/site/vendor/lilypond/"
  :mode ("\\.ly\\'" . LilyPond-mode)
  :custom
  (LilyPond-lilypond-command "lilypond")
  ;; FIXME: Open in emacs buffer
  (LilyPond-pdf-command "open"))

(use-package ledger-mode
  :ensure t
  :config
  ;; Store backups for ledger files in a separate dir.
  ;;
  ;; Why? Most of my org files are synced using dropbox so this
  ;; prevents the dropbox dir from getting clutterred.
  (add-to-list 'backup-directory-alist
               `("[^.]+\.ledger" . ,temporary-file-directory)))


(use-package elfeed
  :ensure t
  :config
  (setq elfeed-feeds
        '("https://ochagavia.nl/blog/index.xml"
          "https://blog.rust-lang.org/inside-rust/feed.xml"
          "https://notes.eatonphil.com/rss.xml"
          ))
  (global-set-key (kbd "C-x w") 'elfeed))
