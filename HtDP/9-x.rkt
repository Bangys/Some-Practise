;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 7-4) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))




;; 9.1.3
;; data defination
;; list-of-3-numbers为：
;;   (cons x (cons y (cons z empty)))
; 其中x, y, z都是数

;; template:
; (define (tmp list-of-3-numbers)
;   (first list-of-3-numbers)
;   (first (rest list-of-3-numbers))
;   (first (rest (rest list-of-3-numbers)))
;   )

;; example:
;; (disctance-to-0-for-3 (cons 3 (cons 5 (cons 7 empty)))) -> ~9.11

;; distance-to-0-for-3: list-of-3-numbers -> number
;; usage: 在三维空间中计算某个点到原点的距离
(define (disctance-to-0-for-3 list-of-3-numbers)
  (sqrt (+ (sqr (first list-of-3-numbers))
           (sqr (first (rest list-of-3-numbers)))
           (sqr (first (rest (rest list-of-3-numbers))))
        )
  ))

;; test:
; ...




; 9.1.4
;; data defination
;; two-symbol-list为:
;;  (cons s1 (cons s2 empty))
;; 其中s1、s2都是符号

;; template
; ...

;; contains-2-doll?: two-symbol-list -> boolean
;; usage: 判断符号表中是否有'doll
(define (contains-2-doll? two-symbol-list)(
    cond
    [(symbol=? 'doll (first two-symbol-list)) true]
    [(symbol=? 'doll (first (rest two-symbol-list))) true]
    [else false]
    )
)
;; test:
; (not (contains-2-doll? (cons 'bay (cons 'nice empty))))
; (contains-2-doll? (cons 'bay (cons 'doll empty)))




;; 9.2.4
;; data defination
;; list-of-boolean为以下两者之一：
;;   1. empty
;;   2. (cons b lob), 其中b为布尔值，lob为list-of-boolean




;; 9.3.1
;; data defination
;; ...

;; template
;; ...

;; example:
;; (contains-doll? (cons 'dog (cons 'cat (cons 'doll)))) -> true
;; (contains-doll? (cons 'dog (cons 'cat (cons 'mouse)))) -> false

;; contains-doll?: list-of-smybol -> boolean
;; usage: 接收一个字符表，判断是否有'doll字符
(define (contains-doll? los)(
    cond
    [(empty? los) false]
    [(symbol=? 'doll (first los)) true]
    [else (contains-doll? (rest los))]
    ))

;; test:
; (contains-doll? (cons 'ball empty))
; (contains-doll? (cons 'arrow (cons 'doll empty)))
; (contains-doll? (cons 'bow (cons 'arrow (cons 'doll empty))))




;; 9.3.3
;; data defination
;; list-of-symbol(los)是以下之一：
;; 1. empty 空表 2.(cons s los) 其中s是符号，los是list-of-symbol


;; contains?: symbol los -> boolean
;; 输入一个符号和符号表，判断符号是否在表中
;; example:
;; (contains? 'dog (cons 'cat (cons 'dog empty))) -> True
(define (contains? symbol los)(
  cond
  [(empty? los) false]
  [else (or (symbol=? symbol (first los)) (contains? symbol (rest los)))]
  ))


 ; (contains? 'ball (cons 'ball empty))
 ; (contains? 'arrow (cons 'arrow (cons 'doll empty)))
 ; (contains? 'ball (cons 'bow (cons 'arrow (cons 'doll empty))))




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
; (start 400 400)
; (draw-circles (make-posn 100 100) (cons 10 (cons 20 (cons 30 (cons 40 (cons 50 empty))))))
