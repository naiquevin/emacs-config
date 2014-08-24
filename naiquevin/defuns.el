;;;; Some self written commands
;;;; TODO: Add namespace/prefix to these functions

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
    "Serving files from directory %s at http://0.0.0.0:%s"
    default-directory
    port)))


(defun enable-nxhtml ()
  "Load nxhtml when called"
  (interactive)
  (load "~/emacs/site/nxhtml/autostart.el")
  (setq mumamo-background-colors nil)
  (add-to-list 'auto-mode-alist '("\\.html$" . django-html-mumamo-mode)))


;; Copied from here -- http://www.emacswiki.org/emacs/UnfillParagraph
(defun unfill-paragraph ()
  "Takes a multi-line paragraph and makes it into a single line
  of text."
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))


;;; Copied from Vedang's emacs config

(defun sudo-edit (&optional arg)
  "Edit as root"
  (interactive "p")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "@sudo! File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))


(defun revert-all-buffers ()
  "Refreshes all open buffers from their respective files."
  (interactive)
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (when (and (buffer-file-name) (not (buffer-modified-p)))
        (revert-buffer t t t))))
  (message "Refreshed open files."))


;; Function to launch a google search
(defun google-search ()
  "googles a query or a selected region"
  (interactive)
  (browse-url
   (concat
    "http://www.google.com/search?q="
    (if mark-active
        (buffer-substring (region-beginning) (region-end))
      (read-string "Google: ")))))


(provide 'defuns)
