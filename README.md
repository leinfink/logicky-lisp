# Logicky Lisp
[![tests](https://github.com/leinfink/logicky-lisp/actions/workflows/tests.yml/badge.svg?branch=main)](https://github.com/leinfink/logicky-lisp/actions/workflows/tests.yml) ![GitHub commit activity](https://img.shields.io/github/commit-activity/m/leinfink/logicky-lisp) ![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/leinfink/logicky-lisp?color=%23ffa640)

**WIP, not much functionality yet.**

-----

Evaluate and prove arguments in different formal logics.

Completely rewritten Common Lisp port of [Logicky](https://github.com/leinfink/logicky).  Mostly just to practice Common Lisp.



## Usage

[Full reference manual](https://leinfink.github.io/logicky-lisp/reference/) (incl. internal symbols)

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
