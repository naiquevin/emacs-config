;; ido-mode config and preferences
;;
;; !!! Commented out temporarily in order to try out ivy/counsel !!!

;; (ido-mode t)
;; (setq ido-enable-prefix nil
;;       ido-create-new-buffer 'always
;;       ido-use-filename-at-point 'guess
;;       ido-max-prospects 10
;;       ido-everywhere t)


;; ;; flx and flx-ido mode config
;; (require 'flx-ido)
;; (flx-ido-mode 1)
;; (setq ido-enable-flex-matching t)

;; ;; As per https://github.com/lewang/flx#gc-optimization
;; (setq gc-cons-threshold 20000000)


;; ;; imenu with ido
;; (require 'idomenu)
;; (global-set-key (kbd "C-c i") 'idomenu)
