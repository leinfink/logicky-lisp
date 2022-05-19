(in-package :logicky-lisp)

;;; --- Symbols of the object language ---

(defun propositional-parameter-p (formula)
  (atom formula))

(defparameter *unary-connectives* '(l-not))
(defparameter *binary-connectives* '(l-and l-or l-cond l-eq))


;;; --- Syntax of the object language ---

(defmacro reduce-atoms (formula resultf reducef)
  (let ((recf (gensym)))
    `(labels ((,recf (form)
                (cond ((propositional-parameter-p form) (funcall ,resultf form))
                      ((unary-connective-p form) (,recf (second form)))
                      ((binary-connective-p form) (funcall ,reducef
                                                           (,recf (second form))
                                                           (,recf (third form))))
                      (t nil))))
       (,recf ,formula))))

(defun well-formed-p (formula)
  "Returns t if FORMULA is well-formed under the syntax of the active object language.
Assumes that FORMULA is an s-expression. Recursively checks whether it is made up
exclusively of propositional parameters (logical atoms) connected through the available
logical operators."
  (reduce-atoms
   formula
   #'(lambda (_) (or _ t))
   #'(lambda (p q) (and p q))))

(defmacro assert-wff (formula)
  `(assert (well-formed-p ,formula)
           (,formula)
           "~S is not a well-formed formula."
           ,formula))

(defun find-parameters (formula)
  "Returns a list of all propositional parameters (logical atoms) in FORMULA."
  (reduce-atoms formula #'list #'append))

(defun unary-connective-p (formula)
  (connective-p formula *unary-connectives* 1))

(defun binary-connective-p (formula)
  (connective-p formula *binary-connectives* 2))

(defun connective-p (formula connectives num_elements)
  (let ((connector (first formula))
        (elements (rest formula)))
    (and (member connector connectives)
         (= (length elements) num_elements))))


;;; --- Semantic validity ---

(defparameter *interpretation* '()
  "An alist that assings truth or falsehood to parameters.
Truth of parameter P is stored as (P . T), falsehood is stored as (P).
Use (CDR (ASSOC P INTERPRETATION) to get the truth value of P.")

(defmacro mapcar-cons-flat (car val list)
  `(mapcar #'(lambda (x) (acons ,car ,val (if (consp (cdr x)) x (list x))))
           ,list))

(defun all-interpretations (parameters)
  "Returns a list of all possible interpretations of PARAMETERS.
See `*interpretation*` for a description of the interpretation format."
  (cond ((null (rest parameters)) (cons (cons (car parameters) t) ; (P . T)
                                        (cons parameters nil))) ; (P)
        (t (let ((interpretations (all-interpretations (rest parameters))))
             (append (mapcar-cons-flat (first parameters) t interpretations)
                     (mapcar-cons-flat (first parameters) nil interpretations))))))

;;; Connectors

(defun l-not (p)
  "Logical negation. Returns nil if P is t. Otherwise returns t."
  (not p))

(defun l-and (p q)
  (and p q))

(defun l-or (p q)
  (or p q))

(defun l-cond (p q)
  (or (not p) q))

(defun l-eq (p q)
  (eql p q))

;;; Checks for semantic validity

(defun truep (formula)
  (assert-wff formula)
  (labels ((truep-rec (f)
             (if (propositional-parameter-p f)
                 (cdr (assoc f *interpretation*))
                 (apply (first f) (mapcar #'truep-rec(rest f))))))
    (truep-rec formula)))

(defun semantic-consequence-p (conclusion &rest premises)
  (assert-wff conclusion)
  (mapcar #'(lambda (premiss) (assert-wff premiss)) premises)
  (notany #'(lambda (x)
              (let ((*interpretation* x))
                (when (every #'truep premises)
                  (not (truep conclusion)))))
          (all-interpretations (find-parameters conclusion))))

(defun tautologyp (formula)
  "Returns t if FORMULA is t under every possible interpretation (i.e. is a semantic
consequence of the empty set of premises)."
  (semantic-consequence-p formula))


;;; --- Proof calculus ---

