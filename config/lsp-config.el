;; Config related to lsp (Language server protocol)

(use-package eglot
  :ensure t
  :config
  (setq eglot-ignored-server-capabilities
        '(:documentHighlightProvider
          :signatureHelpProvider
          :inlayHintProvider)))


(use-package flycheck-eglot
  :ensure t
  :after (flycheck eglot))
