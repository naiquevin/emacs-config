;;; pkg-tools.el --- pip (python) like tool for tracking packages
;;; installed using package.el
;;
;; Author: Vineet Naik <naikvin@gmail.com>
;; Created: 10th August 2013
;; License: No license. Consider this as public domain.
;;
;; What?
;; =====
;;
;; todo
;;
;; Installation and Usage
;; ======================
;;
;; todo
;;

;; Code starts here

(require 'cl-lib)


(defun pkg-tools-freeze (outfile)
  "Interactive function to write the list of installed packages
  to a specified file"
  (interactive "sFile to save to: ")
  (with-temp-buffer
    (insert (mapconcat 'symbol-name package-activated-list "\n"))
    (when (file-writable-p outfile)
      (write-region (point-min)
                    (point-max)
                    outfile))))


(defun pkg-tools-unmet (reqfile)
  "Interactive function to display the list uninstalled packages
  in minibuffer"
  (interactive "sRead requirements from: ")
  (pkg-tools-printlist
   (remove-if-not (lambda (p)
                    (not (package-installed-p p)))
                  (pkg-tools-deps reqfile))))


(defun pkg-tools-met (reqfile)
  "Interactive function to display the list of installed packages
  in the minibuffer"
  (interactive "sRead requirements from: ")
  (pkg-tools-printlist
   (remove-if-not 'package-installed-p
                  (pkg-tools-deps reqfile))))


(defun pkg-tools-install (reqfile)
  "Interactive function to install all the packages listed in the
  requirements file"
  (interactive "sRead requirements from: ")
  (let ((uninstalled (remove-if-not
                      (lambda (p)
                        (not (package-installed-p p)))
                      (pkg-tools-deps reqfile))))
    (dolist (p uninstalled)
      (if (yes-or-no-p (format "Install %s? " (symbol-name p)))
          (package-install p)
        nil))))


(defun pkg-tools-deps (reqfile)
  "Function to read the requirements file and get the list of all
  requirements as symbols"
  (with-temp-buffer
    (insert-file-contents reqfile)
    (mapcar 'intern (split-string
                     (buffer-string) "\n" t))))


(defun pkg-tools-printlist (packages)
  (message (mapconcat 'symbol-name packages ", ")))

;; nd-js.el ends here

