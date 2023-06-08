;;; Configuration for programming related modes


;; Show matching paren
(show-paren-mode t)

;; Enable which function mode
(which-function-mode t)

;; Basic indentation to 4 spaces
(setq c-basic-offset 4)

(add-hook 'c-mode-hook 'electric-pair-mode)


(use-package projectile
  :ensure t
  :custom
  (projectile-mode-line '(:eval (format " Project:%s" (projectile-project-name))))
  :config
  (projectile-mode +1)
  :bind-keymap
  ("C-c p" . projectile-command-map))


(use-package paredit
  :ensure t
  :config
  ;; Disable C-j keybinding of paredit as it overrides paredit-return
  ;; in ielm mode. C-j is redundant as M-j practically does the same
  ;; thing.
  (define-key paredit-mode-map (kbd "C-j") nil))


(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config))


(use-package rainbow-delimiters
  :ensure t)


(use-package dumb-jump
  :ensure t
  :bind (("C-c ." . dumb-jump-go)))


(use-package sqlformat
  :ensure t
  :config
  (setq sqlformat-command 'pgformatter)
  :bind (("C-c C-f" . sqlformat-buffer)))


(use-package yaml-mode
  :ensure t
  :config
  (add-hook 'yaml-mode-hook 'filladapt-mode))


(use-package company
  :ensure t)


(use-package csv-mode
  :ensure t)


(use-package mermaid-mode
  :mode ("\\.mmd\\'" . mermaid-mode)
  :config
  (setq mermaid-mmdc-location "/Users/naiquevin/.nvm/versions/node/v12.14.0/bin/mmdc"))


(use-package plantuml-mode
  :ensure t
  :mode ("\\.plantuml\\'" . plantuml-mode)
  :config
  (setq plantuml-default-exec-mode 'executable)
  ;; Until the problem with svg is fixed - https://emacs.stackexchange.com/a/74504
  (plantuml-set-output-type "png"))


(use-package flycheck
  :ensure t

  :config
  ;; Disable the error indicator on the fringe
  (setq flycheck-indication-mode 'left-fringe)
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
                      :underline nil))