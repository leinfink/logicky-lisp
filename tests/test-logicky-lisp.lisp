(in-package :logicky-lisp-tests)

(def-suite test-semantics
    :description "Test semantics")

(in-suite test-semantics)

(test test-set-interpretation
      (let ((logicky-lisp:*interpretation* '((p . t) (q))))
        (is (cdr (assoc 'p *interpretation*)))
        (is (not (cdr (assoc 'q *interpretation*))))))

(test test-all-interpretations
      (is (null (nset-exclusive-or
                 (logicky-lisp::all-interpretations '(p . q))
                 '(((p . t) (q . t)) ((p . t) (q))
                   ((p) (q . t)) ((p) (q)))
                 :test #'equal)))
      (is (null (nset-exclusive-or
                 (logicky-lisp::all-interpretations '(p q . r))
                 '(((p . t) (q . t)) ((p . t) (q))
                   ((p) (q . t)) ((p) (q)))
                 :test #'equal)))
      )
