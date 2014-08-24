;; Config for git integration

;; magit
(global-set-key (kbd "C-c C-g") 'magit-status)
(global-set-key (kbd "C-c M-g") 'magit-status)


;; Modify default magit faces to look good on solarized dark theme
(add-hook 'magit-mode-hook
          (lambda ()
            (set-face-foreground 'magit-log-sha1 "#b58900")
            (set-face-foreground 'magit-log-author "#cb4b16")
            (set-face-foreground 'magit-log-date "#2aa198")

            (set-face-attribute 'magit-branch nil
                                :background 'unspecified
                                :foreground "#268bd2")))
