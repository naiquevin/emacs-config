;; When there are two windows, this function helps to toggle the way
;; they are split ie. one beside the other or one below the
;; other. This code is not my own, it's been copied as it is from
;; http://www.emacswiki.org/emacs/ToggleWindowSplit

(defun toggle-window-split ()
  "If the frame is split vertically, split it horizontally or vice versa.
Assumes that the frame is only split into two."
  (interactive)
  (unless (= (length (window-list)) 2) (error "Can only toggle a frame split in two"))
  (let ((split-vertically-p (window-combined-p)))
    (delete-window) ; closes current window
    (if split-vertically-p
        (split-window-horizontally)
      (split-window-vertically)) ; gives us a split with the other window twice
    (switch-to-buffer nil))) ; restore the original window in this part of the frame

;; I don't use the default binding of 'C-x 5', so use toggle-frame-split instead
(global-set-key (kbd "C-x 5") 'toggle-window-split)

(provide 'toggle-window-split)

