(defpackage :logicky-lisp
  (:use :cl)
  (:export
   :main
   :well-formed-p
   :truep
   :semantic-consequence-p
   :tautologyp
   :*interpretation*
   :all-interpretations
   :l-not
   :l-or
   :l-cond
   :l-and
   :l-eq))
