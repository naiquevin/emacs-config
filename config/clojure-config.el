;; Config for clojure editing

;; Enable rainbow delimeters in clojure and nrepl buffers
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'nrepl-mode-hook 'rainbow-delimiters-mode)

;; Turn on eldoc mode
(add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)

;; Turn on paredit mode on clojure and nrepl modes
(add-hook 'clojure-mode-hook 'enable-paredit-mode)
(add-hook 'nrepl-mode-hook 'enable-paredit-mode)
