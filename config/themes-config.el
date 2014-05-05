;;; Themes

;; custom-theme-load-path is new in Emacs24
(add-to-list 'custom-theme-load-path my/themes-dir)
(add-to-list 'custom-theme-load-path
             (expand-file-name "solarized" my/themes-dir))
(add-to-list 'custom-theme-load-path
             (expand-file-name "tomorrow-night" my/themes-dir))

;; solarized-dark - current theme of choice
(load-theme 'solarized-dark t)
