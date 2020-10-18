;; Config for Rust programming


(setq my/cargo-dir (expand-file-name "~/.cargo"))


(use-package rust-mode
  :ensure t
  :init
  (setq lsp-rust-rls-server-command (expand-file-name "bin/rls" my/cargo-dir))
  (with-eval-after-load "lsp-mode"
    (require 'lsp-rust))

  :config
  (add-hook 'rust-mode-hook #'eldoc-mode)

  :hook
  (rust-mode . lsp))


(use-package cargo
  :ensure t
  :hook
  (rust-mode . cargo-minor-mode))


(use-package racer
  :ensure t
  :init
  (setq racer-rust-src-path
        (let* ((rustc (expand-file-name "bin/rustc" my/cargo-dir))
               (sysroot (string-trim
                         (shell-command-to-string
                          (concat rustc " --print sysroot"))))
               (lib-path (concat sysroot "/lib/rustlib/src/rust/library"))
               (src-path (concat sysroot "/lib/rustlib/src/rust/src")))
          (or (when (file-exists-p lib-path) lib-path)
              (when (file-exists-p src-path) src-path))))
  :config
  ;;; Using lsp-rust instead of racer now. But keeping racer too
  ;;; because lsp-mode falls back to racer for some functionality
  ;; (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode))
