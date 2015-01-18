;; Config for emacs lisp editing

;; Rainbow delimiters (for emacs lisp)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)

;; Paredit mode for emacs lisp mode and ielm
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'ielm-mode-hook 'enable-paredit-mode)

