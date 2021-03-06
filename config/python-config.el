;;; Python

;; virtualenvwrapper.el
(use-package virtualenvwrapper
  :ensure t
  :config
  (venv-initialize-interactive-shells)
  (setq venv-location "~/.virtualenvs/")
  (setq-default mode-line-format
                (append mode-line-format '((:exec venv-current-name)))))


;; Autocomplete/Jedi Setup
(use-package jedi
  :ensure t

  :init
  (setq jedi:setup-keys t)
  (setq jedi:use-shortcuts t)
  (setq jedi:complete-on-dot t)
  ;; show function signatures in mini-buffer instead of popup
  (setq jedi:tooltip-method nil)

  :hook ((python-mode . jedi:setup)
         (inferior-python-mode . jedi:setup)))


(use-package pytest
  :ensure t
  :bind ("C-c C-y" . pytest-module))


;; Set ipython as the python interpreter
(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args "--colors NoColor --simple-prompt"
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code "from IPython.core.completerlib import module_completion"
 python-shell-completion-string-code "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")


;; Electric pairs
(add-hook 'python-mode-hook 'electric-pair-mode)

;; Smartparens for python
(add-hook 'python-mode-hook 'smartparens-mode)

;; Flycheck
(add-hook 'python-mode-hook 'flycheck-mode)


;; Enable rainbow-delimiters in python-mode
(add-hook 'python-mode-hook 'rainbow-delimiters-mode)


;; sphinx-doc
(add-hook 'python-mode-hook (lambda ()
                              (require 'sphinx-doc)
                              (sphinx-doc-mode t)))
