(in-package :tb)

(define-condition tb-error (error)
  ((kind
    :initarg :kind
    :accessor :tb-error-kind
    :initform nil)   )
  (:documentation "Signaled when textbox library returns an error."))
;;=============================================================================

;;
;;=============================================================================
(defun init-error (numeric-error-code)
  (error 'cl-textbox-error
	 :kind (case numeric-error-code
		 (-1 EUNSUPPORTED-TERMINAL)
		 (-2 EFAILED-TO-OPEN-TTY)
		 (-3 EPIPE-TRAP-ERROR)
		 (T 'UNKNOWN-ERROR))))


(defun init ()
  (let ((result (init&)))
    (when (minusp result) (init-error result))))
(defun init-file (filename)
  (let ((result (init-file& filename)))
    (when (minusp result) (init-error result))))
(defun init-fd (fd)
  (let ((result (init-fd& fd)))
    (when (minusp result) (init-error result))))
(defun shutdown ()
  (let ((result (shutdown&)))
    (when (minusp result) (init-error result))))


(defmacro width () `(width&))
(defmacro height () `(height&))

(defmacro clear () `(height&))
(defmacro set-clear-attributes (fg bg)
  `(set-clear-attributes& ,fg ,bg))
(defmacro present () `(present&))

(defmacro set-cursor (x y)
  `(set-cursor& ,x ,y))
;; tb:put-cell stores a cell from a cell ptr, so we leave it alone.
(defmacro change-cell (x y ch fg bg)
  `(change-cell& ,x ,y ,ch ,fg ,bg))
;; tb:blit is deprecated...
;; cell-buffer& returns a buffer pointer...
(defmacro select-input-mode (mode)
  `(select-input-mode& ,mode))

(defmacro select-output-mode (mode)
  `(select-output-mode& ,mode))

;;poll-event and peek-event
