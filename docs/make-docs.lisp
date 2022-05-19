(load "logicky-lisp.asd")
(ql:quickload "net.didierverna.declt")
(net.didierverna.declt:nickname-package)
(declt:declt :logicky-lisp             
             :library-name "Logicky-Lisp"
             :tagline "Evaluates and proves arguments in different formal logics."
             :introduction "Welcome to the reference manual of Logicky-Lisp."
             :declt-notice :short)
(asdf/driver:run-program "mv Logicky-Lisp.texi docs/logicky-lisp.texi")
(asdf/driver:run-program "makeinfo --html --output=docs/reference/ docs/logicky-lisp.texi --css-include=docs/reference/static/texinfo-klare.css")
