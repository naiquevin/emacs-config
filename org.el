;;; My OrgMode Setting

(setq load-path (cons "~/emacs/site/org-mode/lisp" load-path))
(setq load-path (cons "~/emacs/site/org-mode/contrib/lisp" load-path))
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-hide-leading-stars t) ; hide leading stars
(setq org-log-done t) ; display time when TODO was changed to DONE

;; Agenda files
(setq org-agenda-files (list "~/Dropbox/org/work-gtd.org"
                             "~/Dropbox/org/home-gtd.org"))



