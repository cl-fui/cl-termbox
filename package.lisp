;;;; package.lisp

(defpackage #:cl-termbox
  (:nicknames :tb)
  (:use #:cffi #:cl)
  ;; Functions
  (:export
   #:init  #:init-file #:init-fd
   #:shutdown
   #:width #:height
   #:clear #:set-clear-attributes
   #:present
   #:set-cursor
   ;; #:put-cell
   #:change-cell
   ;; #:blit
   #:cell-buffer
   #:select-input-mode
   #:select-output-mode
   ;;#:peek-event #:poll-event
   ;;#:utf8-char-length
   ;;#:utf8-char-to-unicode
   ;;#:utf8-unicode-to-char
   )
  ;; Keys:
  (:export
   #:KEY-F1 #:KEY-F2 #:KEY-F3 #:KEY-F4 #:KEY-F5 #:KEY-F6
   #:KEY-F7 #:KEY-F8 #:KEY-F9 #:KEY-F10 #:KEY-F1 #:KEY-F12
   #:KEY-INSERT #:KEY-DELETE #:KEY-HOME #:KEY-END #:KEY-PGUP #:KEY-PGDN
   #:KEY-ARROW-UP #:KEY-ARROW-DOWN #:KEY-ARROW-LEFT #:KEY-ARROW-RIGHT
   #:KEY-MOUSE-LEFT #:KEY-MOUSE-RIGHT #:KEY-MOUSE-MIDDLE
   #:KEY-MOUSE-RELEASE #:KEY-MOUSE-WHEEL-UP #:KEY-MOUSE-WHEEL-DOWN
   #:KEY-CTRL-TILDE #:KEY-CTRL-2 #:KEY-CTRL-A #:KEY-CTRL-B
   #:KEY-CTRL-C #:KEY-CTRL-D #:KEY-CTRL-E #:KEY-CTRL-F
   #:KEY-CTRL-G #:KEY-BACKSPACE #:KEY-CTRL-H #:KEY-TAB
   #:KEY-CTRL-I #:KEY-CTRL-J #:KEY-CTRL-K #:KEY-CTRL-M
   #:KEY-CTRL-N #:KEY-CTRL-O #:KEY-CTRL-P #:KEY-CTRL-Q
   #:KEY-CTRL-R #:KEY-CTRL-S #:KEY-CTRL-T #:KEY-CTRL-U
   #:KEY-CTRL-V #:KEY-CTRL-W #:KEY-CTRL-X #:KEY-CTRL-Y
   #:KEY-CTRL-Z #:KEY-ESC #:KEY-CTRL-LSQ-BRACKET #:KEY-CTRL-3
   #:KEY-CTRL-4 #:KEY-BACKSLASH #:KEY-CTRL-5 #:KEY-CTRL-RSQ-BRACKET
   #:KEY-CTRL-6 #:KEY-CTRL-7 #:KEY-CTRL-SLASH #:KEY-CTRL-UNDERSCORE
   #:KEY-SPACE #:KEY-BACKSPACE2 #:KEY-CTRL-8
   #:MOD-ALT #:MOD-MOTION
   )
  ;; Colors and Attributes
  (:export
   #:DEFAULT #:BLACK #:RED #:GREEN #:YELLOW #:BLUE #:MAGENTA #:CYAN #:WHITE
   #:A-BOLD #:A-UNDERLINE #:A-REVERSE
   )
  ;; Events:
  (:export #:EVENT-KEY #:EVENT-RESIZE #:EVENT-MOUSE)
  ;; Error codes.
  (:export
   #:tb-error #:tb-error-kind 
   #:EUNSUPPORTED-TERMINAL
   #:EFAILED-TO-OPEN-TTY
   #:EPIPE-TRAP-ERROR)
  ;;
  (:export
   #:INPUT-CURRENT #:INPUT-ESC #:INPUT-ALT #:INPUT-MOUSE
   #:OUTPUT-CURRENT #:OUTPUT-NORMAL #:OUTPUT-256 #:OUTPUT-216
   #:OUTPUT-GRAYSCALE))


