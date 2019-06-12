# cl-termbox

CL-TERMBOX is a set of cffi bindings to the tiny TERMBOX library for terminal output.

## STATUS

Low-level bindings implemented.   For now the library is right here and loaded crudely (works with my Ubuntu) - I have to investigate how the C library installs on different platforms.  But it does work.

## EMACS/Slime users:

CL-TERMBOX runs in a real terminal.  These bindings control the terminal that started Lisp.  If you start your CL implementation from a terminal, things make sense. 

If you use Slime and Emacs, take a minute to figure out what's happening.

First of all, you cannot just start SLIME - there is no terminal (Emacs buffer is not a terminal).  So you need to start a separate SWANK session in a real terminal:

SBCL:`sbcl --eval "(progn (ql:quickload '(:swank) :silent t)" --eval "(swank:create-server :port 4006 :dont-close t)"`

Roswell: `ros run -e "(progn (ql:quickload '(:swank) :silent t)" -e "(swank:create-server :port 4006 :dont-close t) (loop (sleep 10000))) "`

Now SWANK is running in a thread talking to SLIME, but the terminal most likely has a separate REPL in it.  The REPL will eat characters and print things, messing up your output.  So you probably want to sleep the thread with something like `(loop (sleep 10000))` (or something wiser than that)
Connect to it from Emacs with `slime-connect`, entering the same port (4006 in this case).

In some cases swank may work better with `:style :fd-handler`.


