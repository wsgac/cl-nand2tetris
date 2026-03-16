;;;; cl-nand2tetris.asd

(asdf:defsystem #:cl-nand2tetris
  :description "Common Lisp implementation of the Nand2Tetris tools"
  :author "Wojciech S. Gac"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (#:alexandria #:serapeum)
  :components ((:file "package")
               (:file "util")
               (:file "assembler")
               (:file "vm-translator")))
