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




;; 9.5.2
;; data defination
;; list-of-symbol是以下之一：
;; 1.empty 2.(cons s los) 其中s是符号，los是list-of-symbol

;; template:
; (define (f los)(
;     cond
;     [(empty? los)...]
;     [(cons? los)...
;     (first los)...
;     (f(rest los))...]
;     ))


;; example:
;; (how-many-symbols (cons 'a empty)) -> 1
;; (how-many-symbols empty) -> 0
;; (how-many-symbols (cons 'a (cons 'b (cons 'c (cons 'd empty))))) -> 4

;; how-many-symbols: los =-> number
;; usage: 读入一个符号表，返回表中元素的数目
(define (how-many-symbols los)(
    cond
    [(empty? los) 0]
    [else (+ 1 (how-many-symbols (rest los)))]
    ))


; (how-many-symbols (cons 'a (cons 'b (cons 'c (cons 'd empty)))))
; (how-many-symbols (cons 'a empty))
; (how-many-symbols empty)



;; 9.5.3
;; data defination
;; list-of-item为以下之一：
;; 1. empty 2.cons(i loi) 其中i为数字 loi为list-of-item

;; template:
; (define (f loi number)(
;     cond
;     [(empty? loi)...]
;     [else (< (first loi) number)...
;           (f (rest loi))...]
;     ))

;; example:
; (dollar-store? empty 1) -> true
; (dollar-store? (cons 0.1 (cons 0.5 (cons 1.1 (cons 1.5 (cons 1.9 empty ))))) 1) -> false
; (dollar-store? (cons 0.1 (cons 0.5 (cons 1.1 (cons 1.5 (cons 1.9 empty ))))) 2) -> true

;; dollar-store?: loi number -> boolean
;; usage: 读入一个物价表loi、number为限价，如果所有价格都小于限价则返回true
(define (dollar-store? loi number)(
    cond
    [(empty? loi) true]
    [else (and (< (first loi) number) (dollar-store? (rest loi) number))]
    ))

; (dollar-store? empty 1)
; (dollar-store? (cons 0.1 (cons 0.5 (cons 1.1 (cons 1.5 (cons 1.9 empty ))))) 1)
; (dollar-store? (cons 0.1 (cons 0.5 (cons 1.1 (cons 1.5 (cons 1.9 empty ))))) 2)




;; 9.5.4
;; data defination
;; list of temperature为以下之一：
;; 1. empty 2. (cons t lot) 其中t为数字 lot为list-of-temperature
;;
;; range-t为结构体(make-range-t min max)其中min、max为数字
(define-struct range-t (min max))

;; template:
; (define (f lot range)(
;     cond
;     [(empty? lot)...]
;     [else (and (and (> (first lot) (first range)) (< (first lot) (first (rest range)))) (f (rest lot range) range...))]
;     ))

;; example:
; (check-range-t empty (make-range-t 0 100)) -> true
; (check-range-t (cons 10 (cons 20 (cons 30 (cons 50 (cons 80 (cons 90 empty)))))) (make-range-t 0 100)) -> true
; (check-range-t (cons 30 (cons 50 (cons 110 (cons 140 empty)))) (make-range-t 0 100)) -> false


;; check-range: lot range -> boolean
;; usage: 读入一个温度值的表、温度区间，如果所有温度都在区间内则返回true
(define (check-range-t lot range)(
    cond
    [(empty? lot) true]
    [else (and (and (> (first lot) (range-t-min range)) (< (first lot)  (range-t-max range))) (check-range-t (rest lot) range))]
    ))

; (check-range-t empty (make-range-t 0 100))
; (check-range-t (cons 10 (cons 20 (cons 30 (cons 50 (cons 80 (cons 90 empty)))))) (make-range-t 0 100))
; (check-range-t (cons 30 (cons 50 (cons 110 (cons 140 empty)))) (make-range-t 0 100))




;; 9.5.5
;; data defination
;; list-of-numbers为以下之一：
;; 1. empty 2.(cons n lon)其中n是数字 lon为list-of-numbers


;; template:
; (define (f lon)(
;     cond
;     [(empty? lon)...]
;     [else (first lon)...
;           (f(rest lon))...]
;     ))

;; example:
;; (convert empty) -> 0
;; (convert (cons 1 (cons 2 (cons 3 (cons 4 empty))))) -> 4321

;; convert: lon number=0 -> number
;; usage: 输入一个数表和下标，返回对应的数，表中的第一个数为最低位，以此类推
(define (convert lon no)(
    cond
    [(empty? lon) 0]
    [else (+ (* (expt 10 no)(first lon)) (convert (rest lon) (+ no 1)))]
    ))

; (convert empty 0)
; (convert (cons 1 (cons 2 (cons 3 (cons 4 empty)))) 0)




;; 9.5.6
;; data defination
;; list-of-number为以下之一：
;; 1. empty 2.(cons n lon) 其中n是数字 lon为list-of-number

;; template:
; (define (f lon1 lon2)(
;     cond
;     [(empty? lon1)...]
;     [else (cons (- (first lon1) (first lon2)) (f (rest lon1) (rest lon2))]
;     ))

;; example:
; (delta empty empty) -> '()
; (delta (cons 100 (cons 80 (cons 50 (cons 30 (cons 10 empty))))) (cons 10 (cons 20 (cons 30 (cons 40 (cons 50 empty))))))
;   -> (cons 90 (cons 60 (cons 20 (cons -10 (cons -40 '())))))
; (delta (cons 1 (cons 2 (cons 3 empty))) (cons 1 (cons 1 (cons 1 empty))))
;  -> (cons 0 (cons 1 (cons 2 '())))

;; delta: lon lon -> number
;; usage: 输入长度相同的两个数表，计算出两个表之间的差值
(define (delta lon1 lon2)(
    cond
    [(empty? lon1) empty]
    [else (cons (- (first lon1) (first lon2)) (delta (rest lon1) (rest lon2)))]
    ))

; (delta empty empty)
; (delta (cons 100 (cons 80 (cons 50 (cons 30 (cons 10 empty))))) (cons 10 (cons 20 (cons 30 (cons 40 (cons 50 empty))))))
; (delta (cons 1 (cons 2 (cons 3 empty))) (cons 1 (cons 1 (cons 1 empty))))




;; 9.5.7
;; import
;; usage: 计算表中数的个数
(define (how-many-numbers lon)(
    cond
    [(empty? lon) 0]
    [else (+ 1 (how-many-numbers (rest lon)))]
    ))

;; usage: 计算表中数的总和
(define (sum-numbers-list lon)(
    cond
    [(empty? lon) 0]
    [else (+ (first lon) (sum-numbers-list (rest lon)))]
    ))

;; data defination
;; list-of-price为以下之一：
;; 1. empty 2. (cons p lop) 其中p是数字 lop是自引用

;; template:
; (define (f lop)(
;     cond
;     [(empty? lop)...]
;     [(first lop)...
;     (rest lop)...]
;     ))

;; example:
; (average-price empty) -> 0
; (average-price (cons 100 (cons 200 (cons 300 empty)))) -> 200

;; average-price: lop -> number
;; usage: 输入一个价格表，返回平均价格(总价格/总数量)
(define (average-price lop)(
    cond
    [(empty? lop) 0]
    [else (/ (sum-numbers-list lop) (how-many-numbers lop))]
    ))

; (average-price empty)
; (average-price (cons 100 (cons 200 (cons 300 empty))))




;; 9.5.8
;; circle是结构体(make-circle p r c):
;;   其中p是posn结构体，r是数，c是符号
(define-struct circle(point radius color))

;; numbers-list是以下之一：
;; 1.empty 2.(cons n nl) 其中n是数字 nl为自引用

;; template:
; (define (f posn nl)(
;     cond
;     [(empty? nl)...]
;     [(make-posn x y)...
;      (posn-x)...
;      (posn-y)...
;      (first nl)...
;      (f(rest nl))...
;      (draw-circle posn nl)...]
;     ))

;; example:
;; (draw-circles (make-posn 100 100) (cons 10 (cons 20 (cons 30 (cons 40 (cons 50 empty)))))) -> 在画布上画出嵌套圆 最后返回true true

;;draw-circles: posn numbers-list -> boolean
;; 输入posn坐标和数表，在画布上画出以数表中的数为半径的圆，成功返回true
(define (draw-circles posn numbers-list)
  (cond
      [(empty? numbers-list) true]
      [else (and (draw-circle posn (first numbers-list) 'red) (draw-circles posn (rest numbers-list)))]
  )
)

; (start 400 400)
; (draw-circles (make-posn 100 100) (cons 10 (cons 20 (cons 30 (cons 40 (cons 50 empty))))))
