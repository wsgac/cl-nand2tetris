;;;; package.lisp

(defpackage #:nand2tetris.util
  (:use #:cl)
  (:local-nicknames (#:a #:alexandria)
                    (#:s #:serapeum))
  (:export #:bit-string->bit-vector
           #:bit-vector->bit-string
           #:bs->bv
           #:bv->bs
           #:bv-concat))

(defpackage #:nand2tetris.assembler
  (:use #:cl)
  (:local-nicknames (#:u #:nand2tetris.util)
                    (#:a #:alexandria)
                    (#:s #:serapeum)))

(defpackage #:nand2tetris.vm-translator
  (:use #:cl)
  (:local-nicknames (#:u #:nand2tetris.util)
                    (#:a #:alexandria)
                    (#:s #:serapeum)))
