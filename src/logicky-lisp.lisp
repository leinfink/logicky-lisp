(in-package :logicky-lisp)

(defun greet ()
  (help))

(defun help ()
  (format t "~&Usage:

  Play around in the REPL in the :logicky-lisp package.
  Formulas have to be entered as lisp-readable s-expressions.
  Start with (in-package :logicky-lisp) to avoid needing a prefix everywhere.

  # Commands:
  (in-package :logicky-lisp)
  (cl-user::quit) [or (quit)]

  (well-formed-p [formula])
  (truep [formula])
  (semantic-consequence-p [conclusion] [premise1] [premise2] [...])
  (tautologyp [formula])
  (*interpretation* '((p . t) (q)))

  # Syntax elements:
  'p 'q 'r [or any other lisp 'atoms]
  '(l-not p)
  '(l-or p q)
  '(l-and p q)
  '(l-cond p q)
  '(l-eql p q)
  '(l-not (l-or p (l-cond r p)))

  # Example commands:
  (truep '(l-not (l-or p (l-cond r p))))

~&"))

(defun %main (argv)
  "Parse CLI args."
  (when (member "-h" argv :test #'equal)
    ;; To properly parse command line arguments, use a third-party library such as
    ;; clingon, unix-opts, defmain, adopt… when needed.
    (help)
    (uiop:quit))
  (greet))

(defun main ()
  "Entry point for the executable.
  Reads command line arguments."
  ;; uiop:command-line-arguments returns a list of arguments (sans the script name).
  ;; We defer the work of parsing to %main because we call it also from the Roswell script.
  (%main (uiop:command-line-arguments)))
