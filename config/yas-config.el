;; Config for Yasnippet mode

(use-package yasnippet-snippets)

(use-package yasnippet
  :requires yasnippet-snippets
  :config
  (setq yas-snippet-dirs
        (list (expand-file-name "snippets"
                                my/self-lib-dir) ;; personal snippets
              ;; @TODO: Include this only if it exists
              (expand-file-name "snippets"
                                my/priv-dir) ;; private snippets (not tracked in git)
              ;; @TODO: Make the following dynamic
              (expand-file-name "yasnippet-snippets-20230314.2056"
                                my/elpa-dir)))
  (yas-global-mode 1))
