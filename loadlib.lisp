(in-package :tb)
#||
(cffi:define-foreign-library libtermbox
;;  (:darwin (:or "lincurses.dylib" "libcurses.dylib"))
;;  (:unix (:or "/home/stack/.roswell/lisp/quicklisp/local-projects/cl-termbox/libtermbox.so"))
   (:unix (:or "libtermbox.so"))
;;  (:windows (:or "pdcurses" "libcurses"))
   (t (:default "libtermbox")))

;;(use-foreign-library libtermbox)
||#

;;(load-foreign-library "libtermbox.so")
(load-foreign-library (asdf:system-relative-pathname 'cl-termbox "libtermbox.so"))







