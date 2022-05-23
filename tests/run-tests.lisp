#+sbcl (require :sb-cover)
#+sbcl (declaim (optimize sb-cover:store-coverage-data))

(asdf:oos 'asdf:load-op :logicky-lisp :force t)
(asdf:test-system :logicky-lisp)

#+sbcl (sb-cover:report "coverage/" :form-mode :whole)
#+sbcl (declaim (optimize (sb-cover:store-coverage-data 0)))



