;; Config for editing Racket (& Scheme) files

;; Quack (Racket)
(require 'quack)
(setq quack-fontify-style 'emacs)

;; Rainbow delimiters (for scheme)
(add-hook 'scheme-mode-hook 'rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)

