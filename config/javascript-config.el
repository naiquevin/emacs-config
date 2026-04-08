
(use-package js2-mode
  :ensure t

  :init
  (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
  (load (expand-file-name "nd-js" my/self-lib-dir))

  :config
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

;; Syntax highlighting for typescript is powered by treesitter. The
;; spec for language source is added in `prog-config.el`
;;
;; [ref: treesitter-language-sources]

(use-package typescript-ts-mode
  :ensure t

  :after (company flycheck-eglot)

  :config

  (add-to-list 'eglot-server-programs
               '((typescript-ts-mode js-mode js-ts-mode)
                 . ("typescript-language-server" "--stdio")))

  ;; @FIXME: Adding hooks using the `:hook` keyword doesn't work. It
  ;; causes recursive calls (excessive-lisp-nesting) whereas
  ;; `add-hook` works just fine.
  (add-hook 'typescript-ts-mode-hook
            (lambda ()
              (company-mode)
              (eglot-ensure)
              ))

  (add-to-list 'auto-mode-alist '("\\.tsx?$" . typescript-ts-mode)))

