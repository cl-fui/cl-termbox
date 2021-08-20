;;
;;
(asdf:defsystem #:cl-termbox
  :description "Bindings for termbox library, a minimalistic library for building text-mode applications without curses"
  :author "StackSmith <fpgasm@apple2.x10.mx>"
  :license "MIT license"
  :serial t
  :depends-on (:cffi)
  :components ((:file "package")
	       (:file "loadlib")
	       (:file "tb.bindings")
	       (:file "tb")
	       ))

