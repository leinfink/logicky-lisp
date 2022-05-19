(load "logicky-lisp.asd")

(ql:quickload "logicky-lisp/tests")

(in-package :logicky-lisp-tests)

(uiop:quit (if (run-all-tests) 0 1))
