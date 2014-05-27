;;; Config for the flycheck mode

(require 'flycheck)

;; Disable the error indicator on the fringe
(setq flycheck-indication-mode nil)

;; disable automatic syntax checks on new line
(setq flycheck-check-syntax-automatically '(save
                                            idle-change
                                            mode-enabled))

;; Immediate syntax checking quite annoying. Slow it down a bit.
(setq flycheck-idle-change-delay 2.0)


;; Customize faces (Colors are copied from solarized definitions)

(set-face-attribute 'flycheck-warning nil
                    :background "#b58900"
                    :foreground "#262626"
                    :underline nil)

(set-face-attribute 'flycheck-error nil
                    :background "#dc322f"
                    :foreground "#262626"
                    :underline nil)
