;;
;;
(asdf:defsystem #:cl-termbox
  :description "termbox bindings"
  :author "StackSmith <fpgasm@apple2.x10.mx>"
  :license "BSD 3-clause license"
  :serial t
  :depends-on (:cffi)
  :components ((:file "package")
	       (:file "loadlib")
	       (:file "tb")
;;	       (:file "include")
;;	       (:file "ncurses")
;;	       (:file "keys")
;;	       (:file "panel")
;;	       (:file "menu")
;;	       (:file "form")
	       ))

