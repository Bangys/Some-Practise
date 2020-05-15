;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6-6) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))


;;数据分析和定义
;; circle是结构体(make-circle p r c)，其中p是posn结构体，r是数，c是符号
(define-struct circle(point radius color))
;;template:
;; fun-for-circle: circle -> ???
; (define (fun-for-circle circle)
;   (circle-point circle)
;   (circle-radius circle)
;   (circle-color circle)  )




;; rectangle是结构体(make-rectangle p w h c)，其中p是posn结构体，w和h是数，c是符号
(define-struct rectangle(point width height color))
;;template:
;; fun-for-rect: rectangle -> ???
; (define (fun-for-rect rectangle)
;   (rectangle-point rectangle)
;   (rectangle-width rectangle)
;   (rectangle-height rectangle)
;   (rectangle-color rectangle)
;   )


;; ----circle----
;; draw-a-circle: circle -> boolean
;; 输入一个circle结构体，画在在画布上
(define (draw-a-circle circle)
  (draw-circle (circle-point circle) (circle-radius circle) (circle-color circle))
)


;; in-circle?: circle posn -> boolean
;; 输入一个circle结构体和posn结构体，判断点是否在圆内
(define (in-circle? circle posn)
  (and (<= (posn-x posn) (+ (posn-x (circle-point circle)) (circle-radius circle)))
       (<= (posn-y posn) (+ (posn-y (circle-point circle)) (circle-radius circle)))
  ))


;; translate-circle: circle delta -> circle
;; 输入一个circle和位移值，返回位移delta后的新circle
(define (translate-circle circle delta)
  (make-circle(make-posn (+ (posn-x (circle-point circle)) delta)
                         (posn-y (circle-point circle)))
              (circle-radius circle)
              (circle-color circle)

  ))


;; clear-a-circle: circle -> boolean
;; 输入一个circle，对其清除
(define (clear-a-circle circle)
  (clear-circle (circle-point circle) (circle-radius circle)))


;; draw-and-clear-circle: circle -> boolean
;; 画一个圆并在数秒后清除
(define (draw-and-clear-circle circle)
  (and (draw-a-circle circle)
       (sleep-for-a-while 1)
       (clear-a-circle circle)))


;; move-circle: circle delta -> circle
;; 绘制输入的circle，清除后返回位移delta后的新circle
(define (move-circle circle delta)
  (cond [(draw-and-clear-circle circle) (translate-circle circle delta)]
        [else circle]
  ))



;;----rectangle----
;; draw-a-rectangle: rectangle -> boolean
;; 输入一个rectangle，在画布上画出
(define (draw-a-rectangle rectangle)
  (draw-solid-rect
      (rectangle-point rectangle)
      (rectangle-width rectangle)
      (rectangle-height rectangle)
      (rectangle-color rectangle)
      ))

;; in-rectangle?: rectangle posn -> boolean
;; 输入一个rectangle结构体和posn结构体，判断点是否在矩形内
(define (in-rectangle? rectangle posn)
  (and (and (>= (- (posn-x posn) (posn-x (rectangle-point rectangle))) 0)
            (<= (posn-x posn) (+ (rectangle-width rectangle) (posn-x (rectangle-point rectangle)))))
       (and (>= (- (posn-y posn) (posn-y (rectangle-point rectangle))) 0)
            (<= (posn-y posn) (+ (rectangle-height rectangle) (posn-y (rectangle-point rectangle)))))
  ))


;; translate-rectangle: rectangle delta -> rectangle
;; 输入一个rectangle和数，向右输出rectangle的平移复制品
(define (translate-rectangle rectangle delta)
(make-rectangle(make-posn (+ (posn-x (rectangle-point rectangle)) delta)
                       (posn-y (rectangle-point rectangle)))
               (rectangle-width rectangle)
               (rectangle-height rectangle)
               (rectangle-color rectangle)

))


;; clear-a-rectangle: rectangle -> boolean
;; 输入一个circle，对其清除
(define (clear-a-rectangle rectangle)
  (clear-solid-rect (rectangle-point rectangle)
                      (rectangle-width rectangle)
                      (rectangle-height rectangle)))


;; draw-and-clear-rectangle: rectangle -> boolean
;; 画一个矩形并在数秒后清除
(define (draw-and-clear-rectangle rectangle)
(and (draw-a-rectangle rectangle)
 (sleep-for-a-while 1)
 (clear-a-rectangle rectangle)))


;; move-rectangle: rectangle delta -> rectangle
;; 绘制输入的rectangle，清除后返回位移delta后的新rectangle
(define (move-rectangle rectangle delta)
(cond [(draw-and-clear-rectangle rectangle) (translate-rectangle rectangle delta)]
      [else rectangle]
))






;; ----run----
(define C1 (make-circle (make-posn 100 100) 50 'blue))
(define C2 (translate-circle C1 50))
(define C3 (translate-circle C2 50))

(define R1 (make-rectangle (make-posn 50 50) 100 50 'green))
(define R2 (make-rectangle (make-posn 20 30) 30 20 'black))

(start 600 600)
; (draw-a-rectangle(move-rectangle(move-rectangle(move-rectangle(move-rectangle R2 5) 5) 5) 5))
; (draw-a-circle(move-circle(move-circle(move-circle(move-circle C1 5) 5) 5) 5))
; (in-circle? (make-circle (make-posn 6 2) 1 'blue) (make-posn 6 1.5))
; (in-circle? (make-circle (make-posn 6 2) 1 'blue) (make-posn 8 6))
