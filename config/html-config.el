;;; Jinja2 Templates
(require 'jinja2-mode)

;; For all .html under /python/../templates/, jinja2-mode activated on
;; find-file
(add-hook
 'find-file-hook
 (lambda ()
   (when (and (string-match-p "/python/" (buffer-file-name))
              (string-match-p "/templates/" (buffer-file-name)))
     (jinja2-mode))))

;; Needs to be selectively activated in case of other html file using
;; C-c j
(define-key html-mode-map (kbd "C-c j") 'jinja2-mode)

