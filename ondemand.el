;; Define on demand functions for stuff that is not required all the
;; time. These will not be loaded until M-x ondemand-<mode> is run

(defun ondemand-nxhtml ()
  "Load nxhtml when called"
  (interactive)
  (load "~/emacs/site/nxhtml/autostart.el")
  (setq mumamo-background-colors nil) 
  (add-to-list 'auto-mode-alist '("\\.html$" . django-html-mumamo-mode)))

