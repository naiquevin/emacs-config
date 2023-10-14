;; Config for Yasnippet mode

(use-package yasnippet-snippets)

(use-package yasnippet
  :after (diminish)
  :requires yasnippet-snippets
  :diminish yas-minor-mode
  :config
  (setq yas-snippet-dirs
        (list (expand-file-name "snippets"
                                my/self-lib-dir) ;; personal snippets
              ;; @TODO: Include this only if it exists
              (expand-file-name "snippets"
                                my/priv-dir) ;; private snippets (not tracked in git)
              ;; @TODO: Make the following dynamic
              (expand-file-name "yasnippet-snippets-20230314.2056/snippets"
                                my/elpa-dir)))
  (yas-global-mode 1))
