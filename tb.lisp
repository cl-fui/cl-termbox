(in-package :tb)

(define-condition tb-error (error)
  ((kind
    :initarg :kind
    :accessor :tb-error-kind
    :initform nil)   )
  (:documentation "Signaled when textbox library returns an error."))
;;=============================================================================
;; 12 official functions
;;
;;=============================================================================
#|| Initializes the termbox library. This function should be called before any
 * other functions. Function tb_init is same as tb_init_file("/dev/tty").
 * After successful initialization, the library must be
 * finalized using the tb_shutdown() function.
||#
(defcfun ("tb_init"      init&) :int)
(defcfun ("tb_init_file" init-file&) :int
  (name :string))
(defcfun ("tb_init_fd"   init-fd&) :int
  (inout :int))
(defcfun ("tb_shutdown"  shutdown&) :int)

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
  (let ((result (init-file& fd)))
    (when (minusp result) (init-error result))))
(defun shutdown ()
  (let ((result (shutdown&)))
    (when (minusp result) (init-error result))))


