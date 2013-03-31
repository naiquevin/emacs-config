;;; Emacs config for Erlang development

(add-hook
 'find-file-hook
 (lambda ()
   ;; scheme's equivalent of python's `any`?
   (when (or (string-match "/ebin/.*\.app$" (buffer-file-name))
             (string-match "/src/.*\.app.src$" (buffer-file-name))
             (string-match "Emakefile" (buffer-name))
             (string-match "rebar.config" (buffer-name)))
     (erlang-mode))))

(defun flymake-erlang-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
		     'flymake-create-temp-inplace))
	 (local-file (file-relative-name temp-file
		(file-name-directory buffer-file-name))))
    (list "/home/vineet/emacs/site/naiquevin/eflymake" (list local-file))))

;; (add-to-list 'flymake-allowed-file-name-masks '("\\.erl\\'" flymake-erlang-init))
