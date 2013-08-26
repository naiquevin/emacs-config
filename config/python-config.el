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


;; Set ipython as the python interpreter
(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args "--colors NoColor"
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")


;; Enable rainbow-delimiters in python and inferior modes
(add-hook 'python-mode-hook 'rainbow-delimiters-mode)
(add-hook 'inferior-python-mode-hook 'rainbow-delimiters-mode)

;; Enable eldoc only in inferior-python-mode
(add-hook 'inferior-python-mode-hook 'turn-on-eldoc-mode)

