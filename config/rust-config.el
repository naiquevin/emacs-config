;; Config for Rust programming


(setq my/cargo-dir (expand-file-name "~/.cargo"))


(defun naiq/rust-setup-read-only-files ()
  (when (and (or (string= (file-name-nondirectory (buffer-file-name)) "Cargo.lock")
                 (naiq/dependency-crate-buffer-p))
             (not buffer-read-only))
    (read-only-mode 1)))


(defun naiq/dependency-crate-buffer-p (&optional buf)
  (let ((filepath (buffer-file-name (or buf (current-buffer))))
        (cargo-registry-path (expand-file-name "registry/src" my/cargo-dir)))
    (string-prefix-p cargo-registry-path filepath)))


(use-package rust-mode
  :ensure t

  :config
  ;; Open cargo lock file in read-only mode
  ;;
  ;; @TODO: Find out why defining this in the `:hook` section doesn't
  ;; work
  (add-hook 'find-file-hook 'naiq/rust-setup-read-only-files)

  :hook
  (rust-mode . electric-pair-mode)
  (rust-mode . turn-on-auto-revert-mode)
  (rust-mode . eldoc-mode)
  (rust-mode . flycheck-mode)
  (rust-mode . company-mode)
  ;; @TODO: Check if the current file is in a typical rust project dir
  ;; (using cargo) and initialize eglot only in that case. This is to
  ;; allow creating random rustc files which can be simply compiled
  ;; and run using rustc
  (rust-mode . (lambda ()
                 (when (not (naiq/dependency-crate-buffer-p))
                   (eglot-ensure))))
  (rust-mode . filladapt-mode))


(use-package rustic
  :ensure t
  :init
  (setq rustic-lsp-setup-p nil)

  :config
  ;; @NOTE: Setting the `rustic-lsp-client' to eglot for consistency but
  ;; rustic will not configure eglot for rust files because
  ;; `rustic-lsp-setup-p' is set to nil in the init block.
  ;;
  ;;  This is done so as to be able to call `eglot-ensure' with some
  ;;  additional logic. Refer to the hooks section of `rust-mode'
  ;;  above.
  (setq rustic-lsp-client 'eglot))


(use-package cargo
  :ensure t
  :hook
  (rust-mode . cargo-minor-mode))


(use-package rust-playground
  :ensure t
  :bind (("C-c e" . rust-playground-exec)
         ("C-c t" . rust-playground-switch-between-cargo-and-main)))
