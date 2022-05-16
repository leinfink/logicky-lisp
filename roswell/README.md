
## How to use Roswell to build and share binaries

From the project root:

Run as a script:

    chmod +x roswell/logicky-lisp.ros
    ./roswell/logicky-lisp.ros

Build a binary:

    ros build roswell/logicky-lisp.ros

and run it:

    ./roswell/logicky-lisp

Or install it in ~/.roswell/bin:

    ros install roswell/logicky-lisp.ros

It creates the binary in ~/.roswell/bin/
Run it:

    ~/.roswell/bin/logicky-lisp [name]~&

Your users can install the script with ros install leinfink/logicky-lisp

Use `+Q` if you don't have Quicklisp dependencies to save startup time.
Use `ros build --disable-compression` to save on startup time and loose on application size.


## See

- https://github.com/roswell/roswell/wiki/
- https://github.com/roswell/roswell/wiki/Reducing-Startup-Time
