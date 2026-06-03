;; Config file for treesitter related config

;;;; Tree-sitter config (not working for some reason)
;; (setq treesit-language-source-alist
;;       '((python "https://github.com/tree-sitter/tree-sitter-python")))
;;
;; (setq major-mode-remap-alist
;;       '((python-mode . python-ts-mode)))

;; [tag: treesitter-language-sources]
(setq treesit-language-source-alist
      '((typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
        (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
        (kotlin "https://github.com/fwcd/tree-sitter-kotlin" "main")
        (yaml "https://github.com/tree-sitter-grammars/tree-sitter-yaml" "master")))
