(in-package :tb)
#||  TEST.LISP

Excersize some functions...


||#


(defparameter chars "nnnnnnnnnbbbbbbbbbuuuuuuuuuBBBBBBBBB")
(defparameter all-attrs #(0 #.A-BOLD #.A-UNDERLINE #. (+ A-BOLD A-UNDERLINE)))

(defun next-char (current)
  (if (= 35 current)
      0
      (1+ current)))

(defun draw-line (x y bg)
  (let ((current-char 0))
    (loop for a from 0 below 4 do
	 (loop for c from DEFAULT to WHITE
	    for fg = (+ c (aref all-attrs a))
	    do
	      (change-cell x y (char-code (aref chars current-char)) fg bg)
	      (setf current-char (next-char current-char)
		    x (1+ x))	      ))))


(defun print-combinations-table (sx sy attrs attrs-n)
  (loop for i from 0 below attrs-n do
       (loop for c from DEFAULT to WHITE
	  for bg = (+ c (aref attrs i))
	  do
	    (draw-line sx sy bg)
	    (incf sy)) ))

(defun draw-all ()
  ;;(init)
  (clear)
  (select-output-mode OUTPUT-NORMAL)
  (let ((col1 #(0 #.A-REVERSE))) ;;	(col2 #(#.A-REVERSE))
    (print-combinations-table 1 1 col1 2)
    )
  (present)
  (select-output-mode OUTPUT-256)
  (loop for x from 0 below 255 do
       ;;(print x)
       (change-cell x 23 (char-code #\@) x 0)
       (change-cell x 24 (char-code #\ ) 0 x)
       )
  (present)
  ;;(shutdown)
  )




(defun pr (str &optional (fg tb:DEFAULT) (bg tb:DEFAULT))
  "Output str at cursor position; advance cursor.  No wrap"
  (loop :for x :from *CUR-X*
	:for ch :across str
	:do
	  (change-cell x *CUR-Y* (char-code ch) fg bg)
	:finally
	   (set-cursor x *CUR-Y*))
)



