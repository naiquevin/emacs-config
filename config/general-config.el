;; Config file for setting general preferences

(setq user-full-name "Vineet Naik"
      user-mail-address "naikvin@gmail.com"
      erc-nick "naiquevin"
      inhibit-startup-message t       ; donot show the startup msg
      x-select-enable-clipboard t     ; x-copy-paste
      c-basic-offset 4                ; Basic indentation to 4 spaces
      confirm-kill-emacs 'y-or-n-p
      ring-bell-function 'ignore)


;; more prefs
(setq-default indent-tabs-mode nil)   ; Disable tabs
(setq-default truncate-lines t)       ; Disable line-wrapping


;; more prefs
(menu-bar-mode -1)                    ; Get rid of the menu bar first,
(tool-bar-mode -1)                    ; .. and the tool bar,
(scroll-bar-mode -1)                  ; .. and the scroll bar,
(mouse-avoidance-mode 'cat-and-mouse) ; .. and finally the mouse pointer!
(icomplete-mode 1)                    ; Incremental completions in minibuffer
(which-function-mode t)               ; Enable which function mode
(show-paren-mode t)                   ; Show matching paren
(column-number-mode 1)                ; Show column number in mode line


;; prefer everything in utf-8
(prefer-coding-system 'utf-8)
(set-language-environment 'UTF-8)
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8
      buffer-file-coding-system 'utf-8
      coding-system-for-write 'utf-8
      default-process-coding-system '(utf-8 . utf-8))


;; ido-mode config and preferences
(ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching nil
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10
      ido-everywhere t)


;; efficient switching between windows
(windmove-default-keybindings)
(setq windmove-wrap-around t)


;; use projectile with all of it's default behaviour
(projectile-global-mode)
(setq projectile-mode-line '(:eval (format " Project:%s" (projectile-project-name))))
