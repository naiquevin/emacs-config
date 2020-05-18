;; Config for Yasnippet mode

(use-package yasnippet-snippets)

(use-package yasnippet
  :requires yasnippet-snippets
  :config
  (setq yas-snippet-dirs
        (list (expand-file-name "snippets"
                                my/self-lib-dir) ;; personal snippets
              (expand-file-name "snippets"
                                my/priv-dir) ;; private snippets (not tracked in git)
              (expand-file-name "yasnippet-snippets-20200508.936/snippets"
                                my/elpa-dir)))
  (yas-global-mode 1))
