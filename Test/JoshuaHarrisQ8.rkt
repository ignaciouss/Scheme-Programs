;Ranks nots in listsmand odified 
(define (filter predicate sequence i)
    (cond ((null? sequence) '())
          ((even? i)( (if (predicate (car sequence)) 
		       (cons (car sequence) 
                     (filter predicate (cdr sequence) (+ i 1))))))
          (else (filter predicate (cdr sequence)))))