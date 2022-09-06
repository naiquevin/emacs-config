;; Config file for ruby programming

(use-package ruby-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist
               '("\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'" . ruby-mode))
  (add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
  ;; Use filladapt mode for ruby as 'fill-paragraph' doesn't work well
  ;; with the builtin ruby-mode
  (add-hook 'ruby-mode-hook 'filladapt-mode))
