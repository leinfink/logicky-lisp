(in-package :asdf-user)

(defsystem "logicky-lisp"
  :long-name "Logicky-Lisp"
  :author "Henrik Hörmann <leinfink@mailbox.org>"
  :version "0.0.1"
  :license "BSD-3-Clause"
  :description "Evaluates and proves arguments in different formal logics."
  :homepage ""
  :bug-tracker ""
  :source-control (:git "")

  ;; Dependencies.
  :depends-on ()

  ;; Project stucture.
  :serial t
  :components ((:module "src"
                        :serial t
                        :components ((:file "packages")
                                     (:file "logicky-lisp")
                                     (:file "logic"))))

  ;; Build a binary:
  ;; don't change this line.
  :build-operation "program-op"
  ;; binary name: adapt.
  :build-pathname "logicky-lisp"
  ;; entry point: here "main" is an exported symbol. Otherwise, use a double ::
  :entry-point "logicky-lisp:main"

  :in-order-to ((test-op (test-op :logicky-lisp/tests))))


(defsystem "logicky-lisp/tests"
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
  
  :perform (test-op (op _) (unless (uiop:symbol-call :fiveam '#:run-all-tests)
                               (uiop:quit 1)))
  )
