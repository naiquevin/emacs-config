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

