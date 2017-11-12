#lang racket

(require math/number-theory)

(provide euler-3)

;; Problem 3
(define (euler-3)
  (car (reverse (prime-divisors 600851475143))))
