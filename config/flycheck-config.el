;;; Config for the flycheck mode

(require 'flycheck)

;; Disable the error indicator on the fringe
(setq flycheck-indication-mode nil)


;; Customize faces (Colors are copied from solarized definitions)

(set-face-attribute 'flycheck-warning nil
                    :background "#b58900"
                    :foreground "#262626"
                    :underline nil)

(set-face-attribute 'flycheck-error nil
                    :background "#dc322f"
                    :foreground "#262626"
                    :underline nil)




