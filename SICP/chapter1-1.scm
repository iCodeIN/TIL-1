#lang planet neil/sicp

;1.1

10
;10

(+ 5 3 4)
;12

(- 9 1)
;8

(/ 6 2)
;3

(+ (* 2 4) (- 4 6))
;6

(define a 3)
;a=3

(define b (+ a 1))
;b=4

(+ a b (* a b))
;19

(= a b)
;false

(if (and (> b a) (< b (* a b)))
    b
    a)
;4

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
;16

(+ 2 (if (> b a) b a))
;6

(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))
;16

;--------------------------
;1.2

(/ (+ 5 4
      (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))
;-(37/150)

;--------------------------
;1.3

(define (twoselect x y z)
  (cond ((and (< x y) (< x z))
             (+ (* y y) (* z z)))
        ((and (< y x) (< y z))
             (+ (* x x) (* z z)))
        ((and (< z x) (< z y))
             (+ (* x x) (* y y)))))

(twoselect 1 2 3)
;13

(twoselect 5 3 7)
;74

;--------------------------
;1.4

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
(a-plus-abs-b 3 7)
;b > 0 -> a+b, b < 0 -> a-b

;--------------------------
;1.5

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

;execute failed

#lang planet neil/sicp

(define (square x)
  (* x x))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

;----------------------------
;1.6
;new-if로 바꾸게 되면 stack에 sqrt-iter가 계속 쌓이게 되고, 무한루프 발생
(sqrt 9)

;----------------------------
;1.7
;(sqrt 0.00002)
;아주 큰 수를 구하려고 시도하면 나중에 가서 guess와 x의 차이가 유효숫자의 자리수 범위를 넘어서게 되어 무한재귀 발생
;아주 작은 수는 0.001보다 작아서 계산을 못함


(define (sqrt2 x)
  (sqrt-iter2 1.0 0.0 x))

(define (sqrt-iter2 guess prev-guess x)
  (if (good-enough2? guess prev-guess)
      guess
      (sqrt-iter2 (improve guess x)
                  guess
                 x)))

(define (good-enough2? guess prev-guess)
  (< (/ (abs (- guess prev-guess)) guess) 0.001))

(sqrt2 0.00000002)
(sqrt2 1e13)

;----------------------------
;1.7
;(sqrt 0.00002)

(define (cuberoot x)
  (cuberoot-iter 1.0 0.0 x))

(define (cuberoot-iter guess prev-guess x)
  (if (good-enough2? guess prev-guess)
      guess
      (cuberoot-iter (improve-cube guess x)
                     guess
                     x)))

(define (improve-cube guess x)
  (/ (+ (/ x (square guess))
        (* 2 guess))
        3))

(cuberoot 64)