;; Config for Rust programming


(setq my/cargo-dir (expand-file-name "~/.cargo"))


(defun naiq/read-only-cargo-lock-file ()
  (when (and (string= (file-name-nondirectory (buffer-file-name)) "Cargo.lock")
             (not buffer-read-only))
    (read-only-mode 1)))


(use-package rust-mode
  :ensure t

  :config
  ;; Open cargo lock file in read-only mode
  ;;
  ;; @TODO: Find out why defining this in the `:hook` section doesn't
  ;; work
  (add-hook 'find-file-hook 'naiq/read-only-cargo-lock-file)

  :hook
  (rust-mode . eldoc-mode)
  (rust-mode . flycheck-mode)
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
