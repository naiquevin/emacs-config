;; Config for clojure editing

;; Enable rainbow delimeters in clojure and nrepl buffers
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)

;; Turn on eldoc mode
(add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)

;; Turn on paredit mode on clojure and nrepl modes
(add-hook 'clojure-mode-hook 'enable-paredit-mode)
(add-hook 'cider-repl-mode-hook 'enable-paredit-mode)

;; Prevent nrepl connection buffers appearing while buffer switching
(setq nrepl-hide-special-buffers t)

(setq cider-repl-history-file ".lein-repl-history")

;; bind shortcut to open nrepl connection browser
(add-hook 'cider-repl-mode-hook
          (lambda () (define-key cider-repl-mode-map
                       (kbd "C-c M-b")
                       'nrepl-connection-browser)))
