;; Config for setting markdown mode and stuff


(use-package markdown-mode
  :ensure t
  :mode (("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :config
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
  (setq markdown-list-indent-width 2))
