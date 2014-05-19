;;; Jinja2 Templates

;; For all .html under /python/../templates/, jinja2-mode activated on
;; find-file
(add-hook
 'find-file-hook
 (lambda ()
   (when (and (string= (file-name-extension (buffer-file-name)) "html")
              (string-match-p "/python/" (buffer-file-name))
              (string-match-p "/templates/" (buffer-file-name)))
     (jinja2-mode))))

