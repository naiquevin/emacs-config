;;; My OrgMode Setting

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-hide-leading-stars t) ; hide leading stars
(setq org-log-done t) ; display time when TODO was changed to DONE

;; Customizing the org directory
(setq org-directory "~/Dropbox/org")

;; Agenda files
(setq org-agenda-files (list (concat org-directory "/" "gtd.org")))

;; Org Capture
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "gtd.org" "Tasks")
         "* TODO %?\n %i\n")))




