;; Config related to lsp (Language server protocol)

(use-package eglot
  :ensure t)


(use-package flycheck-eglot
  :ensure t
  :after (flycheck eglot))
