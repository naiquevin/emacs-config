;; OSX specific configuration

(set-frame-font "Courier New 16")


(defun live-copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun live-paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'live-paste-to-osx)
(setq interprogram-paste-function 'live-copy-from-osx)

;; Work around a bug on OS X where system-name is a fully qualified
;; domain name
(setq system-name (car (split-string system-name "\\.")))


(global-unset-key (kbd "s-p"))
(global-unset-key (kbd "s-q"))
(global-unset-key (kbd "M-TAB"))


;;; Set the path properly
(setenv "PATH"
        (concat
         "/usr/local/bin" ":"
         (getenv "PATH")))

(setq exec-path
      (append '("/usr/local/bin") exec-path))


;; Set env for finding and running perl scripts
(setq exec-path (append exec-path (cons (expand-file-name "~/perl5/bin/") '())))
(setenv "PERL5LIB" (expand-file-name "~/perl5/lib/perl5"))


;; For finding and running tools written rust
(setq exec-path (append exec-path (cons (expand-file-name "~/.cargo/bin/") '())))


(setq locate-command "mdfind")

(custom-set-variables '(epg-gpg-program "/usr/local/bin/gpg"))
(setq epa-pinentry-mode 'loopback)


(provide 'osx)

