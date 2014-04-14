;;; Python

;; Pyflakes
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "pyflakes" (list local-file))))

  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pyflakes-init)))


;; virtualenvwrapper.el
(add-hook
 'after-init-hook
 (lambda ()
   (progn
     (require 'virtualenvwrapper)
     (venv-initialize-interactive-shells)
     (setq venv-location "~/.virtualenvs/")
     (setq-default mode-line-format
                   (append mode-line-format '((:exec venv-current-name)))))))


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

;; Autocomplete/Jedi Setup
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)


;; The sphinx-doc mode is required upon the after-init-hook because of
;; it's dependence on the 3rd party lib `s.el` which is loaded by elpa
;; after init.el. This is only a temporary arrangement until
;; sphinx-doc.el is itself added to elpa and loaded from there

(add-hook
 'after-init-hook
 (lambda ()
   (require 'sphinx-doc)
   (add-hook 'python-mode-hook
             (lambda () (local-set-key (kbd "C-c M-d") #'sphinx-doc)))))
