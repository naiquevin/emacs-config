;; Windows specific configuration

(set-frame-font "Courier New 11")

;; Windows EOL
;;
;; Ref: https://stackoverflow.com/a/750933
(defun hide-dos-eol ()
  "Hide ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

(defun show-dos-eol ()
  "Show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M ?\^M))

(add-hook 'find-file-hook 'hide-dos-eol)

;; @TODO: Check if this is really required?
;;
;; It was added while debugging the CRLF issues in autoloads
(setq-default buffer-file-coding-system 'utf-8-unix)

;; Don't add CRLF when editing files with LF
;;
;; Ref: https://stackoverflow.com/a/1050795
(setq inhibit-eol-conversion t)

(provide 'win)
