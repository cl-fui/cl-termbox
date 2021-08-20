;;
;;
(asdf:defsystem #:cl-termbox
  :description "Bindings to termbox library, for text-mode terminal applications without curses"
  :author "StackSmith <fpgasm@apple2.x10.mx>"
  :license "MIT license"
  :serial t
  :depends-on (:cffi)
  :components ((:file "package")
	       (:file "loadlib")
	       (:file "tb.bindings")
	       (:file "tb")
	       ))

