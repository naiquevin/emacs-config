;;; Jinja2 Templates

;; @TODO: Extend the following code so that a static var can be
;; defined with a list of project paths and jinja2-mode should be
;; enabled for all html files under that projet.
(add-hook
 'find-file-hook
 (lambda ()
   (when (and (string= (file-name-extension (buffer-file-name)) "html")
              (projectile-project-root)
              (string-match-p (expand-file-name "~/blog/blog-src")
                              (projectile-project-root)))
     (jinja2-mode))))

