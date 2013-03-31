;;; Themes

;; custom-theme-load-path is new in Emacs24
(add-to-list 'custom-theme-load-path "~/emacs/site/themes")
(add-to-list 'custom-theme-load-path "~/emacs/site/themes/solarized")
(add-to-list 'custom-theme-load-path "~/emacs/site/themes/tomorrow-night")

;; solarized-dark - current theme of choice
(load-theme 'solarized-dark t)
