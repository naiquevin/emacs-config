;;;; Some self written utility functions

;;
;; Kill all buffers except "*scratch*" & minibuffer
;;
;; (mapc 'kill-buffer (buffer-list)) kills every single
;; one, so wrote this!
;;
(defun kill-em-all ()
  (interactive)
  (defun kill-em-all-iter (lab)
    (if (equal '() lab)
        t
      (progn
        (if (not (member (buffer-name (car lab))
                         '("*scratch*", "Minibuf-1")))
            (kill-buffer (car lab)))
        (kill-em-all-iter (cdr lab)))))
  (kill-em-all-iter (buffer-list)))


(defun delete-space-before-punc ()
  "Function for fixing whitespace around punctuation. Comes in
  handy while editing text written by people who put a space before
  punctuation marks. Not to be used for code."
  (interactive)
  (goto-char (point-min))
  (while (re-search-forward "\s\\([,.:;?!]\\)" nil t)
    (replace-match "\\1")))


(defun http-serve-dir (port)
  "Function for starting a SimpleHTTPServer in python on
  localhost:9000 to serve the contents of the current directory"
  (interactive "sEnter Port: ")
  (shell-command (format "python -m SimpleHTTPServer %s &" port))
  (message
   (format
    "Serving files from directory %s at http://127.0.0.1:%s"
    default-directory
    port)))
