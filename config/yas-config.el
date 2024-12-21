;; Config for Yasnippet mode

(use-package yasnippet-snippets
  :ensure t)

(use-package yasnippet
  :ensure t
  :after (diminish)
  :requires yasnippet-snippets
  :diminish yas-minor-mode

  :config
  (setq yas-snippet-dirs
        ;; Snippets can possibly be loaded from 4 different places.
        ;;
        ;; Order matters (Refer to documentation of
        ;; `yas-snippet-dirs`)
        (-filter (lambda (dir) dir)
                 (list (expand-file-name "snippets" user-emacs-directory)

                       ;; personal snippets
                       (expand-file-name "snippets" my/self-lib-dir)

                       ;; private snippets (not tracked in git)
                       (let ((priv-snip-dir (expand-file-name "snippets" my/priv-dir)))
                         (when (file-directory-p priv-snip-dir)
                           priv-snip-dir))

                       ;; yasnippet-snippets
                       (concat (file-name-as-directory (elpa-pkg-dir "yasnippet-snippets"))
                               "snippets")
                       )))
  (yas-global-mode 1))

(use-package axy
  :ensure nil
  :requires (yasnippet dash)
  :after (yasnippet)
  :load-path my/self-lib-dir
  :config
  (global-set-key (kbd "C-c C-;") 'axy/find-&-expand-snippet))
