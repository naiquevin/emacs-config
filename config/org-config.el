;;; My OrgMode Setting

(use-package org
  :config
  ;; Basics
  (setq org-directory "~/Dropbox/org")
  (setq org-hide-leading-stars t)       ; hide leading stars
  (setq org-adapt-indentation t) ; indent relative to the outline level
  (setq org-list-allow-alphabetical t)
  (setq org-log-done t)   ; display time when TODO was changed to DONE
  (setq org-id-method 'uuid)

  ;; @TODO: Fix on windows
  ;; (setq org-id-uuid-program my/uuidgen-program)

  ;; Store backups for org files in a separate dir.
  ;;
  ;; Why? Most of my org files are synced using dropbox so this
  ;; prevents the dropbox dir from getting clutterred.
  (add-to-list 'backup-directory-alist
               `("[^.]+\.org" . ,temporary-file-directory))

  ;;---------------------------------------------------------

  ;; Appearance related config
  (setq org-todo-keyword-faces
        '(("TODO" :foreground "#dc322f" :weight normal)
          ("DONE" :foreground "#859900" :weight normal)
          ("PROG" :foreground "#268bd2" :weight bold)
          ("WAIT" :foreground "#cb4b16" :weight bold)
          ("NEXT" :foreground "#6c71c4" :weight normal)))

  ;;---------------------------------------------------------

  ;; Agenda related config
  (setq org-agenda-files
        (mapcar (lambda (x)
                  (concat org-directory "/"  x))
                '("finance/"
                  "projects/"
                  "inbox.org")))

  ;; Org Capture
  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "inbox.org" "Inbox")
           ;; Note that the 2 spaces before `SCHEDULE` and `%i` help
           ;; in aligning the content
           "* TODO %?\n  SCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))\n  %i\n")))

  ;; Setup refile targets
  (setq org-refile-targets
        ;; top level headlines in current buffer
        '((nil :maxlevel . 4)
          ;; top level headlines in other agenda files
          (org-agenda-files :maxlevel . 1)))

  (setq org-outline-path-complete-in-steps nil)
  (setq org-refile-use-outline-path t)

  ;; Open agenda view in current window
  (setq org-agenda-window-setup (quote current-window))

  ;; Don't show tasks as scheduled if deadline is shown
  (setq org-agenda-skip-scheduled-if-deadline-is-shown t)

  (setq org-agenda-custom-commands
        '(("i" "Agenda view for Inbox (to be refiled)" agenda ""
           ((org-agenda-category-filter-preset '("+inbox"))))))

  ;;---------------------------------------------------------

  ;; org crypt related config
  (require 'org-crypt)
  (org-crypt-use-before-save-magic)
  (setq org-tags-exclude-from-inheritance '("crypt"))
  (setq org-crypt-key "naikvin@gmail.com")

  ;;---------------------------------------------------------

  ;; global key bindings
  (global-set-key "\C-cl" 'org-store-link)
  (global-set-key "\C-cc" 'org-capture)
  (global-set-key "\C-ca" 'org-agenda)
  (global-set-key "\C-cb" 'org-iswitchb)
  (global-set-key "\C-co" 'org-mark-ring-goto)
  (global-set-key (kbd "s-<f11>") 'org-clock-goto)
  (global-set-key (kbd "<f5>")
                  (lambda ()
                    "Quick capture for most commonly used template"
                    (interactive)
                    (org-capture nil "t")))

  ;;---------------------------------------------------------

  :hook
  (org-mode . (lambda () (hl-line-mode 1)))

  :bind
  (("C-c i" . org-id-get-create)))


(use-package org-edna
  :ensure t
  :after (diminish)
  :diminish org-edna-mode)


(use-package org-contrib
  :ensure t
  :config
  (org-edna-mode))


(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory "~/OrgRoamNotes")
  :init
  (setq org-roam-v2-ack t)
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today))
  :config
  (org-roam-setup)
  (org-roam-db-autosync-mode)
  (setq org-roam-dailies-directory "daily/"))


(use-package org-roam-ui
  :ensure t)
