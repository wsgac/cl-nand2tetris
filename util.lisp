;;;; util.lisp

(in-package #:nand2tetris.util)

(defun bit-string->bit-vector (bit-string)
  (assert (every (a:rcurry #'member '(#\0 #\1)) bit-string))
  (map 'bit-vector #'digit-char-p bit-string))

(setf (fdefinition 'bs->bv) #'bit-string->bit-vector)

#+(or)
(bit-string->bit-vector "0000")
#+(or)
(bit-string->bit-vector "1111")
#+(or)
(bit-string->bit-vector "1234")

(defun bit-vector->bit-string (bit-vector)
  (map 'string #'digit-char bit-vector))

(setf (fdefinition 'bv->bs) #'bit-vector->bit-string)

#+(or)
(bit-vector->bit-string #*0000)
#+(or)
(bit-vector->bit-string #*1111)

(defun bit-vector-concat (&rest bv)
  (apply #'concatenate 'bit-vector bv))

(setf (fdefinition 'bv-concat) #'bit-vector-concat)

#+(or)
(bit-vector-concat #*0000 #*1111)

#+(or)
(bit-vector-concat #*0000 #*1111 #*1010)
