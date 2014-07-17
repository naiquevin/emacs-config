;; Config for git integration

;; Git modes for editing git based buffers
;; https://github.com/lunaryorn/git-modes
(require 'git-commit-mode)
(require 'gitignore-mode)
(require 'gitconfig-mode)


;; magit
(global-set-key (kbd "C-c M-g") 'magit-status)
