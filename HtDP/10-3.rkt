;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 7-4) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))


;; include 7-4
;; draw-shape: shape -> boolean
;; 输入一个shape并画出
(define (draw-shape shape)
(cond
    [(circle? shape)
    (draw-solid-disk
        (circle-center shape)
        (circle-radius shape)
        (circle-color shape))]
    [(rectangle? shape)
    (draw-solid-rect
          (rectangle-center shape)
          (rectangle-width shape)
          (rectangle-height shape)
          (rectangle-color shape)
          )]
    ))

;; translate-shape: shape delta -> shape
;; 输入一个shape，返回平移delta后的新shape
(define (translate-shape shape delta)
(cond
    [(circle? shape)  (make-circle (circle-color shape)
                                   (make-posn (+ (posn-x (circle-center shape)) delta)
                                                 (posn-y (circle-center shape)))
                                   (circle-radius shape)
                                   )]

    [(rectangle? shape) (make-rectangle (rectangle-color shape)
                        (make-posn (+ (posn-x (rectangle-center shape)) delta)
                                                     (posn-y (rectangle-center shape)))
                        (rectangle-width shape)
                        (rectangle-height shape))]
    ))

;; clear-shape: shape -> boolean
;; 清除输入的形状
(define (clear-shape shape)
(cond
    [(circle? shape)  (clear-solid-disk (circle-center shape) (circle-radius shape))]
    [(rectangle? shape) (clear-solid-rect (rectangle-center shape)
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

;;----------cutline--------------
;; data defination:
;; shape是其中的一个:
;;   1. (make-circle C P N)
;;   2. (make-rectangle C P N N)
;; 其中 C为字符, P为posn结构体, N为数

;; list-of-shapes(losh)是其中之一:
;;     1. empty
;;     2. (cons shape losh)

(define-struct circle (color center radius))
(define-struct rectangle (color center width height))

;; TEMPLATE
; (define (fun-for-losh alosh)
;   (cond
;     [(empty?) alosh ...]
;     [(circle? (first alosh))
;      (circle-color (first alosh)) ...
;      (circle-center (first alosh)) ...
;      (circle-radius (first alosh)) ...]
;     [(rectangle? (first alosh))
;      (rectangle-color (first alosh)) ...
;      (rectangle-nw-corner (first alosh)) ...
;      (rectangle-width (first alosh)) ...
;      (rectangle-height (first alosh)) ...]
;     [else (fun-for-losh (rest alosh)) ...]))

(define FACE
  (cons (make-circle 'red (make-posn 50 50) 50)
        (cons (make-rectangle 'blue (make-posn 30 20) 10 10)
              (cons (make-rectangle 'blue (make-posn 65 20) 10 10)
                    (cons (make-rectangle 'blue (make-posn 40 75) 10 10)
                          (cons (make-rectangle 'blue (make-posn 40 75) 25 10)
                                (cons (make-rectangle 'blue (make-posn 45 35) 15 30)
                                      empty)))))))

;; draw-losh: losh -> boolean
;; 画出列表中的图形
(define (draw-losh alosh)
    (cond
      [(empty? alosh) true]
      [else
        (and (draw-shape (first alosh))
             (draw-losh (rest alosh)))]
    ))

;; translate-losh: alosh number -> alosh
;; 表中的图形位置平移n个像素
(define (translate-losh alosh delta)
    (cond
        [(empty? alosh) empty]
        [else (cons (translate-shape (first alosh) delta)
                    (translate-losh (rest alosh) delta))]
    ))

;; clear-losh: losh -> boolean
;; 清除输入的形状
(define (clear-losh alosh)
(cond
  [(empty? alosh) true]
  [else
    (and (clear-shape (first alosh))
         (clear-losh (rest alosh)))]
))



;; draw-and-clear-losh: losh -> boolean
;; 绘制一个图形等一段时间清除
(define (draw-and-clear-losh alosh)
    (cond
      [(empty? alosh) true]
      [else
      (and (draw-losh alosh)
           (sleep-for-a-while 1)
           (clear-losh alosh)
      )]
    ))

;; move-picture: delta alosh(picture) -> alosh
;; 先绘制picture，数秒后删除，最终返回位移了delta的新picture
(define (move-picture delta alosh)
(cond
    [(empty? alosh) empty]
    [(draw-and-clear-losh alosh) (translate-losh alosh delta)]))


(start 200 200)
(draw-losh (move-picture 10 (move-picture -10 (move-picture 20 (move-picture -20 FACE)))))
