#lang racket

(provide euler-1)

;; Problem 1
(define (euler-1)
  (define (f sum x)
    (cond [(>= x 1000) sum]
          [(or (zero? (modulo x 3))
               (zero? (modulo x 5)))
           (f (+ sum x) (+ x 1))]
          [else (f sum (+ x 1))]))
  (f 0 1))
