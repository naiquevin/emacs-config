;; OSX specific configuration

(set-default-font "Courier New 16")


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
(when (eq system-type 'darwin)
  (setq system-name (car (split-string system-name "\\."))))


;;; Set the path properly
(setenv "PATH"
        (concat
         "/usr/local/bin" ":"
         (getenv "PATH")))

(setq exec-path
      (append '("/usr/local/bin") exec-path))


(provide 'osx)

