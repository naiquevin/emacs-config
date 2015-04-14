;; Place to add config for random modes where adding a separate file
;; each one would be an overkill

;; Flymake
(add-hook 'find-file-hook 'flymake-find-file-hook)
(setq flymake-gui-warnings-enabled nil)


;; unique buffer names
(require 'uniquify)                      ; uniquify is packed in emacs
(setq uniquify-buffer-name-style 'post-forward)
(setq uniquify-separator "|")
(setq uniquify-after-kill-buffer-p t)    ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers


;; ace-jump-mode
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)


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
