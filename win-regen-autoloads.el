
(require 'dash)

(defun elpa-pkg-dirs ()
  (let ((elpa-dir (expand-file-name "elpa" user-emacs-directory)))
    (mapcar (lambda (x)
                    (concat (file-name-as-directory elpa-dir)
                            (file-name-as-directory x)))
                  (-remove (lambda (x)
                             (or (string= x "..")
                                 (string= x ".")
                                 (string= x "archives")))
                           (directory-files my/elpa-dir)))))

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
