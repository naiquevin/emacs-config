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
;; This is my attempt at building a little tool for tracking packages
;; installed in emacs via package.el. It's inspired by how pip and
;; requirements.txt file is used in python to track dependencies for a
;; project
;;
;; Installation
;; ============
;;
;; Just add the following line to yout ~/.emacs or ~/.emacs.d/init.el
;; file and evaluate (or restart emacs),
;;
;;   (load "/path/to/pkg-tools.el")
;;
;; Usage
;; =====
;;
;; pkg-tools.el provides 4 interactive functions that can be run as
;; follows,
;;
;;   `M-x pkg-tools-freeze`
;;
;;     It will prompt for a path to a filename and on providing it,
;;     the list of names of installed packages will be written to this
;;     file. Make sure you specify one in the location where it will
;;     be version controlled along with rest of your emacs config.
;;
;; Usage
;; =====
;;
;; pkg-tools.el provides 4 interactive functions that can be run as
;; follows,
;;
;;   `M-x pkg-tools-freeze`
;;
;;     It will prompt for a path to a filename and on providing it,
;;     the list of names of installed packages will be written to this
;;     file. Make sure you specify one in the location where it will
;;     be version controlled along with rest of your emacs config.
;;
;;   `M-x pkg-tools-install`
;;
;;     It will ask you for the path to the requirements file and
;;     install all the unmet packages from it. Note that before
;;     installing any package, it will ask for a simple yes-or-no
;;     comfirmation that any emacs user should be familiar with
;;
;;   `M-x pkg-tools-unmet`
;;
;;     It will ask for the path to the requirement file and output the
;;     list of uninstalled packages to the minibuffer
;;
;;   `M-x pkg-tools-met`
;;
;;     It will ask for the path to the requirement file and output the
;;     list of installed packages to the minibuffer
;;

;; Code begins from here

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

;; pkg-tools.el ends here

