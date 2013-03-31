;;; Javascript 

;; js-mode (earlier known as espresso mode, now packaged with emacs)
(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))

;; json (Josh's lite weight json major mode)
(autoload 'json-mode "json-mode.el" "Major mode for editing json files" t)
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))

;; natural docs for js
(load "naiquevin/nd-js")
(add-hook 'js-mode-hook 
          (lambda () (local-set-key (kbd "C-c d") #'nd-js-doc)))

