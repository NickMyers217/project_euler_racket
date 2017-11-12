#lang racket

(provide euler-4)


(define (euler-4)
  ; Determine if a number is a palindrome
  (define (palindrome? n)
    (let ([str (number->string n)])
      (equal? str
       (list->string (reverse (string->list str))))))

  ; Get the largest possible number of n digits
  (define (largest-n-digit-num n)
    (- (expt 10 n) 1))

  ; Determine if a number is divisible by any number in the given range
  (define (divisor-in-range? low hi n)
    (define (f divisor)
      (cond [(< divisor low) #f]
            [(= (modulo n divisor) 0) divisor]
            [else (f (- divisor 1))]))
    (f (- hi 1)))

  ; Test every number decreasing from the largest product
  (define (f n)
      (if (and (palindrome? n)
               (let ([d (divisor-in-range? 100 1000 n)])
                 (and (number? d)
                      (= (string-length (number->string (/ n d))) 3))))
          n
          (f (- n 1))))

  (f (expt (largest-n-digit-num 3) 2)))
