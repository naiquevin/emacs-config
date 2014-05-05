;; Config for Yasnippet mode

(setq yas-snippet-dirs
      (list (expand-file-name "snippets"
                              my/self-lib-dir) ;; personal snippets
            (expand-file-name "yasnippet-20130722.1832/snippets"
                              my/elpa-dir))) ;; the default collection

(add-hook 'after-init-hook (lambda () (yas-global-mode 1)))
