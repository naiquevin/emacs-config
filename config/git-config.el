;; Config for git and magit


(defun naiq/magit-set-faces ()
  (set-face-foreground 'magit-section-heading "#b58900")
  (set-face-attribute 'magit-section-highlight nil
                      :background 'unspecified
                      :foreground 'unspecified)

  (set-face-foreground 'magit-hash "#2aa198")
  (set-face-foreground 'magit-log-author "#cb4b16")
  (set-face-foreground 'magit-log-date "#2aa198")
  (set-face-foreground 'magit-tag "#cb4b16")
  (set-face-foreground 'magit-branch-local "#268bd2")
  (set-face-foreground 'magit-branch-remote "#268bd2")
  (set-face-foreground 'magit-branch-current "#eee8d5")

  (set-face-attribute 'magit-diff-added nil
                      :background "#073642"
                      :foreground "#859900")

  (set-face-attribute 'magit-diff-added-highlight nil
                      :background "#073642"
                      :foreground "#859900")

  (set-face-attribute 'magit-diff-removed nil
                      :background "#073642"
                      :foreground "#dc322f")

  (set-face-attribute 'magit-diff-removed-highlight nil
                      :background "#073642"
                      :foreground "#dc322f")

  (set-face-attribute 'magit-diff-context nil
                      :background 'unspecified
                      :foreground "#586e75")
  (set-face-attribute 'magit-diff-context-highlight nil
                      :background 'unspecified
                      :foreground "#586e75")

  (set-face-attribute 'magit-diff-file-heading nil
                      :background 'unspecified
                      :foreground "#839496"
                      :weight 'unspecified)

  (set-face-attribute 'magit-diff-file-heading-highlight nil
                      :background 'unspecified
                      :foreground "#93a1a1"
                      :weight 'unspecified)

  (set-face-attribute 'magit-diff-hunk-heading nil
                      :background "#839496"
                      :foreground "#073642")

  (set-face-attribute 'magit-diff-hunk-heading-highlight nil
                      :background "#839496"
                      :foreground "#073642"
                      :bold t)

  (set-face-attribute 'magit-diff-lines-heading nil
                      :background "#268bd2")

  (set-face-attribute 'magit-log-graph nil
                      :background nil))


(use-package magit
  :ensure t
  :hook ((magit-mode . naiq/magit-set-faces))
  :bind (("C-c C-g" . magit-status)
         ("C-c M-g" . magit-status)))


(use-package git-commit
  :ensure t)


(use-package gitconfig-mode
  :ensure t)


(use-package gitignore-mode
  :ensure t)
