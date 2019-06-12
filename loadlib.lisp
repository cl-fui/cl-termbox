(in-package :tb)

(cffi:define-foreign-library libtermbox
;;  (:darwin (:or "...dylib"))
   (:unix (:or "libtermbox.so"))
;;  (:windows (:or "..."))
   (t (:default "libtermbox.so")))

(use-foreign-library libtermbox)

;;(load-foreign-library "libtermbox.so")
;;(load-foreign-library (asdf:system-relative-pathname 'cl-termbox "libtermbox.so"))








