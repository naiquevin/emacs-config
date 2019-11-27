;; Config for clojure editing

;; Enable rainbow delimeters in clojure and nrepl buffers
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)

;; Turn on eldoc mode
(add-hook 'clojure-mode-hook 'eldoc-mode)

;; Turn on paredit mode on clojure and nrepl modes
(add-hook 'clojure-mode-hook 'enable-paredit-mode)
(add-hook 'cider-repl-mode-hook 'enable-paredit-mode)

;; Prevent nrepl connection buffers appearing while buffer switching
(setq nrepl-hide-special-buffers t)

(setq cider-repl-history-file ".lein-repl-history")
(setq cider-repl-clear-help-banner nil)

;; bind shortcut to open nrepl connection browser
(add-hook 'cider-repl-mode-hook
          (lambda () (define-key cider-repl-mode-map
                       (kbd "C-c M-b")
                       'sesman-browser)))


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

(eval-after-load 'cider-mode
  '(define-key cider-mode-map (kbd "C-c M-k") 'cider-load-open-buffers))
