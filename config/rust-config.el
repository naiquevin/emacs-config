;; Config for Rust programming


(setq my/cargo-dir (expand-file-name "~/.cargo"))


(use-package rust-mode
  :ensure t

  :hook
  (rust-mode . eldoc-mode)
  (rust-mode . eglot-ensure))


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
