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

(defconstant HIDE-CURSOR -1)

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
(defcstruct  tb-cell 
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
  (mod  :uint8)	 ; /* modifiers to either 'key' or 'ch' below */
  (key  :uint16) ; /* one of the KEY-* constants */
  (ch   :uint32) ; /* unicode character */
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
(defconstant  EUNSUPPORTED-TERMINAL -1)
(defconstant  EFAILED-TO-OPEN-TTY   -2)
(defconstant  EPIPE-TRAP-ERROR      -3)


(defconstant  INPUT-CURRENT 0);; /* 000 */
(defconstant  INPUT-ESC     1);; /* 001 */
(defconstant  INPUT-ALT     2);; /* 010 */
(defconstant  INPUT-MOUSE   4);; /* 100 */

(defconstant  OUTPUT-CURRENT   0)
(defconstant  OUTPUT-NORMAL    1)
(defconstant  OUTPUT-256       2)
(defconstant  OUTPUT-216       3)
(defconstant  OUTPUT-GRAYSCALE 4)

;;=============================================================================
;; 12 official functions
;;
;;=============================================================================
#|| Initializes the termbox library. This function should be called before any
 * other functions. Function tb_init is same as tb_init_file("/dev/tty").
 * After successful initialization, the library must be
 * finalized using the tb_shutdown() function.
||#
(defcfun ("tb_init" init&) :int)
(defcfun ("tb_init_file" init-file&) :int
  (name :string))
(defcfun ("tb_init_fd" init-fd&) :int
  (inout :int))
(defcfun ("tb_shutdown" shutdown&) :int)

;;=============================================================================
#|| Returns the size of the internal back buffer (which is the same as
 * terminal's window size in characters). The internal buffer can be resized
 * after tb_clear() or tb_present() function calls. Both dimensions have an
 * unspecified negative value when called before tb_init() or after
 * tb_shutdown().
||#
(defcfun ("tb_width" width&) :int)
(defcfun ("tb_height" height&) :int)
;;=============================================================================
#|| Clears the internal back buffer using TB_DEFAULT color or the
 * color/attributes set by tb_set_clear_attributes() function.
||#
(defcfun ("tb_clear" clear&) :void)
(defcfun ("tb_set_clear_attributes" set-clear-attributes&) :void
  (fg :uint16) (bg :uint16))
;;=============================================================================
;; Synchronizes the internal back buffer with the terminal.
;;
(defcfun ("tb_present" present&) :void)
;;=============================================================================
#|| Sets the position of the cursor. Upper-left character is (0, 0). If you pass
 * TB_HIDE_CURSOR as both coordinates, then the cursor will be hidden. Cursor
 * is hidden by default.
||#

(defcfun ("tb_set_cursor" set-cursor&) :void
  (cx :int) (cy :int))

;;=============================================================================
#|| Changes cell's parameters in the internal back buffer at the specified
 * position.
||#
(defcfun ("tb_put_cell" put-cell&) :void
  (x :int) (y :int) (cell :pointer))

(defcfun ("tb_change_cell" change-cell&)  :void
  (x :int) (y :int) (ch :uint32)  (fg :uint16) (bg :uint16))

;;=============================================================================
#|| Copies the buffer from 'cells' at the specified position, assuming the
 * buffer is a two-dimensional array of size ('w' x 'h'), represented as a
 * one-dimensional buffer containing lines of cells starting from the top.
 *
 * (DEPRECATED: use tb_cell_buffer() instead and copy memory on your own)
||#
(defcfun ("tb_blit" blit&) :void
  (x :int) (y :int) (w :int) (h :int) (cells :pointer))

;;=============================================================================
#|| Returns a pointer to internal cell back buffer. You can get its dimensions
 * using tb_width() and tb_height() functions. The pointer stays valid as long
 * as no tb_clear() and tb_present() calls are made. The buffer is
 * one-dimensional buffer containing lines of cells starting from the top.
 *||#
(defcfun ("tb_cell_buffer" cell-buffer&) :pointer)

;;=============================================================================
#|| Sets the termbox input mode. Termbox has two input modes:
 * 1. Esc input mode.
 *    When ESC sequence is in the buffer and it doesn't match any known
 *    ESC sequence => ESC means TB_KEY_ESC.
 * 2. Alt input mode.
 *    When ESC sequence is in the buffer and it doesn't match any known
 *    sequence => ESC enables TB_MOD_ALT modifier for the next keyboard event.
 *
 * You can also apply TB_INPUT_MOUSE via bitwise OR operation to either of the
 * modes (e.g. TB_INPUT_ESC | TB_INPUT_MOUSE). If none of the main two modes
 * were set, but the mouse mode was, TB_INPUT_ESC mode is used. If for some
 * reason you've decided to use (TB_INPUT_ESC | TB_INPUT_ALT) combination, it
 * will behave as if only TB_INPUT_ESC was selected.
 *
 * If 'mode' is TB_INPUT_CURRENT, it returns the current input mode.
 *
 * Default termbox input mode is TB_INPUT_ESC.
||#
(defcfun ("tb_select_input_mode" select-input-mode&) :int
  (mode :int))

;;=============================================================================
#||  Sets the termbox output mode. Termbox has three output options:
 * 1. TB_OUTPUT_NORMAL     => [1..8]
 *    This mode provides 8 different colors:
 *      black, red, green, yellow, blue, magenta, cyan, white
 *    Shortcut: TB_BLACK, TB_RED, ...
 *    Attributes: TB_BOLD, TB_UNDERLINE, TB_REVERSE
 *
 *    Example usage:
 *        tb_change_cell(x, y, '@', TB_BLACK | TB_BOLD, TB_RED);
 *
 * 2. TB_OUTPUT_256        => [0..256]
 *    In this mode you can leverage the 256 terminal mode:
 *    0x00 - 0x07: the 8 colors as in TB_OUTPUT_NORMAL
 *    0x08 - 0x0f: TB_* | TB_BOLD
 *    0x10 - 0xe7: 216 different colors
 *    0xe8 - 0xff: 24 different shades of grey
 *
 *    Example usage:
 *        tb_change_cell(x, y, '@', 184, 240);
 *        tb_change_cell(x, y, '@', 0xb8, 0xf0);
 *
 * 3. TB_OUTPUT_216        => [0..216]
 *    This mode supports the 3rd range of the 256 mode only.
 *    But you don't need to provide an offset.
 *
 * 4. TB_OUTPUT_GRAYSCALE  => [0..23]
 *    This mode supports the 4th range of the 256 mode only.
 *    But you dont need to provide an offset.
 *
 * Execute build/src/demo/output to see its impact on your terminal.
 *
 * If 'mode' is TB_OUTPUT_CURRENT, it returns the current output mode.
 *
 * Default termbox output mode is TB_OUTPUT_NORMAL.
 * ||#
 (defcfun ("tb_select_output_mode" select-output-mode&) :int
   (mode :int))
;;=============================================================================
#|| Wait for an event up to 'timeout' milliseconds and fill the 'event'
 * structure with it, when the event is available. Returns the type of the
 * event (one of TB_EVENT_* constants) or -1 if there was an error or 0 in case
 * there were no event during 'timeout' period.
||#
(defcfun ("tb_peek_event" peek-event&) :int
  (event :pointer) (timeout :int))
;;=============================================================================
#|| Wait for an event forever and fill the 'event' structure with it, when the
 * event is available. Returns the type of the event (one of TB_EVENT_*
 * constants) or -1 if there was an error.
||#
(defcfun ("tb_poll_event" poll-event&) :int
  (event :pointer))



;;=============================================================================
;; UTF8 and Unicode utility functions...
;;
(defcfun ("tb_utf8_char_length" utf8-char-length&) :int
  (char :uint))
;;=============================================================================
(defcfun ("tb_utf8_char_to_unicode" utf8-char-to-unicode&) :uint32
  (out (:pointer :uint32)) (char (:pointer :uint32)))
;;=============================================================================
(defcfun ("tb_utf8_unicode_to_char" utf8-unicode-to-char&) :int
  (out (:pointer :uint32)) (c :uint32))








