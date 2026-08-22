
(defvar tla-tools-jar "~/.local/share/tlaplus/tla2tools.jar"
  "Path to tla2tools.jar.")

(defun tla-translate-pluscal (file)
  "Run pcal.trans on FILE, rewriting it in place with the TLA+ translation."
  (interactive (list (or buffer-file-name (read-file-name "TLA+ file: "))))
  (let ((default-directory (file-name-directory file)))
    (compile (format "java -cp %s pcal.trans %s"
                      (shell-quote-argument (expand-file-name tla-tools-jar))
                      (shell-quote-argument (file-name-nondirectory file))))))

(defun tla-check-model (file)
  "Run tlc2.TLC on FILE."
  (interactive (list (or buffer-file-name (read-file-name "TLA+ file: "))))
  (let ((default-directory (file-name-directory file)))
    (compile (format "java -cp %s tlc2.TLC %s"
                      (shell-quote-argument (expand-file-name tla-tools-jar))
                      (shell-quote-argument (file-name-nondirectory file))))))


(use-package tla-ts-mode
  :mode "\\.tla\\'"
  :ensure t

  ;; :vc (:url "https://github.com/Davidbrcz/tla-ts-mode" :branch "master")
  :load-path my/self-lib-dir

  :config
  ;; The grammar is called tlaplus, but the mode is called tla
  (setq treesit-load-name-override-list '((tla "libtree-sitter-tlaplus" "tree_sitter_tlaplus")))
  (define-key tla-ts-mode-map (kbd "C-c C-t") #'tla-translate-pluscal)
  (define-key tla-ts-mode-map (kbd "C-c C-c") #'tla-check-model)

  :hook (tla-ts-mode . auto-revert-mode))
