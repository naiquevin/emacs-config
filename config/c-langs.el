;; Config for C/C++ programming


(use-package cc-mode
  :hook
  (c-mode . eglot-ensure))
