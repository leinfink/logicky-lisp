# logicky-lisp

Evaluate and prove arguments in different formal logics.

Completely rewritten Common Lisp port of [Logicky](https://github.com/leinfink/logicky).  Mostly just to practice Common Lisp.

WIP, not much functionality yet.

## Usage

Run from sources:

    make run
    # defaults to 'sbcl --load run.lisp'

choose an alternative lisp (default is sbcl):

    LISP=ccl make run

or build and run the binary:

```
$ make build
$ ./logicky-lisp
```
