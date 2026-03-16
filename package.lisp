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

(defpackage #:nand2tetris.test.util
  (:use #:cl #:nand2tetris.util)
  (:local-nicknames (#:a #:alexandria)
                    (#:s #:serapeum)))

(defpackage #:nand2tetris.assembler
  (:use #:cl)
  (:local-nicknames (#:u #:nand2tetris.util)
                    (#:a #:alexandria)
                    (#:s #:serapeum)))

(defpackage #:nand2tetris.test.assembler
  (:use #:cl #:nand2tetris.assembler)
  (:local-nicknames (#:u #:nand2tetris.util)
                    (#:a #:alexandria)
                    (#:s #:serapeum)))

(defpackage #:nand2tetris.vm-translator
  (:use #:cl)
  (:local-nicknames (#:u #:nand2tetris.util)
                    (#:a #:alexandria)
                    (#:s #:serapeum)))

(defpackage #:nand2tetris.test.vm-translator
  (:use #:cl #:nand2tetris.vm-translator)
  (:local-nicknames (#:u #:nand2tetris.util)
                    (#:a #:alexandria)
                    (#:s #:serapeum)))
