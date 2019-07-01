;; Place to add config for random modes where adding a separate file
;; each one would be an overkill

;; unique buffer names
(require 'uniquify)                      ; uniquify is packed in emacs
(setq uniquify-buffer-name-style 'post-forward)
(setq uniquify-separator "|")
(setq uniquify-after-kill-buffer-p t)    ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers


;; Avy
(global-set-key (kbd "C-:") 'avy-goto-char)
(global-set-key (kbd "M-g f") 'avy-goto-line)
(global-set-key (kbd "M-g w") 'avy-goto-word-1)
(setq avy-background nil)


;; ace-window
(global-set-key (kbd "C-c q") 'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))


;; Utilities for effective window management
(require 'toggle-window-split)
(require 'transpose-windows)


;; Multiple cursors
;; (require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


;; open link in the default browser
(global-set-key (kbd "C-.") 'browse-url-at-point)


;; fire up a google search
(global-set-key (kbd "C-c g") 'google-search)


;; edit as sudo
(global-set-key (kbd "C-c f") 'sudo-edit)


;; Turn on flyspell mode when editing ReST docs
(add-hook 'rst-mode-hook 'flyspell-mode)


;; Open Vagrantfile in Ruby mode
(setq auto-mode-alist (cons '("Vagrantfile" . ruby-mode) auto-mode-alist))

(add-to-list 'auto-mode-alist '("\\.ledger$" . ledger-mode))


;; persistent scratch
(global-set-key (kbd "C-c M-s") 'persistent-scratch-save)
(global-set-key (kbd "C-c M-r") 'persistent-scratch-restore)

(require 'yaml-path)
(add-hook 'yaml-mode-hook
          '(lambda ()
             (define-key yaml-mode-map (kbd "C-c C-p") 'yaml-path/path)))
