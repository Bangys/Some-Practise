;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 7-4) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))




(define-struct circle(point radius color))
;; circle是结构体(make-circle p r c)，其中p是posn结构体，r是数，c是符号


(define-struct rectangle(point width height color))
;; rectangle是结构体(make-rectangle p w h c)，其中p是posn结构体，w和h是数，c是符号

;; shape是以下中的一个：
;; 1.circle
;; 2.rectangle

;; template:
;; fun-for-shape: shape -> ???
; (define (fun-for-shape shape)
; (cond
;     [(circle? shape)
;        (circle-point shape)
;        (circle-radius shape)
;        (circle-color shape)
;        ]
;     [(rectangle? shape)
;        (rectangle-point shape)
;        (rectangle-width shape)
;        (rectangle-height shape)
;        (rectangle-color shape)
;     ]
;     ))


;; draw-shape: shape -> boolean
;; 输入一个shape并画出
(define (draw-shape shape)
(cond
    [(circle? shape) (draw-circle (circle-point shape) (circle-radius shape) (circle-color shape))]
    [(rectangle? shape)   (draw-solid-rect
          (rectangle-point shape)
          (rectangle-width shape)
          (rectangle-height shape)
          (rectangle-color shape)
          )]
    ))


;; translate-shape: shape delta -> shape
;; 输入一个shape，返回平移delta后的新shape
(define (translate-shape shape delta)
(cond
    [(circle? shape)  (make-circle(make-posn (+ (posn-x (circle-point shape)) delta)
                            (posn-y (circle-point shape)))
                 (circle-radius shape)
                 (circle-color shape))]
    [(rectangle? shape) (make-rectangle(make-posn (+ (posn-x (rectangle-point shape)) delta)
                           (posn-y (rectangle-point shape)))
                   (rectangle-width shape)
                   (rectangle-height shape)
                   (rectangle-color shape))]
    ))


;; clear-shape: shape -> boolean
;; 清除输入的形状
(define (clear-shape shape)
(cond
    [(circle? shape)  (clear-circle (circle-point shape) (circle-radius shape))]
    [(rectangle? shape) (clear-solid-rect (rectangle-point shape)
                        (rectangle-width shape)
                        (rectangle-height shape))]
    ))


;; draw-and-clear-shape: shape -> boolean
;; 输入一个shape画出后等待数秒清除
(define (draw-and-clear-shape shape)
(cond
    [(circle? shape)  (and (draw-shape shape)
         (sleep-for-a-while 1)
         (clear-shape shape))]
    [(rectangle? shape) (and (draw-shape shape)
     (sleep-for-a-while 1)
     (clear-shape shape))]
    ))

;; move-shape: shape delta -> shape
;; 先绘制shape，数秒后删除，最终返回位移了delta的新shape
(define (move-shape shape delta)
(cond
    [(circle? shape) (cond [(draw-and-clear-shape shape) (translate-shape shape delta)]
                            [else shape]
                      )]
    [(rectangle? shape) (cond [(draw-and-clear-shape shape) (translate-shape shape delta)]
                              [else shape]
                        )]
    ))



;; test
(define C1 (make-circle (make-posn 100 100) 50 'blue))
(define R1 (make-rectangle (make-posn 50 50) 100 50 'green))
(define R2 (make-rectangle (make-posn 20 30) 30 20 'black))

(start 400 400)
(move-shape(move-shape(move-shape(move-shape C1 5) 5) 5) 5)
(move-shape(move-shape(move-shape(move-shape R1 5) 5) 5) 5)
