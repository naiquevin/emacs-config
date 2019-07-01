;;; My OrgMode Setting

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-co" 'org-mark-ring-goto)

(setq org-hide-leading-stars t) ; hide leading stars
(setq org-log-done t) ; display time when TODO was changed to DONE

;; Customizing the org directory
(setq org-directory "~/Dropbox/org")

;; Agenda files
(setq org-agenda-files (mapcar (lambda (x)
                                 (concat org-directory "/"  x))
                               '("gtd.org"
                                 "work.org"
                                 "sideprojects.org"
                                 "ideas.org")))

;; Org Capture
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "gtd.org" "Tasks")
         ;; Note that the 2 spaces before `%i` help in aligning the content
         "* TODO %?\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))\n  %i\n")
        ("i" "Idea" entry (file+headline "gtd.org" "Ideas")
         "* %?\n")
        ("l" "Link" entry (file+headline "gtd.org" "Links")
         "* %?\n %i\n")

        ;; Helpshift specific prefixed keys
        ("h" "Templates for Helpshift tasks")
        ("ht" "Task" entry (file+olp "work.org" "Todo @ Helpshift" "Tasks")
         "* TODO %?\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))\n  %i - %a\n")))

;; Setup refile targets
(setq org-refile-targets
      ;; top level headlines in current buffer
      '((nil :maxlevel . 9)
        ;; top level headlines in other agenda files
        (org-agenda-files :maxlevel . 9)))

(setq org-outline-path-complete-in-steps nil)
(setq org-refile-use-outline-path t)

(setq org-completion-use-ido t)

;; Open agenda view in current window
(setq org-agenda-window-setup (quote current-window))

;; Don't show tasks as scheduled if deadline is shown
(setq org-agenda-skip-scheduled-if-deadline-is-shown t)

;; TODO faces
(setq org-todo-keyword-faces
      '(("TODO" :foreground "#dc322f" :weight bold)
        ("DONE" :foreground "#859900" :weight bold)
        ("WIP" :foreground "#b58900" :weight bold)
        ("BLOCKED" :foreground "#cb4b16" :weight bold)
        ("PARKED" :foreground "#586e75" :weight bold)
        ("IMPROV" :foreground "#268bd2" :weight bold)))

;; enable export to markdown
(eval-after-load "org"
  '(require 'ox-md nil t))
