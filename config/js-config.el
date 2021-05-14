;;; Javascript 

;; js2-mode
;; (require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; json (Josh's lite weight json major mode) (Installed via
;; package-install)
;; (require 'json-mode)
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))
;; This sets the json indentation to 2 (default is 4)
(setq js-indent-level 2)
(add-hook 'json-mode-hook 'flycheck-mode)

;; natural docs for js
(load (expand-file-name "nd-js" my/self-lib-dir))
(add-hook 'js2-mode-hook
          (lambda () (local-set-key (kbd "C-c d") #'nd-js-doc)))

(setq js2-basic-offset 2)

(add-hook 'js2-mode-hook
          (lambda ()
            (define-key js2-mode-map (kbd "C-x C-e") 'nodejs-repl-send-last-sexp)
            (define-key js2-mode-map (kbd "C-c C-r") 'nodejs-repl-send-region)
            (define-key js2-mode-map (kbd "C-c C-k") 'nodejs-repl-send-buffer)
            (define-key js2-mode-map (kbd "C-c C-l") 'nodejs-repl-load-file)
            (define-key js2-mode-map (kbd "C-c C-z") 'nodejs-repl-switch-to-repl)))
