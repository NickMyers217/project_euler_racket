#lang racket

(provide euler-2)

;; Problem 2
(define (euler-2)
  ; A stream of fibonacci numbers
  (define (fibs)
    (define (f cur prev)
      (stream* cur (f (+ prev cur) cur)))
    (f 1 1))

  ; An implementation of foldl for streams that accepts a predicate
  (define (fold-while predicate proc acc a-stream )
    (let ([head (stream-first a-stream)]
          [tail (stream-rest a-stream)])
      (if (predicate acc head)
          (fold-while predicate proc (proc acc head) tail)
          acc)))

  ; fold the fibs adding evens to the sum until we get over 4000000
  (define (f)
    (fold-while (λ (acc val) (<= val 4000000))
                (λ (acc val) (if (even? val) (+ acc val) acc))
                0
                (fibs)))
  (f))
