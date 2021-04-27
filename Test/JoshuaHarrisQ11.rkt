; Q 11
(define (square x)
  (* x x))

(define (infinite)
  (define (infinite-it strm i)
    (stream-cons (expt (square i)i) (infinite-it strm  (+ i 1)))
  )
 )
