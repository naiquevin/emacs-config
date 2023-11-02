;;; Python programming environment

;; virtualenvwrapper.el
(use-package virtualenvwrapper
  :ensure t
  :config
  (venv-initialize-interactive-shells)
  (setq venv-location "~/.virtualenvs/")
  (setq-default mode-line-format
                (append mode-line-format '((:exec venv-current-name)))))


(defun naiq/venv-activate ()
  "Wrapper to activate a virtualenv. Supports activating a
virtualenv by `venv-lookup-names` in the projectile root dir or a
`venv-location` (as a fallback)

Depends on packages:

  - virtualenvwrapper
  - projectile
  - ivy
"
  (interactive)
  (let ((path (concat (projectile-project-root) ".venv")))
    (if (file-exists-p path)
        (ivy-read "Virtualenv found inside the project:" (cons path '())
                  :action (lambda (vdir)
                            ;; @NOTE: The following code is copied
                            ;; from `venv-workon` implementation
                            ;; inside virtualenvwrapper.el as it
                            ;; doesn't provide a function to activate
                            ;; a virtualenv by dir
                            (let ((vname (venv-dir-to-name vdir)))
                              ;; deactivate
                              (venv-deactivate)
                              ;; then switch
                              (setq venv-current-name vname)
                              ;; push it onto the history
                              (add-to-list 'venv-history venv-current-name)
                              ;; actually activate it
                              (venv--activate-dir vdir))))
      (venv-workon))))


(use-package pytest
  :ensure t
  :bind ("C-c C-y" . pytest-module))


(use-package sphinx-doc
  :ensure t
  :after (diminish)
  :diminish sphinx-doc-mode)


(use-package python
  :ensure t

  :after (smartparens
          rainbow-delimiters
          sphinx-doc
          flycheck-eglot
          projectile
          virtualenvwrapper)

  :config
  ;; Set ipython as the python interpreter
  (setq python-shell-interpreter "ipython"
        python-shell-interpreter-args "--colors NoColor --simple-prompt"
        python-shell-prompt-regexp "In \\[[0-9]+\\]: "
        python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
        python-shell-completion-native-enable nil
        python-shell-completion-setup-code "from IPython.core.completerlib import module_completion"
        python-shell-completion-string-code "';'.join(module_completion('''%s'''))\n"
        python-shell-completion-string-code "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

  (add-to-list 'eglot-server-programs
               `(python-mode . ("jedi-language-server"
                                ;; Set initial options to configure
                                ;; the active virtualenv (if any) as
                                ;; documented here -
                                ;; https://www.gnu.org/software/emacs/manual/html_mono/eglot.html#User_002dspecific-configuration
                                :initializationOptions
                                ,(lambda (s)
                                   (let ((ve (getenv "VIRTUAL_ENV")))
                                     (if ve
                                         `(:workspace (:environmentPath ,(concat ve "bin/python")))
                                       eglot-{}))))))

  :hook
  (python-mode . electric-pair-mode)
  (python-mode . smartparens-mode)
  (python-mode . smartparens-mode)
  (python-mode . rainbow-delimiters-mode)
  (python-mode . sphinx-doc-mode)
  (python-mode . flycheck-mode)
  (python-mode . company-mode)
  (python-mode . eglot-ensure)

  :bind
  (("C-c v" . naiq/venv-activate)))
