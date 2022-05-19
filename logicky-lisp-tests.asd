(in-package :asdf-user)
(defsystem "logicky-lisp-tests"
  :description "Test suite for the logicky-lisp system"
  :author "Henrik Hörmann <leinfink@mailbox.org>"
  :version "0.0.1"
  :depends-on (:logicky-lisp
               :fiveam)
  :license "BSD-3-Clause"
  :serial t
  :components ((:module "tests"
                        :serial t
                        :components ((:file "packages")
                                     (:file "test-logicky-lisp"))))

  ;; The following would not return the right exit code on error, but still 0.
  :perform (test-op (op _) (symbol-call :fiveam :run-all-tests))
  )
