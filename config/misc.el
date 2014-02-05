;;; Miscellaneous configuration

;; unique buffer names
(require 'uniquify)                      ; uniquify is packed in emacs
(setq uniquify-buffer-name-style 'post-forward)
(setq uniquify-separator "|")
(setq uniquify-after-kill-buffer-p t)    ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

;; ace-jump-mode
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; Git modes for editing git based buffers
;; https://github.com/lunaryorn/git-modes
(require 'git-commit-mode)
(require 'gitignore-mode)
(require 'gitconfig-mode)

;; Markdown mode
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.markdown" . markdown-mode) auto-mode-alist))

;; Enable gfm-mode (github-flavoured-markdown) if it's a README.md
;; file inside of a git repository
(add-hook
 'find-file-hook
 (lambda ()
   (when (and (string-match "README.md" (buffer-name))
              (file-exists-p
               (concat (file-name-directory (buffer-file-name)) ".git")))
     (gfm-mode))))


;; Org mode
(load "config/org-config.el")

;; Yasnippet mode
(setq yas-snippet-dirs
      '("~/emacs/site/naiquevin/snippets"                  ;; personal snippets
        "~/.emacs.d/elpa/yasnippet-20130722.1832/snippets" ;; the default collection
        ))

(add-hook 'after-init-hook (lambda ()
                             (progn
                               (yas-global-mode 1))))

(setq erc-nick "naiquevin")

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
