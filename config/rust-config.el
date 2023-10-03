;; Config for Rust programming


(setq my/cargo-dir (expand-file-name "~/.cargo"))


(use-package rust-mode
  :ensure t

  :config
  (setq eglot-ignored-server-capabilities
        '(:documentHighlightProvider
          :signatureHelpProvider
          :inlayHintProvider))

  :hook
  (rust-mode . eldoc-mode)
  (rust-mode . company-mode)
  ;; @TODO: Check if the current file is in a typical rust project dir
  ;; (using cargo) and initialize eglot only in that case. This is to
  ;; allow creating random rustc files which can be simply compiled
  ;; and run using rustc
  (rust-mode . eglot-ensure)
  (rust-mode . filladapt-mode))


(use-package rustic
  :ensure t
  :config
  (setq rustic-lsp-client 'eglot))


(use-package cargo
  :ensure t
  :hook
  (rust-mode . cargo-minor-mode))


(use-package rust-playground
  :ensure t)
