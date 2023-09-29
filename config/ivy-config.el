;; Ivy/Counsel related config
;;
;;
;; OS Dependencies:
;;
;;  1. ripgrep
;;
;; Emacs package dependencies
;;
;;  1. projectile

(use-package ivy
  :ensure t
  :after (diminish)
  :init
  (setq ivy-use-virtual-buffers t
        ivy-re-builders-alist '((swiper . ivy--regex-plus)
                                (counsel-rg . ivy--regex)
                                (t . ivy--regex-fuzzy)))
  :config
  (ivy-mode t)
  ;; Disable icomplete-mode if ivy is used
  (icomplete-mode -1)
  :bind (("C-x b" . ivy-switch-buffer)
         ("C-x B" . ivy-switch-buffer-other-window)
         ("C-c C-r" . ivy-resume))
  :diminish ivy-mode)


(use-package counsel
  :ensure t
  :bind (("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-'" . counsel-imenu)
         ("C-c s" . counsel-rg)
         ("M-y" . counsel-yank-pop)
         :map counsel-find-file-map
         ("RET" . ivy-alt-done)))


(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-mode))
