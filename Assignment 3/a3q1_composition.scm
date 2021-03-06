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
(newline)
(display " Question 1 a")
(newline)
(display"Define a function (compose f g) that returns a composed function f ∘ g, such that the following usage works as shown. ")
(newline)
(display"    (define square (lambda(x)(* x x)))")
(newline)
(display"    (define double (lambda(x)(+ x x)))")
(newline)
(display"    ((compose square double) 3) -> 6^2 = 36")
(newline)
(newline)
(display "CODE")
(define (compose f g)
  (lambda (x)(f(g x))))

(display "(define (compose f g)")
(newline)
(display "  (lambda (x)(f(g x))))")
(newline)
(newline)
(display "Test case")
(newline)
(display "(define square (lambda(x)(* x x)))")
(newline)
(display "(define double (lambda(x)(+ x x)))")
(newline)
(display"((compose square double) 3)  Expected: 36 Actual: ")

(define square (lambda(x)(* x x)))
(define double (lambda(x)(+ x x)))
((compose square double) 3)

(display"((compose square double) 6)  Expected: 144 Actual: ")
((compose square double) 6)


(newline)
(newline)
(newline)


;QUESTION 1 B
(display "QUESTION 1 B")(newline)
(display " Define a function (endswith x) that takes an integer argument in the range [0,9] and returns a predicate function. The returned predicate should accept an integer y ")
(display"and return true if the last digit in y matches the given digit x.")

(display "CODE")
(newline)
(display"(define (endsWith x )")
(newline)
(display"  (if (and (< x 10)(>= x 0) )(lambda (y) (= x (modulo y 10)))")
(newline)
(display"      (lambda (y) (begin")
(newline)
(display"                    (display x)(display ' Was an invalid input')) )))")
(newline)


(define (endsWith x )
  (if (and (< x 10)(>= x 0) )(lambda (y) (= x (modulo y 10)))
      (lambda (y) (begin
                    (display x)(display " Was an invalid input")) )
  )
  )

; TEST
(display "TEST")
(newline)
(newline)
(display "((endsWith 0) 17)    Expected : #f   Actual:")((endsWith 0) 17)
(display "((endsWith 3) 1213)    Expected : #t   Actual:")((endsWith 3) 1213)
(display "((endsWith 1) 1)    Expected : #t   Actual:")((endsWith 1) 1)
(display "((endsWith 12) 1)    Expected :12 Was an invalid input   Actual:")((endsWith 12) 1)
        
;QUESTION 1 C



(display"Question 1c")
(newline)

(display"CODE")
(newline)
(newline)
(display"(define (newmap func)")
(newline)
(display " (lambda (lis)")
(newline)
(display "   (define (map-it L) ")
(newline)
(display "     (if (null? l)")
(newline)
(display "         '()")
(newline)
(display "        (cons (func (car L)) (map-it (cdr L)))))")
(newline)
(display "      (map-it lis)))")
(newline)
(display " (define double-mapper (newmap (lambda(x)(* x 2))))")
(newline)
(newline)
(newline)

(define (newmap func)
  (lambda (lis)
    (define (map-it L)
      (if (null? l)
          '()
          (cons (func (car L)) (map-it (cdr L)))))
    (map-it lis)))

(define double-mapper (newmap (lambda(x)(* x 2))))


(newline)
(display " Test Cases")
(newline)
(display " (double-mapper '(1 2 3 4)): Expected: (2 4 6 8) Actual: ")
(double-mapper '(1 2 3 4))
(display " (doublemapper '(10 20 30 40)): Expected: (20 40 60 80) Actual: ")
(double-mapper '(10 20 30))
(display " (double-mapper '(1000 2000 3000 4000)): Expected: (2000 4000 6000 8000) Actual: ")
(double-mapper '(1000 2000 3000 4000))

; QUESTION 1 D ( needs modification)
(newline)
(display "Question 1 d")
(newline)
(display "Code")
(newline)

(display "(define (newfilter keep? f)")
(newline)
(display "  (lambda (list)")
(newline)
(display "    (define (filter-it k L)")
(newline)
(display "      (cond ((null? L)'())")
(newline)
(display "            (k (if (f (car L))(cons (car L) (filter-it k (cdr L)))(filter-it k (cdr L)) )   )")
(newline)
(display "            ((not k) (if (not( f (car L)))(cons (car L) (filter-it k (cdr L))) (filter-it k (cdr L))))")
(newline)
(display "          (else  (filter-it k (cdr L)))))")
(newline)
(display "    (filter-it keep? list)))")
(newline)
(display "(define bigNums   (newfilter #t (lambda(x)(> x 25))))")
(newline)
(display "(define smallNums (newfilter #f (lambda(x)(> x 25))))")
(newline)
(display "(define odds (newfilter #f (lambda(x) (even? x))))")
(newline)
(display "(define evens (newfilter #t (lambda(x) (even? x))))")

(define (newfilter keep? f)
  (lambda (list)
    (define (filter-it k L)
      (cond ((null? L)'())
            (k (if (f (car L))(cons (car L) (filter-it k (cdr L)))(filter-it k (cdr L)) )   )
            ((not k) (if (not( f (car L)))(cons (car L) (filter-it k (cdr L))) (filter-it k (cdr L))))
          (else  (filter-it k (cdr L)))))
    (filter-it keep? list)))

(define bigNums   (newfilter #t (lambda(x)(> x 25))))
(define smallNums (newfilter #f (lambda(x)(> x 25))))
(define odds (newfilter #f (lambda(x) (even? x))))
(define evens (newfilter #t (lambda(x) (even? x))))

;TESTS
(display "(bigNums '(10 20 30 40 50)) Expected:(30 40 50) Actual: ")(bigNums '(10 20 30 40 50))
(newline)
(display "(smallNums '(10 20 30 40 50)) Expected:(10 20)  Actual: ")(smallNums '(10 20 30 40 50))
(newline)
(display "(odds '(1 2 3 4 5 6 7 8 9))   Expected : (1 3 5 7 9) Actual: ")(odds '(1 2 3 4 5 6 7 8 9))
(newline)
(display "(evens '(1 2 3 4 5 6 7 8 9))  Expected: (2 4 6 8) Actual: ")(evens '(1 2 3 4 5 6 7 8 9))
(newline)



  


(display "Question 1 e")
(newline)
(display "Range func taken from notes")
(newline)

(define (range a b); From notes
    (if (= a  (- b 2)) (list a)
        (cons a (range (+ a 1) b))))
 (define myfunc (newmap (lambda(x)(* (+ x 1)3)) ))

(display "Code :    (define myfunc (newmap (lambda(x)(* (+ x 1)3)) ))")
(newline)
(display "Test:")
(newline)
(display"(myfunc (range 0 10) Expected: (3 6 9 12 15 18 21 24 27)  Actual: ")(myfunc (range 0 10))
(display"(myfunc (range 0 10) Expected: (3 6 9 12 15 18 21 24 27 30 33 36 39 42 45 48 51 54 57)  Actual: ")(myfunc (range 0 20))




(display "")
(newline)
(display "")
(newline)
(display "")
(newline)
(display "")
(newline)
(display "")
(newline)
(display "")