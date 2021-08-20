;;
;;
(asdf:defsystem #:cl-termbox
  :description "termbox bindings"
  :author "StackSmith <fpgasm@apple2.x10.mx>"
  :license "MIT license"
  :serial t
  :depends-on (:cffi)
  :components ((:file "package")
	       (:file "loadlib")
	       (:file "tb.bindings")
	       (:file "tb")
	       ))

