# cl-termbox

**CL-TERMBOX** is a set of cffi bindings to the tiny [TERMBOX](https://github.com/termbox/termbox) library for terminal output. 

## Overview

`libtermbox` is a simplistic text-mode library for building user-interfaces based on a rectangular grid of character cells.  

CL-TERMBOX is a hand-built set of CFFI bindings, providing a verbatim low-level set of bindings, and a very thin lisp wrapper.  Currently, only linux bindings are loaded.  If you need to get it working on another machine, please open an issue or a pull request.

## Detail

All C names are converted to Lisp conventions by removing the `tb_` prefix and replacing underscores with dashes.  All low-level C bindings have a `&` suffix; Lisp layer functions has no such suffix.  In many cases, Lisp layer simply invokes the binding.

Low-level calls are not exported and should be accessed with a `TB::` prefix (and a `&` suffix).  High-level functions are exported, and should be accessed with a `TB:` prefix.  See `package.lisp` file for all exports.

A few bindings are low-level only and have no high-level wrapper:
* `tb::blit&` is available, but is deprecated.  
* `tb::put-cell&` stores a cell via a pointer parameter, and the Lisp use-case is unclear.
* `tb::cell-buffer&` returns a pointer to the buffer, and the use-case is unclear.


* `tb::poll-event&` and `tb::peek-event&` return a raw foreign structure.  To be fixed.
* utf/unicode functions deal with buffer pointers and the Lisp use-case is unclear.

## Getting started - for EMACS/Slime users:

CL-TERMBOX runs in a **real terminal**.  In order to use these bindings, Lisp must be started in a shell, and not from Emacs.  However, if Lisp is running SWANK, Emacs can connect to it.

SBCL:`sbcl --eval "(progn (ql:quickload '(:swank) :silent t))" --eval "(progn (swank:create-server :port 4006 :dont-close t)(loop (sleep 10000)))"`

Roswell: `ros run -e "(progn (ql:quickload '(:swank) :silent t))" -e "(progn (swank:create-server :port 4006 :dont-close t) (loop (sleep 10000))) "`

Connect to it from Emacs with `slime-connect`, entering the same port (4006 in this case).

In some cases swank may work better with `:style :fd-handler`.

Now, call `(tb:init)` to connect to the terminal.  When done, call `(tb:shutdown)`.

### Notes:

Make sure you set an output mode that makes sense.  My terminal defaults to a mode in which colors were off by one.

A minimal error trap around init and shutdown will report TB-ERROR but keep in mind that shutting down more than once will result in a SIGABRT. 
