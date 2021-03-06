#|
  Author: joshua Harris
  Student #: 101091864
  ============================================================
  |                      Assigment#3                         |
  ============================================================
|#
(newline)
(newline)
(display "            Author: Joshua Harris                  Student #: 101091864")
(newline)
(display "            ============================================================")
(newline)
(display "            |                      Assigment#3                          |")
(newline)
(display "            ============================================================")
(newline)

; Code taken from claass notes to assist in questions

(define-syntax stream-cons
    (syntax-rules ()
        ((stream-cons a b)(cons a (delay b)))))

(define (stream-car stream) 
    (car stream))
		
(define (stream-cdr stream)
    (force (cdr stream)))

(define (stream-ref n stream)
    (if (= n 0)
        (stream-car stream)
        (stream-ref (- n 1) (stream-cdr stream))))

(define (stream-range low high)
    (if (> low high)
        the-empty-stream
        (stream-cons low (stream-range (+ low 1) high))))

(define (stream-filter predicate stream)
    (cond ((null? stream) '())
          ((predicate (stream-car stream))
              (stream-cons (stream-car stream)
                           (stream-filter predicate 
                                          (stream-cdr stream))))
          (else (stream-filter predicate (stream-cdr stream)))))

(define (integers-starting-from n)
    (stream-cons n (integers-starting-from (+ n 1))))
		
(define integers (integers-starting-from 1))


; Q4 a
(display"QUESTION 4 a")

(define (list->stream lis)
  (cond ((null? lis) '())
      (else (stream-cons (car lis) (list->stream (cdr lis))))))

(newline)
(display "TEst Cases")
(newline)
(newline)
(display "(list->stream '(2 3 4 5 2 4 5)) Epected :(2 . #<promise>)  Actual: )")(list->stream '(2 3 4 5 2 4 5))
(newline)
(display "(list->stream '(6 3 4 5 2 4 5)) Epected :(6 . #<promise>)  Actual: )")(list->stream '(6 3 4 5 2 4 5))
(newline)
(display "(list->stream '(9 3 4 5 2 4 5)) Epected :(9 . #<promise>)  Actual: )")(list->stream '(9 3 4 5 2 4 5))
(newline)
(display "")
(newline)

;Q 4 b
(newline)
(display "Qustion 4b")
(newline)
(newline)

(define (stream->list strm n)
  (define (stem-it st k count)
    (cond ((or (null? st) (= k count)) '())
           (else (cons (stream-car st)(stem-it (stream-cdr st) k (+ count 1))))))
  (stem-it strm n 0))

(display "(stream->list (stream-range 1 7) 4)  Expected: (1 2 3 4) Actual: ")(stream->list (stream-range 1 7) 4)
(newline)
(display "(stream->list (stream-range 1 7) 6)  Expected: (1 2 3 4 5 6) Actual: ")(stream->list (stream-range 1 7) 6)
(newline)
(display "(stream->list (stream-range 1 7) 0)  Expected: () Actual: ")(stream->list (stream-range 1 7) 0)
(newline)
(display "")
(newline)
(newline)

; Question 4c

(display" Question 4 c")
(newline)
(newline)
(display"code")
(newline)
(display"(define odds")
(display "  (stream-filter odd? integers))")

(define odds 
  (stream-filter odd? integers))

(display " Test case")
(newline)
(display "(stream->list odds 10) Expected:(1 3 5 7 9 11 13 15 17 19)  Actual: ")(stream->list odds 10)
(display "(stream->list odds 1) Expected:(1)  Actual: ")(stream->list odds 1)
(display "(stream->list odds 0) Expected:()  Actual: ")(stream->list odds 0)
(newline)
(newline)

;Question 4d
(display"Question 4d")
(newline)

(define (repeated x)
  (define (rep-it y)(stream-cons x (rep-it (+ y 1))))
  (rep-it 1))

(display"Test Case")
(newline)
(display"(stream->list (repeated 'hey) 4) Expected:(hey hey hey hey) Actual: ")(stream->list (repeated 'hey) 4)
(display"(stream->list (repeated 101) 5) Expected:(101 101 101 101 101) Actual: ")(stream->list (repeated 101) 5)
(newline)
(newline)

;Question 4e

(display"Question 4e")
(newline)

(define (stream-until strm pred)
  (define (until-it stm count)
    (cond ((null? stm) -1)
          ((pred (stream-car stm)) count)
          (else (until-it (stream-cdr stm) (+ count 1)))))
  (until-it strm 0))

(display" Test cases")
(newline)
(display "(stream-until integers (lambda(x)(>= x 15))) Expected:14  Actual: ")(stream-until integers (lambda(x)(>= x 15)))
(newline)
(display "(stream-until (repeated 7) (lambda(x)(> x 6))) Expeted:0  Actual: ")(stream-until (repeated 7) (lambda(x)(> x 6)))
(newline)
(display "(stream-until integers (lambda(x)(> x 6))) Expected: 6 Actual: ")(stream-until integers (lambda(x)(> x 6)))
(newline)
(display "")
(newline)
(newline)

;Question 4 e
(display"Question 4 e")
(newline)
(newline)

(define (loan amnt rate payment)
  (cond ((< amnt 0)(stream-cons 0 '()))
        (else (stream-cons amnt (loan (+ (* amnt rate) (- amnt payment)) rate payment)))))

(display"Testcases")

(display "(stream->list (loan 10000 0.025 500) 5) Expected:(10000 9750.0 9493.75 9231.09375 8961.87109375)  Actual: ")(stream->list (loan 10000 0.025 500) 5)
(display"(stream->list (loan 20 0.003 10) 5) Expected:(20 10.06 0.09 0) Actual: ")(stream->list (loan 20 0.003 10) 5)
(display"(stream->list (loan 20 0.23 10) 5) Expected:(20 14.60 7.96 0)) Actual: ")(stream->list (loan 20 0.23 10) 5)
(newline)
(newline)
;Question 4 g
(display"Questoin 4 g")
(newline)
(define (loan-m amnt rate payment)
  (define (loan-it am r p months)
    (cond ((< am 0) months)
          (else (loan-it (+ (* am r) (- am p)) r p (+ months 1)))))
  (loan-it amnt rate payment 0)
  )
(display"Answer:(loan-m 250000 0.15 2000)   ")(loan-m 250000 0.15 2000)
  
