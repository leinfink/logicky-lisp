(in-package :asdf-user)

(defsystem "logicky-lisp"
  :author "Henrik Hörmann <leinfink@mailbox.org>"
  :version "0.0.1"
  :license "GPLv3"
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
  :entry-point "logicky-lisp:main")
