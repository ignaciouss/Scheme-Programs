(define (expand lis i)
  (define (expand-it list  n )
    (cond (((null? lis) '())
           (< n i) (cons  (car lis) (expand-it (cdr list) i))
           (else (cons  (car lis) (expand-it (cdr list) (- n 1))))))
    )
  (expand-it lis i)
  
  )