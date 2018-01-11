;;; yaml-path.el --- Extends yaml-mode to display the path of the current yaml element in the message area.

;; Copyright (C) 2011  Craig B. Ludington 

;; Author: Craig B. Ludington <me@alpheus.me>
;; Keywords: yaml path
;; Version: 0.0.1

;; This file is not part of Emacs

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;; This provides a function to display an xpath-like string 
;; for the yaml element on the current line.
;; It's meant to complement Yoshiki Kurihara's yaml-mode.el.
;;
;; It doesn't strictly depend on yaml-mode, but works better
;; with yaml-mode.  (That's because yaml-mode makes syntax-ppss usable 
;; for locating comments.)
;; 
;; The only function you should need is yaml-path/path.  
;; It's convenient to bind that to a key, e.g. C-c C-p.
;; (Instructions for doing that only in yaml-mode are below.)
;;
;;; Installation:

;; To install, just drop this file into a directory in your
;; `load-path' and (optionally) byte-compile it.  To automatically
;; handle files ending in '.yml', add something like:
;;
;;    (require 'yaml-path)
;;
;; to your ~/.emacs (or ~/.emacs.d/init.el).
;;
;; If you've installed yaml-mode, and would like to have C-c C-p show you the path
;; when you're in yaml-mode, add this to your initialization file.
;;
;;    (add-hook 'yaml-mode-hook
;;     '(lambda ()
;;        (define-key yaml-mode-map (kbd "C-c C-p") 'yaml-path/path)))


;;; Known Bugs:
;;
;;    Should use line-number-at-pos and goto-line 
;;    instead of using point everywhere.
;;
;;    Should be faster, so that motion functions like next-line, previous-line 
;;    could be advised and the path would be continuously displayed.
;;
;;      The following is *NOT* advised (pun intended):
;;
;;      (defvar yaml-path/*constantly-display-yaml-path* t)
;;      (defadvice previous-line (after yaml-path/constantly-display-yaml-path) 
;;        "Display the path of the current element of a YAML file in the message area."
;;        (when (and (eq major-mode 'yaml-mode)
;;      	     yaml-path/*constantly-display-yaml-path*)
;;          (yaml-path/path)))
;;      (ad-activate 'previous-line)   ;; DO NOT DO THIS!

;; -------------------------------------------------------------------------------- cut here ------------------------------------------------------------------------
(defun yaml-path/empty-line? ()
  (let ((b (save-excursion (beginning-of-line) (point)))
	(e (save-excursion (end-of-line) (point))))
    (= b e)))

(defun yaml-path/comment-line? ()
  (save-excursion
    (move-to-column (current-indentation))
    (unless (eolp)
      (forward-char))
    (nth 4 (syntax-ppss))))

(defun yaml-path/yaml-line? ()
  (not (or (yaml-path/empty-line?)
	   (yaml-path/comment-line?))))

(defun yaml-path/prev-yaml (&optional p)
  "Return the point of the yaml before the point p (default to current point) or nil."
  (labels ((f ()
	      (unless (= (point) (point-min))
		(previous-line)
		(beginning-of-line)
		(if (yaml-path/yaml-line?)
		    (point)
		  (f)))))
    (save-excursion
      (goto-char (or p (point)))
      (f))))

(defun yaml-path/indentation-at-point (p)
  (save-excursion
    (goto-char p)
    (current-indentation)))

(defun yaml-path/previous-less-indented-point (starting-point indentation)
  "Return a point on a YAML line (not a comment or empty line) that precedes starting-point and has less indentation.
In other words, the parent of the YAML element on the line containing starting-point."
  (let ((p starting-point)
	(result nil)
	(done? nil))
    (while (not done?)
      (if (setq p (yaml-path/prev-yaml p))
	  (when (< (yaml-path/indentation-at-point p) indentation)
	    (setq result p
		  done?  t))
	(setq done? t)))
    result))

(defun yaml-path/tag-at-point (p)
  "Return a string representing the yaml tag on the line containing the point p."
  (save-excursion (goto-char p) 
		  (move-to-column (current-indentation))
		  (substring-no-properties (thing-at-point 'sexp))))

(defun yaml-path/tags-of-interest (p i)
  "Return a list of yaml tags such that each one is on the chain."
  (labels ((f (p i) 
	      (let ((next-point (yaml-path/previous-less-indented-point p i)))
		(when next-point
		  (cons next-point (f next-point (yaml-path/indentation-at-point next-point)))))))
    (save-excursion
      (let ((points (f p i)))
	(mapcar  #'yaml-path/tag-at-point points)))))

(defun yaml-path/path ()
  "Display the path to the current YAML element in the message area."
  (interactive)
  (when (yaml-path/yaml-line?)
    (let ((path (apply #'concatenate 'string
		       (reverse (mapcar #'(lambda (s) (format "%s/" s))
					(yaml-path/tags-of-interest (point) (current-indentation)))))))
      (message (format "%s%s" path (yaml-path/tag-at-point (point)))))))

(provide 'yaml-path)
