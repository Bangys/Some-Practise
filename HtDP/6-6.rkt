;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6-6) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))


;;数据分析和定义
(define-struct circle(point radius color))
;; circle是结构体(make-circle p r c)，其中p是posn结构体，r是数，color是符号





;;模板
;; fun-for-circle: circle -> ???
; (define (fun-for-circle circle)
;   (circle-point circle)
;   (circle-radius circle)
;   (circle-color circle)  )

;; draw-a-circle: circle -> boolean
;; 输入一个circle结构体，画在在画布上
(define (draw-a-circle circle)
  (draw-circle (circle-point circle) (circle-radius circle) (circle-color circle))
)



(start 300 300)
(draw-a-circle (make-circle (make-posn 100 100) 50 'blue))
