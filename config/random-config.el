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


(add-to-list 'auto-mode-alist '("\\.ledger$" . ledger-mode))


(require 'yaml-path)
(add-hook 'yaml-mode-hook
          (lambda ()
            (define-key yaml-mode-map (kbd "C-c C-p") 'yaml-path/path)))


(defun naiq/youtube-play-pause ()
  (interactive)
  (shell-command "playerctl play-pause"))

(defun naiq/youtube-rewind ()
  (interactive)
  (shell-command "playerctl pause && playerctl position $(echo $(playerctl position) | awk '{v=int($1)-15; print (v<0)?0:v}') && playerctl play"))

(define-prefix-command 'naiq/media-map)
(global-set-key (kbd "C-c m") 'naiq/media-map)
(define-key naiq/media-map (kbd "p") 'naiq/youtube-play-pause)
(define-key naiq/media-map (kbd "b") 'naiq/youtube-rewind)



