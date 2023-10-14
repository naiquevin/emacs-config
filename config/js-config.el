;;; Javascript

(use-package js2-mode
  :ensure t

  :init
  (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
  (load (expand-file-name "nd-js" my/self-lib-dir))

  :config
  (setq js-indent-level 2)
  (setq js2-basic-offset 2)

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
