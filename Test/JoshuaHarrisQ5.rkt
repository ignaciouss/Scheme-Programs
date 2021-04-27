(define (bits n)
     (if (<= n 1)
           1
           (+ 1 (bits (quotient n 2)))))

(define (bit n)
  (define (bit-it num b)
    (if (<= b 1) num
        (bit-it (+ num 1) (quotient b 2)))
    )
  (bit-it 1 n))

(bits 294701374)
(bit 294701374)
