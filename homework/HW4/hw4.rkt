#lang racket

(provide (all-defined-out)) ;; so we can put tests in a second file

;; put your code below

;; Q1
(define (sequence low high stride)
  (if (> low high)
      null
      (cons low (sequence (+ low stride) high stride))))

;; Q2
(define (string-append-map xs suffix)
  (map (lambda (x) (string-append x suffix)) xs))


;; Q3
(define (list-nth-mod xs n)
  (cond [(negative? n) (error "list-nth-mod: negative number")]
        [(null? xs) (error "list-nth-mod: empty list")]
        [#t (car (list-tail xs (remainder n (length xs))))]))

;; Q4
(define (stream-for-n-steps s n)
  (letrec ([helper (lambda (s n acc)
                     (if (zero? n)
                         (reverse acc)
                         (helper (cdr (s)) (- n 1) (cons (car (s)) acc))))])
    (helper s n null)))

;; Q5
(define (funny-number-stream)
  (letrec ([helper (lambda (x) (cons (if (zero? (remainder x 5))
                                         (- 0 x)
                                         x)
                                     (lambda () (helper (+ x 1)))))])
    (helper 1)))

;; Q6
(define (dan-then-dog)
  (letrec ([helper (lambda (x)
                     (cons (if x "dan.jpg" "dog.jpg")
                           (lambda () (helper (not x)))))])
    (helper #t)))

;; Q7
(define (stream-add-zero s)
  (letrec ([helper (lambda (s)
                     (cons (cons 0 (car (s)))
                           (lambda () (helper (cdr (s))))))])
    (lambda () (helper s))))

;; Q8
(define (cycle-lists xs ys)
  (letrec ([helper (lambda (xs ys accx accy)
                     (cons (cons (list-nth-mod xs accx) (list-nth-mod ys accy))
                           (lambda () (helper xs ys (+ 1 accx) (+ 1 accy)))))])
    (lambda () (helper xs ys 0 0))))

;; Q9
(define (vector-assoc v vec)
  (letrec ([len (vector-length vec)]
           [helper (lambda (v vec pos)
                     (cond [(= pos len) #f]
                           [(not (pair? (vector-ref vec pos))) (helper v vec (+ 1 pos))]
                           [(equal? (car (vector-ref vec pos)) v) (vector-ref vec pos)]
                           [#t (helper v vec (+ 1 pos))]))])
    (helper v vec 0)))

;; Q10
(define (cached-assoc xs n)
  (letrec ([memo (make-vector n #f)]
           [pos-in-memo 0]
           [helper (lambda (v)
                     (let ([cache-result (vector-assoc v memo)])
                       (if (not cache-result)
                           (let ([result (vector-assoc v xs)])
                             (if (not result)
                                 #f
                                 (begin
                                   (vector-set! memo pos-in-memo result)
                                   (set! pos-in-memo (if (= n (+ 1 pos-in-memo))
                                                         0
                                                         (+ 1 pos-in-memo)))
                                   result)))
                           cache-result)))])
    helper))

;; testing
;; (define a (make-vector 2))
;; (vector-set! a 0 (cons 5 2))
;; (vector-set! a 1 (cons 4 1))
;; (define fun (cached-assoc a 1))
;; (fun 4)

                                 
  


  
    
  
                         
                         
                         
                         
      
