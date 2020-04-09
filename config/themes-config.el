;;; Themes

;; custom-theme-load-path is new in Emacs24
(add-to-list 'custom-theme-load-path my/themes-dir)
(add-to-list 'custom-theme-load-path
             (expand-file-name "solarized" my/themes-dir))
(add-to-list 'custom-theme-load-path
             (expand-file-name "tomorrow-night" my/themes-dir))


;; solarized-dark - current theme of choice
(load-theme 'solarized t)


(defun set-background-mode (frame theme mode)
  (set-frame-parameter nil 'background-mode mode)
  (enable-theme theme))


(if (display-graphic-p)
    (set-background-mode nil 'solarized 'dark)
  (add-hook 'after-make-frame-functions
            (lambda (frame)
              (set-background-mode frame 'solarized 'dark))))
