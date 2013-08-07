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
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t) 
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
(add-to-list 'load-path "~/emacs/site/yasnippet")
(require 'yasnippet)

(setq yas-snippet-dirs
      '("~/emacs/site/naiquevin/snippets" ;; personal snippets
        "~/emacs/site/yasnippet/snippets" ;; the default collection
        ))

(yas-global-mode 1)

;; Nginx mode for editing nginx conf files
(require 'nginx-mode)

(setq erc-nick "naiquevin")

