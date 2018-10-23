(in-package :tb)

(defparameter  KEY-F1               (- #xFFFF 0))
(defparameter  KEY-F2               (- #xFFFF 1))
(defparameter  KEY-F3               (- #xFFFF 2))
(defparameter  KEY-F4               (- #xFFFF 3))
(defparameter  KEY-F5               (- #xFFFF 4))
(defparameter  KEY-F6               (- #xFFFF 5))
(defparameter  KEY-F7               (- #xFFFF 6))
(defparameter  KEY-F8               (- #xFFFF 7))
(defparameter  KEY-F9               (- #xFFFF 8))
(defparameter  KEY-F10              (- #xFFFF 9))
(defparameter  KEY-F11              (- #xFFFF 10))
(defparameter  KEY-F12              (- #xFFFF 11))
(defparameter  KEY-INSERT           (- #xFFFF 12))
(defparameter  KEY-DELETE           (- #xFFFF 13))
(defparameter  KEY-HOME             (- #xFFFF 14))
(defparameter  KEY-END              (- #xFFFF 15))
(defparameter  KEY-PGUP             (- #xFFFF 16))
(defparameter  KEY-PGDN             (- #xFFFF 17))
(defparameter  KEY-ARROW-UP         (- #xFFFF 18))
(defparameter  KEY-ARROW-DOWN       (- #xFFFF 19))
(defparameter  KEY-ARROW-LEFT       (- #xFFFF 20))
(defparameter  KEY-ARROW-RIGHT      (- #xFFFF 21))
(defparameter  KEY-MOUSE-LEFT       (- #xFFFF 22))
(defparameter  KEY-MOUSE-RIGHT      (- #xFFFF 23))
(defparameter  KEY-MOUSE-MIDDLE     (- #xFFFF 24))
(defparameter  KEY-MOUSE-RELEASE    (- #xFFFF 25))
(defparameter  KEY-MOUSE-WHEEL-UP   (- #xFFFF 26))
(defparameter  KEY-MOUSE-WHEEL-DOWN (- #xFFFF 27))

;; These are all ASCII code points below SPACE character and a BACKSPACE key. 
(defparameter  KEY-CTRL-TILDE       #x00)
(defparameter  KEY-CTRL-2           #x00) ;;/* clash with 'CTRL-TILDE' */
(defparameter  KEY-CTRL-A           #x01)
(defparameter  KEY-CTRL-B           #x02)
(defparameter  KEY-CTRL-C           #x03)
(defparameter  KEY-CTRL-D           #x04)
(defparameter  KEY-CTRL-E           #x05)
(defparameter  KEY-CTRL-F           #x06)
(defparameter  KEY-CTRL-G           #x07)
(defparameter  KEY-BACKSPACE        #x08)
(defparameter  KEY-CTRL-H           #x08) ;;/* clash with 'CTRL-BACKSPACE' */
(defparameter  KEY-TAB              #x09)
(defparameter  KEY-CTRL-I           #x09) ;;/* clash with 'TAB' */
(defparameter  KEY-CTRL-J           #x0A)
(defparameter  KEY-CTRL-K           #x0B)
(defparameter  KEY-CTRL-L           #x0C)
(defparameter  KEY-ENTER            #x0D)
(defparameter  KEY-CTRL-M           #x0D) ;;/* clash with 'ENTER' */
(defparameter  KEY-CTRL-N           #x0E)
(defparameter  KEY-CTRL-O           #x0F)
(defparameter  KEY-CTRL-P           #x10)
(defparameter  KEY-CTRL-Q           #x11)
(defparameter  KEY-CTRL-R           #x12)
(defparameter  KEY-CTRL-S           #x13)
(defparameter  KEY-CTRL-T           #x14)
(defparameter  KEY-CTRL-U           #x15)
(defparameter  KEY-CTRL-V           #x16)
(defparameter  KEY-CTRL-W           #x17)
(defparameter  KEY-CTRL-X           #x18)
(defparameter  KEY-CTRL-Y           #x19)
(defparameter  KEY-CTRL-Z           #x1A)
(defparameter  KEY-ESC              #x1B)
(defparameter  KEY-CTRL-LSQ-BRACKET #x1B) ;;/* clash with 'ESC' */
(defparameter  KEY-CTRL-3           #x1B) ;;/* clash with 'ESC' */
(defparameter  KEY-CTRL-4           #x1C)
(defparameter  KEY-CTRL-BACKSLASH   #x1C) ;;/* clash with 'CTRL-4' */
(defparameter  KEY-CTRL-5           #x1D)
(defparameter  KEY-CTRL-RSQ-BRACKET #x1D) ;;/* clash with 'CTRL-5' */
(defparameter  KEY-CTRL-6           #x1E)
(defparameter  KEY-CTRL-7           #x1F)
(defparameter  KEY-CTRL-SLASH       #x1F) ;;/* clash with 'CTRL-7' */
(defparameter  KEY-CTRL-UNDERSCORE  #x1F) ;;/* clash with 'CTRL-7' */
(defparameter  KEY-SPACE            #x20)
(defparameter  KEY-BACKSPACE2       #x7F)
(defparameter  KEY-CTRL-8           #x7F) ;;/* clash with 'BACKSPACE2' */

(defparameter  MOD-ALT    #x01)
(defparameter  MOD-MOTION #x02)

;;/* Colors (see struct tb-cell's fg and bg fields). */
(defparameter  DEFAULT #x00)
(defparameter  BLACK   #x01)
(defparameter  RED     #x02)
(defparameter  GREEN   #x03)
(defparameter  YELLOW  #x04)
(defparameter  BLUE    #x05)
(defparameter  MAGENTA #x06)
(defparameter  CYAN    #x07)
(defparameter  WHITE   #x08)

#||
/* Attributes, it is possible to use multiple attributes by combining them
 * using bitwise OR ('|'). Although, colors cannot be combined. But you can
 * combine attributes and a single color. See also struct tb-cell's fg and bg
 * fields.
 */
||#
(defparameter  A-BOLD      #x0100)
(defparameter  A-UNDERLINE #x0200)
(defparameter  A-REVERSE   #x0400)
#||
/* A cell, single conceptual entity on the terminal screen. The terminal screen
 * is basically a 2d array of cells. It has the following fields:
 *  - 'ch' is a unicode character
 *  - 'fg' foreground color and attributes
 *  - 'bg' background color and attributes
 */
||#
(defcstruct  tb-uint32 
  (ch :uint32)
  (fg :uint16)
  (bg :uint16));

(defparameter  EVENT-KEY    1)
(defparameter  EVENT-RESIZE 2)
(defparameter  EVENT-MOUSE  3)
#||
/* An event, single interaction from the user. The 'mod' and 'ch' fields are
 * valid if 'type' is EVENT-KEY. The 'w' and 'h' fields are valid if 'type'
 * is EVENT-RESIZE. The 'x' and 'y' fields are valid if 'type' is
 * EVENT-MOUSE. The 'key' field is valid if 'type' is either EVENT-KEY
 * or EVENT-MOUSE. The fields 'key' and 'ch' are mutually exclusive; only
 * one of them can be non-zero at a time.
 */
||#
(defcstruct tb-event 
  (type :uint8)
  (mod  :uint8)	; /* modifiers to either 'key' or 'ch' below */
  (key  :uint16)	 ; /* one of the KEY-* constants */
  (ch   :uint32)	 ; /* unicode character */
  (w    :int32)
  (h    :int32)
  (x    :int32)
  (y    :int32)
  );

#||
/* Error codes returned by tb-init(). All of them are self-explanatory, except
 * the pipe trap error. Termbox uses unix pipes in order to deliver a message
 * from a signal handler (SIGWINCH) to the main event reading loop. Honestly in
 * most cases you should just check the returned code as < 0.
 */
||#
(defparameter  EUNSUPPORTED-TERMINAL -1)
(defparameter  EFAILED-TO-OPEN-TTY   -2)
(defparameter  EPIPE-TRAP-ERROR      -3)


(defparameter  INPUT-CURRENT 0);; /* 000 */
(defparameter  INPUT-ESC     1);; /* 001 */
(defparameter  INPUT-ALT     2);; /* 010 */
(defparameter  INPUT-MOUSE   4);; /* 100 */

(defparameter  OUTPUT-CURRENT   0)
(defparameter  OUTPUT-NORMAL    1)
(defparameter  OUTPUT-256       2)
(defparameter  OUTPUT-216       3)
(defparameter  OUTPUT-GRAYSCALE 4)

(defcfun ("tb_init" init&) :int)
(defcfun ("tb_shutdown" shutdown&) :int)

(defcfun ("tb_width" width&) :int)
(defcfun ("tb_height" height&) :int)

(defcfun ("tb_clear" clear&) :void)
(defcfun ("tb_set_clear_attributes" set-clear-attributes&) :void
  (fg :uint16) (bg :uint16))

(defcfun ("tb_present" present&) :void)

(defcfun ("tb_set_cursor" set-cursor&) :void
  (cx :int) (cy :int))

(defcfun ("tb_put_cell" put-cell&) :void
  (x :int) (y :int) (cell :pointer))
(defcfun ("tb_change_cell" change-cell&) :void
  (x :int) (y :int) (ch :uint32)   (fg :uint16) (bg :uint16))

(defcfun ("tb_blit" blit&) :void
  (x :int) (y :int) (w :int) (h :int) (cells :pointer))

(defcfun ("tb_cell_buffer" cell-buffer&) :pointer)
(defcfun ("tb_select_input_mode" select-input-mode&) :int
  (mode :int))
(defcfun ("tb_select_output_mode" select-output-mode&) :int
  (mode :int))
(defcfun ("tb_peek_event" peek-event&) :int
  (event :pointer) (timeout :int))
(defcfun ("tb_poll_event" poll-event&) :int
  (event :pointer))

(defcfun ("tb_utf8_char_length" utf8-char-length&) :int
  (char :int))

(defcfun ("tb_utf8_char_to_unicode" utf8-char-to-unicode&) :int
  (out (:pointer :uint32) (char :uint32)))
(defcfun ("tb_cutf8_unicode_to_char" utf8-unicode-to-char&) :int
  (out (:pointer :uint32) (c :uint32)))








