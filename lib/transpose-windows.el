;;; http://www.emacswiki.org/emacs/TransposeWindows

;; When working with multiple windows it can be annoying if they get
;; out of order. With this function it's easy to fix that.
(defun transpose-windows (arg)
  "Transpose the buffers shown in two windows."
  (interactive "p")
  (let ((selector (if (>= arg 0) 'next-window 'previous-window)))
    (while (/= arg 0)
      (let ((this-win (window-buffer))
            (next-win (window-buffer (funcall selector))))
        (set-window-buffer (selected-window) next-win)
        (set-window-buffer (funcall selector) this-win)
        (select-window (funcall selector)))
      (setq arg (if (plusp arg) (1- arg) (1+ arg))))))


(global-set-key (kbd "C-x 4") 'transpose-windows)

(provide 'transpose-windows)
