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


