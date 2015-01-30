;; Config for Yasnippet mode

(setq yas-snippet-dirs
      (list (expand-file-name "snippets"
                              my/self-lib-dir) ;; personal snippets
            (expand-file-name "snippets"
                              my/priv-dir) ;; private snippets (not tracked in git)
            (expand-file-name "yasnippet-20141223.303/snippets"
                              my/elpa-dir))) ;; the default collection

(yas-global-mode 1)
