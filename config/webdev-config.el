;;; Javascript

(use-package web-mode
  :ensure t
  :mode ("\\.html\\'" "\\.jinja\\'" "\\.vue\\'")
  :config
  ;; Adjust indentation
  (setq web-mode-style-padding 2)
  (setq web-mode-script-padding 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)

  ;; Adjust font faces to suite solarized dark theme
  (set-face-attribute 'web-mode-html-tag-bracket-face nil :foreground "#839496")
  (set-face-attribute 'web-mode-html-tag-face nil :foreground "#268bd2")
  (set-face-attribute 'web-mode-doctype-face nil :foreground "#859900")
  (set-face-attribute 'web-mode-html-attr-name-face nil :foreground "#b58900")
  (set-face-attribute 'web-mode-html-attr-custom-face nil :foreground "#cb4b16")
  (set-face-attribute 'web-mode-html-attr-equal-face nil :foreground "#839496")

  :hook
  (web-mode . electric-pair-mode))


;; @TODO: Extend the following code so that a static var can be
;; defined with a list of project paths and jinja2-mode should be
;; enabled for all html files under that projet.
(add-hook
 'find-file-hook
 (lambda ()
   (when (and (string= (file-name-extension (buffer-file-name)) "html")
              (projectile-project-root)
              (string-match-p (expand-file-name "~/blog/blog-src")
                              (projectile-project-root)))
     (jinja2-mode))))
