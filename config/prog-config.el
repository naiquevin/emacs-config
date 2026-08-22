;;; Configuration for programming related modes


;; Show matching paren
(show-paren-mode t)

;; Enable which function mode
(which-function-mode t)

;; Basic indentation to 4 spaces
(setq c-basic-offset 4)

(add-hook 'c-mode-hook 'electric-pair-mode)

(use-package eldoc
  :after (diminish)
  :diminish eldoc-mode
  :config
  (setq eldoc-echo-area-use-multiline-p nil))


(use-package projectile
  :ensure t
  :config
  (setq projectile-mode-line-prefix " Project")
  (projectile-mode +1)

  ;; NOTE: On Windows, cygwin needs to be installed and the path to
  ;; cygwin binaries must be found in PATH (which is being ensured in
  ;; ../win.el file)
  (when (eq system-type 'windows-nt)
    (setq projectile-indexing-method 'alien))

  :bind-keymap
  ("C-c p" . projectile-command-map))


(use-package paredit
  :ensure t
  :after (diminish)
  :config
  ;; Disable C-j keybinding of paredit as it overrides paredit-return
  ;; in ielm mode. C-j is redundant as M-j practically does the same
  ;; thing.
  (define-key paredit-mode-map (kbd "C-j") nil)
  :diminish (paredit-mode . " [P]"))


(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config))


(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'after-init-hook (lambda () (require 'rainbow-delimiters))))


(use-package jinja2-mode
  :ensure t
  :mode (("\\.j2$" . jinja2-mode)
         ("\\.jinja$" . jinja2-mode)))


(use-package dumb-jump
  :ensure t
  :bind (("C-c ." . dumb-jump-go)))


(use-package sql-indent
  :ensure t
  :config
  :hook
  (sql-mode . (lambda ()
                (sqlind-minor-mode)
                (setq sqlind-basic-offset 4))))


(use-package sqlformat
  :ensure t
  :config
  ;; (setq sqlformat-command 'pgformatter)
  (setq sqlformat-command 'sql-formatter)
  ;; (setq sqlformat-args '("--extra-function" "/Users/vineet/.pg_format_files/functions.txt"))
  (setq sqlformat-args '("--config" "{\"language\": \"sqlite\", \"tabWidth\": 4}"))
  :bind (:map sql-mode-map ("C-c C-f" . sqlformat-buffer)))


(use-package yaml-mode
  :ensure t
  :config
  (add-hook 'yaml-mode-hook 'filladapt-mode))


(use-package yaml-pro
  :ensure t)


(use-package company
  :ensure t
  :after (diminish)
  :config
  (setq company-idle-delay 2)
  :diminish (company-mode . " CY"))


(use-package csv-mode
  :ensure t)


(when (executable-find "mmdc")
  (use-package mermaid-mode
    :ensure t
    :mode ("\\.mmd\\'" . mermaid-mode)))


(let ((jar-path (expand-file-name "~/.local/share/plantuml/plantuml.jar")))
  (when (file-exists-p jar-path)
    (use-package plantuml-mode
      :ensure t
      :after (org)
      :mode ("\\.plantuml\\'" . plantuml-mode)
      :config
      (setq plantuml-default-exec-mode 'jar)
      (setq plantuml-jar-path jar-path)
      (setq plantuml-indent-level 4)
      ;; Until the problem with svg is fixed - https://emacs.stackexchange.com/a/74504
      (plantuml-set-output-type "png")

      (org-babel-do-load-languages
       'org-babel-load-languages
       '((plantuml . t)))
      (setq org-plantuml-jar-path jar-path)

      )))


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


(use-package nginx-mode
  :ensure t)


(use-package bats-mode
  :ensure t)


;; (Josh's lite weight json major mode)
(use-package json-mode
  :ensure t
  :after (flycheck)

  :config
  (setq js-indent-level 2)
  (add-to-list 'auto-mode-alist '("\\.json$" . json-mode))
  (add-to-list 'auto-mode-alist '("tsconfig\\.json$" . jsonc-mode))

  :hook
  (json-mode . flycheck-mode))


;; Config for programming languages that I don't use often, hence that
;; don't need much customization.

(use-package php-mode
  :ensure t)


(use-package ruby-mode
  :ensure t
  :mode "\\(\\.rb\\|Vagrantfile\\)\\'"
  :interpreter "ruby"
  :hook
  ;; Use filladapt mode for ruby as 'fill-paragraph' doesn't work well
  ;; with the builtin ruby-mode
  (ruby-mode . filladapt-mode))


(use-package erlang
  :ensure t
  :init
  (add-hook
   'find-file-hook
   (lambda ()
     ;; scheme's equivalent of python's `any`?
     (when (or (string-match "/ebin/.*\.app$" (buffer-file-name))
               (string-match "/src/.*\.app.src$" (buffer-file-name))
               (string-match "Emakefile" (buffer-name))
               (string-match "rebar.config" (buffer-name)))
       (erlang-mode)))))


(use-package go-mode
  :ensure t)


(use-package sml-mode
  :ensure t)


(use-package geiser
  :ensure t)


;; Emacs Speaks Statistics (For editing R files)
(use-package ess
  :ensure t)


(use-package powershell
  :ensure t
  :if (eq system-type 'windows-nt))


(use-package kotlin-ts-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.kt$" . kotlin-ts-mode)))


(use-package lua-mode
  :ensure t)


(use-package graphviz-dot-mode
  :ensure t)

(use-package ape-mode
  :ensure nil
  :load-path my/self-lib-dir

  :init
  (setq ape-cli-command "/home/vineet/code/ape/target/release/ape-cli")

  :config
  (ape-mode 1)

  :diminish ape-mode)


(defun naiq/toggle-relative-line-numbers ()
  "Toggle relative line numbers in the current buffer"
  (interactive)
  (let ((is-enabled (if (string= display-line-numbers "relative")
                        t
                      nil)))
    (if is-enabled
        (display-line-numbers-mode 0)
      (progn
        (setq display-line-numbers-type 'relative)
        (display-line-numbers-mode 1)))))

(global-set-key (kbd "C-c n r") 'naiq/toggle-relative-line-numbers)

(use-package caddyfile-mode
  :ensure t)
