#lang racket

(provide euler-5)

(define (euler-5)
  ; see if test-n is divisble by all numbers n and below
  (define (divisible-by-all-nums-below? n test-n)
    (cond [(zero? n) #t]
          [(zero? (modulo test-n n))
           (divisible-by-all-nums-below? (- n 1) test-n)]
          [else #f]))

  ; test all multiple of the highest n until we find the one that passes
  (define (f n)
    (cond [(divisible-by-all-nums-below? 20 n)
           n]
          [else (f (+ n 20))]))

  (f 20))
