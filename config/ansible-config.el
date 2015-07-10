;; Ansible config

(setq auto-mode-alist (cons '("\\.j2" . jinja2-mode) auto-mode-alist))

(add-hook 'yaml-mode-hook #'ansible-doc-mode)
