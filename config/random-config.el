;; Place to add config for random modes where adding a separate file
;; each one would be an overkill

;; Utilities for effective window management
(require 'toggle-window-split)
(require 'transpose-windows)


;; open link in the default browser
(global-set-key (kbd "C-.") 'browse-url-at-point)


;; fire up a google search
(global-set-key (kbd "C-c g") 'google-search)


;; edit as sudo
(global-set-key (kbd "C-c f") 'sudo-edit)


;; Turn on flyspell mode when editing ReST docs
(add-hook 'rst-mode-hook 'flyspell-mode)


;; Open Vagrantfile in Ruby mode
(setq auto-mode-alist (cons '("Vagrantfile" . ruby-mode) auto-mode-alist))

(add-to-list 'auto-mode-alist '("\\.ledger$" . ledger-mode))


(require 'yaml-path)
(add-hook 'yaml-mode-hook
          '(lambda ()
             (define-key yaml-mode-map (kbd "C-c C-p") 'yaml-path/path)))
