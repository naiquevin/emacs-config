

(defun nd-js-doc ()
  (interactive)
  (when (string= major-mode "js-mode")
    (let ((jsdef (nd-js-match-def (current-line-string))))
      (if jsdef
          (progn 
            (previous-line)
            (newline-and-indent)
            (let ((type (car jsdef))
                  (name (cadr jsdef))
                  (args (cadr (cdr jsdef))))
              (insert "/**")
              (insert (nd-js-commentize (nd-js-doc-topic type name) t))
              (insert (nd-js-commentize (format "<describe %s>" name) t))
              (when args
                (insert (nd-js-commentize "Parameters:" t))
                (dolist (a args)
                  (insert (nd-js-commentize (format "  (<type>) %s - <describe %s>" a a))))
                (insert (nd-js-commentize "")))
              (when (string= type "function")
                (insert (nd-js-commentize "Returns:"))
                (insert (nd-js-commentize "  <describe return type>" t)))
              (insert "\n*/")
              (nd-js-indent-comment-region)))
        (message "Not a valid javascript definition")))))


(global-set-key (kbd "C-c d") 'nd-js-doc)


(defun nd-js-commentize (text &optional appendblank)
  (if appendblank
      (format "\n * %s\n *" text)
    (format "\n * %s" text)))


(defun nd-js-indent-comment-region ()
  (search-backward "/**")
  (let ((beg (point-at-bol)))
    (search-forward "*/")
    (indent-region beg (point-at-eol))))


(defun nd-js-doc-topic (type name)
  (format "%s: %s" (capitalize type) name))


(defun current-line-string ()
  (interactive)
  (buffer-substring (point-at-bol) (point-at-eol)))


(defun nd-js-func-args (argstr)
  (if (string= argstr "")
      nil
    (mapcar (lambda (str)
              (replace-regexp-in-string 
               "\\`[ \t\n]*" "" 
               str))
            (split-string  argstr ","))))


(defun nd-js-match-def (string)
  (cond ((string-match "\s*var\s?\\([a-zA-Z0-9_]+\\)\s?=\s?function\s?(\\(.*\\))\s?{" string)
         (list "function" 
               (match-string 1 string)
               (nd-js-func-args (match-string 2 string))))
        ((string-match "\s*function\s?\\([a-zA-Z0-9_]+\\)\s?(\\(.*\\))\s?{" string)
         (list "function" 
               (match-string 1 string)
               (nd-js-func-args (match-string 2 string))))
        ((string-match "\\([a-zA-Z0-9_]+\\):\s?function\s?(\\(.*\\))\s?{" string)
         (list "function"
               (match-string 1 string)
               (nd-js-func-args (match-string 2 string))))
        ((string-match "\s*var\s?\\([a-zA-Z0-9_]+\\)\s?" string)
         (list "variable" (match-string 1 string) nil))
        ((string-match "\\([a-zA-Z0-9_]+\\)\s?:\s?.*,?" string)
         (list "variable" (match-string 1 string) nil))))


(defun nd-js-tests ()
  ;; tests for nd-js-func-args
  (assert (equal (nd-js-func-args "x, y") '("x" "y")))
  (assert (equal (nd-js-func-args "") nil))

  ;; tests for nd-js-match-def
  (assert (equal (nd-js-match-def "var helloworld = 42;")
                 '("variable" "helloworld" nil)))
  (assert (equal (nd-js-match-def "var hello_world = function (x, y) {")
                 '("function" "hello_world" ("x" "y"))))
  (assert (equal (nd-js-match-def "function hw901_88 () {")
                 '("function" "hw901_88" nil)))
  (assert (equal (nd-js-match-def "helloWorld: 42")
                 '("variable" "helloWorld" nil)))
  (assert (equal (nd-js-match-def "helloworld: function (x, y) {")
                 '("function" "helloworld" ("x" "y"))))

  ;; tests with/without whitespace and trailing semi-colon
  (assert (equal (nd-js-match-def "var helloworld=42;")
                 '("variable" "helloworld" nil)))
  (assert (equal (nd-js-match-def "var hello_world = function(x,y){")
                 '("function" "hello_world" ("x" "y"))))
  (assert (equal (nd-js-match-def "function hw901_88(){")
                 '("function" "hw901_88" nil)))
  (assert (equal (nd-js-match-def "helloWorld : 42,")
                 '("variable" "helloWorld" nil)))
  (assert (equal (nd-js-match-def "helloworld:function (x,y) { ")
                 '("function" "helloworld" ("x" "y"))))
  (assert (equal (nd-js-match-def "    var helloworld=42;")
                 '("variable" "helloworld" nil)))
  (assert (equal (nd-js-match-def "    function hw901_88(){")
                 '("function" "hw901_88" nil)))

  ;; tests for non-relevant lines (should return nil)
  (assert (equal (nd-js-match-def "x = y + 1;") nil))

  (assert (string= (nd-js-doc-topic "variable" "hello") "Variable: hello"))
  (assert (string= (nd-js-doc-topic "function" "doThis") "Function: doThis"))
  )


;; (nd-js-tests)

