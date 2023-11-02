;; Config related to lsp (Language server protocol)

(use-package eglot
  :ensure t
  :config
  (add-to-list 'eglot-stay-out-of 'flymake)
  (setq eglot-ignored-server-capabilities
        '(:documentHighlightProvider
          :signatureHelpProvider
          :inlayHintProvider)))


(use-package flycheck-eglot
  :ensure t
  :after (flycheck eglot)
  :config
  (global-flycheck-eglot-mode 1))
