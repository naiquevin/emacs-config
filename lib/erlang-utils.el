;;; Emacs config for Erlang development

(add-hook
 'find-file-hook
 (lambda ()
   ;; scheme's equivalent of python's `any`?
   (when (or (string-match "/ebin/.*\.app$" (buffer-file-name))
             (string-match "Emakefile" (buffer-name))
             (string-match "rebar.config" (buffer-name)))
     (erlang-mode))))
