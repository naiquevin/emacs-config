;;; Javascript

(use-package js2-mode
  :ensure t

  :init
  (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
  (load (expand-file-name "nd-js" my/self-lib-dir))

  :config
  (setq js-indent-level 2)
  (setq js2-basic-offset 2)

  :hook
  (js2-mode . electric-pair-mode)

  :bind
  (("C-c d" . nd-js-doc)))


(use-package nodejs-repl
  :ensure t

  :after (js2-mode)

  :bind
  ;; @TODO: The following overrides expression evaluation of elisp as
  ;; well. Bind within local key map here -
  ;; https://github.com/jwiegley/use-package#binding-within-local-keymaps
  ;;
  ;;
  ;; (("C-x C-e" . nodejs-repl-send-last-sexp))
  (("C-c C-r" . nodejs-repl-send-region))
  (("C-c C-k" . nodejs-repl-send-buffer))
  (("C-c C-l" . nodejs-repl-load-file))
  (("C-c C-z" . nodejs-repl-switch-to-repl)))


(use-package web-mode
  :ensure t
  :mode ("\\.html\\'" "\\.vue\\'")
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
  (set-face-attribute 'web-mode-html-attr-equal-face nil :foreground "#839496"))


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
