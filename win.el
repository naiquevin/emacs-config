;; Windows specific configuration

(set-frame-font "Courier New 13")

(setq os/path-envvar-delimiter ";")

(setenv "PATH"
        (concat
         (getenv "PATH")
         os/path-envvar-delimiter
         "C:\\tools\\cygwin\\bin"))

(provide 'win)
