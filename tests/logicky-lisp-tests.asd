(in-package :asdf-user)

(defsystem "logicky-lisp-tests"
  :description "Test suite for the logicky-lisp system"
  :author "Henrik Hörmann <leinfink@mailbox.org>"
  :version "0.0.1"
  :depends-on (:logicky-lisp
               :fiveam)
  :license "BSD-3-Clause"
  :serial t
  :components ((:file "packages")
               (:file "test-logicky-lisp"))
  
  :perform (test-op (op _) (unless (uiop:symbol-call :fiveam '#:run-all-tests)
                             (uiop:quit 1)))
  )
