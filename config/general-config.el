;; Config file for setting general preferences

(setq user-full-name "Vineet Naik"
      user-mail-address "naikvin@gmail.com"
      erc-nick "naiquevin"
      inhibit-startup-message t       ; donot show the startup msg
      x-select-enable-clipboard t     ; x-copy-paste
      c-basic-offset 4)               ; Basic indentation to 4 spaces


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


;; ido-mode config and preferences
(ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10)
