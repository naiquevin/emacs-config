;;; Javascript 

;; js2-mode
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; json (Josh's lite weight json major mode) (Installed via
;; package-install)
(require 'json-mode)
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))

;; natural docs for js
(load (expand-file-name "nd-js" my/self-lib-dir))
(add-hook 'js2-mode-hook
          (lambda () (local-set-key (kbd "C-c d") #'nd-js-doc)))

