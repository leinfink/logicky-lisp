(in-package :logicky-lisp-tests)

(def-suite test-semantics
    :description "Test semantics")

(in-suite test-semantics)

(test test-set-interpretation
      (let ((lg:*interpretation* '((p . t) (q))))
        (is (cdr (assoc 'p *interpretation*)))
        (is (not (cdr (assoc 'q *interpretation*))))))

(test test-all-interpretations
      (is (null (set-exclusive-or
                 (lg:all-interpretations '(p q))
                 '(((p . t) (q . t))
                   ((p . t) (q))
                   ((p) (q . t))
                   ((p) (q)))
                 :test #'equal)))
      (is (null (set-exclusive-or
                 (lg:all-interpretations '(p q r))
                 '(((p . t) (q . t) (r . t))
                   ((p . t) (q . t) (r))
                   ((p . t) (q) (r . t))
                   ((p . t) (q) (r))
                   ((p) (q . t) (r . t))
                   ((p) (q . t) (r))
                   ((p) (q) (r . t))
                   ((p) (q) (r)))
                 :test #'equal)))
  )

(test test-truep
  (let ((lg:*interpretation* '((p . t) (q) (r . t))))
    (is (every #'lg:truep '((lg:l-not (lg:l-cond p q))
                            (lg:l-cond q p)
                            (lg:l-and p r)
                            (lg:l-or p q)
                            (lg:l-eq p r)
                            (lg:l-not (lg:l-eq p q)))))))
                                     
(test test-semantic-consequence-p
  (is (lg:semantic-consequence-p 'q '(l-cond p q) 'p)))
