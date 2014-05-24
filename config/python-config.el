;;; Python

;; Flycheck
(add-hook 'python-mode-hook 'flycheck-mode)


;; virtualenvwrapper.el
;; (require 'virtualenvwrapper)
(venv-initialize-interactive-shells)
(setq venv-location "~/.virtualenvs/")
(setq-default mode-line-format
              (append mode-line-format '((:exec venv-current-name))))


;; Set ipython as the python interpreter
(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args "--colors NoColor"
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")


;; Enable rainbow-delimiters in python-mode
(add-hook 'python-mode-hook 'rainbow-delimiters-mode)
(add-hook 'inferior-python-mode-hook 'rainbow-delimiters-mode)


;; Autocomplete/Jedi Setup
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'inferior-python-mode-hook 'jedi:setup)

(setq jedi:setup-keys t)


;; sphinx-doc
(add-hook 'python-mode-hook (lambda ()
                              (require 'sphinx-doc)
                              (sphinx-doc-mode t)))
