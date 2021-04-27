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
(newline)
(newline)


(display" Question  3 A")
(newline)
(newline)
(define (tree-filter pred lis)
  (cond ((null? lis) '())
        ((list? (car lis))(cons (tree-filter pred (car lis))(tree-filter pred (cdr lis))))
        ((pred (car lis)) (cons (car lis) (tree-filter pred (cdr lis))))
        (else (tree-filter pred (cdr lis)))))

(display"Test cases")
(newline)
(display"(tree-filter even? '(1 (2 3) ((4 5) (6 7)) (((8 (9))))))  Expected:((2) ((4) (6)) (((8 ()))))  Actual: ")(tree-filter even? '(1 (2 3) ((4 5) (6 7)) (((8 (9))))))
(display"(tree-filter odd? '(1 (2 3) ((4 5) (6 7)) (((8 (9))))))  Expected:(1 (3) ((5) (7)) ((((9))))) Actual: ")(tree-filter odd? '(1 (2 3) ((4 5) (6 7)) (((8 (9))))))

(display"(tree-filter odd? '(2 (2 3) ((4 2) (6 4)) (((8 (9)))))) Expected: ((3) (() ()) ((((9))))) Actual: ")(tree-filter odd? '(2 (2 3) ((4 2) (6 4)) (((8 (9))))))
(newline)
(newline)

(display "Question 3 B")
        
(define(height L)
  (if (or (null? L) (not (pair? L)) ) 0
      (max (+ 1 (height (car L))) (height (cdr L)))))

(newline)
(display"Test cases")
(newline)
(display"(height 'a) Expected: 0 Actual")(height 'a)
(display"(height '(a)) Expected : 1 Actual: ")(height '(a))
(display"(height '(a (b) c)) Expected: 2 Actual: ") (height '(a (b) c))
(display "(height '(((((a(((b))))))))) Expected 8 Actual:")(height '(((((a(((b)))))))))

(newline)
(newline)
(newline)
(display"Question 3 c Write a function flattenTree that takes a tree as an argument and returns a list of the leaf values of the tree.  " )
(newline)
(define (flattentree L)
  (cond ((null? L) '())
        ((pair? L)(append (flattentree (car L)) (flattentree (cdr L))))
        (else(list L))))
(newline)
(newline)
(display "test cases")
(newline)
(display"(flattenTree '(1 (2 3) ((4 5 6 (7)))(((8 (9)))))) Expected:(1 2 3 4 5 6 7 8 9) Actual: ")(flattenTree '(1 (2 3) ((4 5 6 (7)))(((8 (9))))))
(display"(flattenTree '(1 (2(4 3 4 (33)) 3) ((4 5 6 (7)))(((8 (9)))))) Expected:(1 2 4 3 4 33 3 4 5 6 7 8 9) Actual: ")(flattenTree '(1 (2(4 3 4 (33)) 3) ((4 5 6 (7)))(((8 (9))))))
(display"(flattenTree '(1 (2(4 3 4 (33))(3)((3)) 3)  Expected:(1 2 4 3 4 33 3 3 3)  Actual: ")(flattenTree '(1 (2(4 3 4 (33))(3)((3)) 3)))