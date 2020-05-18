;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 7-4) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))

;; data defination
;; list-of-3-numbers为包含3个数的表：
;; (cons x (cons y (cons z empty))),其中xyz都是数




;; template:
; (define (add-up-3 list-of-3-numbers)
;   (first list-of-3-numbers)
;   (first (rest list-of-3-numbers)
;;  (first (rest (rest list-of-3-numbers))))

;;example:
; (add-up-3 (cons 3 (cons 5 (cons 7 empty)))) -> 15

;; add-up-3: list-of-3-numbers -> number
;; sum of list of 3 numbers
(define (add-up-3 list-of-3-numbers)
  (+
  (first list-of-3-numbers)
  (first (rest list-of-3-numbers))
  (first (rest (rest list-of-3-numbers)))
  ))

; (add-up-3 (cons 3 (cons 5 (cons 7 empty))))


;; example:
;; (disctance-to-0-for-3 (cons 3 (cons 5 (cons 7 empty)))) -> ~9.11
;; distance-to-0-for-3: list-of-3-numbers -> number
;; 在三维空间中计算原点到某点的距离
(define (disctance-to-0-for-3 list-of-3-numbers)
  (sqrt (+ (sqr (first list-of-3-numbers))
           (sqr (first (rest list-of-3-numbers)))
           (sqr (first (rest (rest list-of-3-numbers))))
        )
  ))

; (disctance-to-0-for-3 (cons 3 (cons 5 (cons 7 empty))))




;; 9.3.3
;; data defination
;; list-of-symbol(los)是以下之一：
;; 1. empty 空表 2.(cons s los) 其中s是符号，los是list-of-symbol


;; contains?: symbol los -> boolean
;; 输入一个符号和符号表，判断符号是否在表中
;; example:
;; (contains? 'dog (cons 'cat (cons 'dog empty))) -> True
; (define (contains? symbol los)
;   ())



;; 9.5.8
;; circle是结构体(make-circle p r c)，其中p是posn结构体，r是数，c是符号
(define-struct circle(point radius color))

;; numbers-list是以下之一：
;; 1.empty 2.(cons n number-list) 其中n是数字


;;draw-circles: posn numbers-list -> boolean
;; 输入posn结构体和数表，在画布上画出以数表中的数为半径的圆，成功返回true
(define (draw-circles posn numbers-list)
  (cond
      [(empty? numbers-list) false]
      [else (and (draw-circle posn (first numbers-list) 'red) (draw-circles posn (rest numbers-list)))]
  )
)
(start 400 400)
(draw-circles (make-posn 100 100) (cons 10 (cons 20 (cons 30 (cons 40 (cons 50 empty))))))
