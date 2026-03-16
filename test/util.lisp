(in-package #:nand2tetris.test.util)

(5am:def-suite nand2tetris-util
  :description "Unit tests for Nand2Tetris utilities")

(5am:in-suite nand2tetris-util)

(5am:test bs->bv
  "Test conversion from bit strings to BIT-VECTORs"
  (5am:is (equal (bs->bv "0000") #*0000))
  (5am:is (equal (bs->bv "1111") #*1111))
  (5am:is (equal (bs->bv "0101") #*0101))
  (5am:is (equal (bs->bv "") #*))
  (5am:signals simple-error (bs->bv "1234")))

(5am:test bv->bs
  "Test conversion from BIT-VECTORs to bit strings"
  (5am:is (equal (bv->bs #*0000) "0000"))
  (5am:is (equal (bv->bs #*1111) "1111"))
  (5am:is (equal (bv->bs #*0101) "0101"))
  (5am:is (equal (bv->bs #*) "")))

(5am:test bv-concat
  "Test BIT-VECTOR concatenation"
  (5am:is (equal (bv-concat) #*))
  (5am:is (equal (bv-concat #*0000) #*0000))
  (5am:is (equal (bv-concat #*0000 #*1111) #*00001111))
  (5am:is (equal (bv-concat #*0000 #*1111 #*1010) #*000011111010)))
