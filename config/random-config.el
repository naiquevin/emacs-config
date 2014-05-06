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


;; Toggle window split
(require 'toggle-window-split)


;; Multiple cursors
(add-hook 'after-init-hook
          (lambda ()
            (progn
              (require 'multiple-cursors)
              (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
              (global-set-key (kbd "C->") 'mc/mark-next-like-this)
              (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
              (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))))


;; open link in the default browser
(global-set-key (kbd "C-.") 'browse-url-xdg-open)
