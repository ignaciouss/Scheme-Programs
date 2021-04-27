(define struct
  (cons (cons (cons 4 (cons 2 3))(cons 7 (cons 6 5)) ) 1))
struct
(car (cdr (car (car struct))))
