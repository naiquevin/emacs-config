;; Config for clojure editing


(use-package flycheck-clj-kondo
  :ensure t)


(use-package clojure-mode
  :ensure t
  :config
  (add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'clojure-mode-hook 'eldoc-mode)
  (add-hook 'clojure-mode-hook 'enable-paredit-mode)
  (add-hook 'clojure-mode-hook 'flycheck-mode)
  (require 'flycheck-clj-kondo))


(defun cider-load-open-buffers ()
  "Loads all open clojure buffers in the project.

Requires projectile to limit the clojure buffers in the current
project."
  (interactive)
  (dolist (buf (projectile-project-buffers))
    (let ((buf-file-path (buffer-file-name buf)))
      (when (and buf-file-path
                 (string= (file-name-extension buf-file-path) "clj")
                 (not (string= (file-name-nondirectory buf-file-path)
                               "project.clj")))
        (cider-load-buffer buf)))))


(use-package cider
  :ensure t
  :init
  ;; Prevent nrepl connection buffers appearing while buffer switching
  (setq nrepl-hide-special-buffers t)
  (setq cider-repl-history-file ".lein-repl-history")
  (setq cider-repl-clear-help-banner nil)

  :config
  (add-hook 'cider-repl-mode-hook 'enable-paredit-mode)
  (add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'cider-repl-mode-hook
            (lambda () (define-key cider-repl-mode-map
                         (kbd "C-c M-b")
                         'sesman-browser)))

  :bind
  (:map cider-mode-map
        ("C-c M-k" . cider-load-open-buffers)))
