LISP ?= sbcl

all: test

run:
	rlwrap $(LISP) --load run.lisp

build:
	$(LISP)	--non-interactive \
		--load logicky-lisp.asd \
		--eval '(ql:quickload :logicky-lisp)' \
		--eval '(asdf:make :logicky-lisp)'

test:
	$(LISP) --non-interactive \
		--load run-tests.lisp
