;; Snippet to regenerate autoloads files for all installed packages
;; using the correct coding system on Windows.

(add-to-list 'load-path my/self-lib-dir)

(require 'dash)
(require 'defuns)

(defun autoload-prefix (path)
  (car (-remove (lambda (x) (not x))
                (mapcar (lambda (x)
                          (when (string-match "\\(.+\\)-autoloads.el" x)
                            (match-string 1 x)))
                        (directory-files path)))))

(mapcar (lambda (path)
          (let ((prefix (autoload-prefix path)))
            (when prefix
              (delete-file (concat path prefix "-autoloads.el"))
              (let ((coding-system-for-write 'utf-8-emacs-unix))
                (package-generate-autoloads prefix path)))))
        (elpa-pkg-dirs))
