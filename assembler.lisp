;;;; assembler.lisp

(in-package #:nand2tetris.assembler)

(defconstant +max-a-instruction-value+ 32767)

(defconstant +max-memory-address+ #x6000
  "Maximum addressable memory cell.")

;;; Data Types

;; Assembler-side - symbolic, human-readable representations of
;; concepts

(deftype memory-address ()
  "Valid memory addresses."
  `(integer 0 ,+max-memory-address+))

(deftype memory-label ()
  ""
  'string)

(defun %jump-mode-p (mode)
  (member mode '(nil :JGT :JEQ :JGE :JLT :JNE :JLE :JMP)))

(deftype jump-mode ()
  "Valid jump modes for C-instructions."
  '(satisfies %jump-mode-p))

;; Machine language side - bit representations of concepts. Use prefix
;; BINARY-

(deftype binary-jump-mode ()
  "Valid bit representations of jump modes."
  '(bit-vector 3))

(defun %binary-comp-p (bv)
  (member bv (a:hash-table-values +comp-instructions->bits+)
          :test #'equal))

(deftype binary-comp-instruction ()
  ""
  '(and (bit-vector 7)
    (satisfies %binary-comp-p)))

;;; Instructions

(a:define-constant +jump-mode->bits+
    (a:alist-hash-table
     '((nil . #*000)
       (:JGT . #*001)
       (:JEQ . #*010)
       (:JGE . #*011)
       (:JLT . #*100)
       (:JNE . #*101)
       (:JLE . #*110)
       (:JMP . #*111))))

(a:define-constant +comp-instructions->bits+
  (a:alist-hash-table
   '(("0" . #*0101010)
     ("1" . #*0111111)
     ("-1" . #*0111010)
     ("D" . #*0001100)
     ("A" . #*0110000)
     ("!D" . #*0001101)
     ("!A" . #*0110001)
     ("-D" . #*0001111)
     ("-A" . #*0110011)
     ("D+1" . #*0011111)
     ("A+1" . #*0110111)
     ("D-1" . #*0001110)
     ("A-1" . #*0110010)
     ("D+A" . #*0000010)
     ("D-A" . #*0010011)
     ("A-D" . #*0000111)
     ("D&A" . #*0000000)
     ("D|A" . #*0010101)
     ("M" . #*1110000)
     ("!M" . #*1110001)
     ("-M" . #*1110011)
     ("M+1" . #*1110111)
     ("M-1" . #*1110010)
     ("D+M" . #*1000010)
     ("D-M" . #*1010011)
     ("M-D" . #*1000111)
     ("D&M" . #*1000000)
     ("D|M" . #*1010101))
   :test #'equal))

(defclass instruction ()
  ()
  (:documentation "Base class for Hack instructions. Not to be instantiated
independently."))

(defclass a-instruction (instruction)
  ((address
    :initarg :address
    :reader address
    :type memory-address)
   (symbolic
    :initarg :symbol
    :reader symbolic
    :type memory-label))
  (:documentation "A-instructions set the address register A. They operate either on
literal addresses, or on symbolic labels."))


(defclass c-instruction (instruction)
  ((dest
    :initarg :dest
    :initform nil
    :reader dest)
   (comp
    :initarg :comp
    :reader comp)
   (jump
    :initarg :jump
    :initform nil
    :reader jump
    :type jump-mode))
  (:documentation "C-instructions carry out actual computations. DEST (optional)
specifies where the result of COMP should end up. COMP is the type of
computation to be carried out. JUMP (optional) specifies the jump mode
to be executed after computation."))

(defclass label (instruction)
  ((name
    :initarg :name
    :reader name
    :type string))
  (:documentation "Symbolic label for referring to memory addresses."))

;;; Translation

(defgeneric translate (instruction)
  (:documentation "Translate instruction to raw machine code."))

