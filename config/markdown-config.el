;; Config for setting markdown mode and stuff

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


;; Turn on flyspell mode when editing markdown files
(add-hook 'markdown-mode-hook 'flyspell-mode)
(add-hook 'gfm-mode-hook 'flyspell-mode)
