# cl-termbox

**CL-TERMBOX** is a set of cffi bindings to the tiny [TERMBOX](https://github.com/nsf/termbox) library for terminal output.  `libtermbox` is a simplistic text-mode library for building user-interfaces based on a rectangular grid of character cells.  CL-TERMBOX is a set of CFFI bindings and an attempt to minimally lispify it.

As this is a low-level binding library, it is pretty much a verbatim wrapper around termbox and termbox documentation should be consulted.  A minimal error trap around init and shutdown will report TB-ERROR but keep in mind that shutting down more than once will result in a SIGABRT. 

Termbox symbols are exported from CL-TERMBOX and may be accessed using the TB nickname, e.g. `(tb:init)` or `tb:KEY-CTRL-I`.  See `package.lisp` file for all exports

## STATUS

Work in progress.

Low-level bindings implemented.   Only linux bindings are loaded (see `loadlib.lisp`).  If you get it running on other machines, please let me know - or open a pull request.

## Getting started - for EMACS/Slime users:

CL-TERMBOX runs in a **real terminal**.  These bindings control the terminal that started Lisp.  If you start your CL implementation from a terminal, things make sense. If you use Slime and Emacs, please take a minute to figure out what's happening.

First of all, you cannot just start SLIME - there is no terminal! (_Emacs buffer is not a terminal_).  So you need to start a separate SWANK session in a real terminal:

SBCL:`sbcl --eval "(progn (ql:quickload '(:swank) :silent t))" --eval "(swank:create-server :port 4006 :dont-close t)"`

Roswell: `ros run -e "(progn (ql:quickload '(:swank) :silent t))" -e "(progn (swank:create-server :port 4006 :dont-close t) (loop (sleep 10000))) "`

Now SWANK is running in a thread talking to SLIME, but the terminal most likely has a separate REPL in it.  The REPL will eat characters and print things, messing up your output.  So you probably want to sleep the thread with something like `(loop (sleep 10000))` (or something smarter)
Connect to it from Emacs with `slime-connect`, entering the same port (4006 in this case).

In some cases swank may work better with `:style :fd-handler`.


Now, call `(tb:init)` to connect to the terminal.  When done, call `(tb:shutdown)`.
