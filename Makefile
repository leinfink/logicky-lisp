LISP ?= sbcl

all: test

run:
	$(LISP) --load run.lisp

build:
	$(LISP)	--non-interactive \
		--load logicky-lisp.asd \
		--eval '(ql:quickload :logicky-lisp)' \
		--eval '(asdf:make :logicky-lisp)'

test:
	$(LISP) --non-interactive \
		--load tests/run-tests.lisp

# declt only works with SBCL
generate-docs:
	sbcl	--non-interactive \
		--load docs/make-docs.lisp
