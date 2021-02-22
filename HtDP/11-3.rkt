;; theatre-size : number
;; 场地大小
(define theatre-size 9)

;; seat-width : number
;; 每行格子宽度
(define seat-width 9)

;; 整体大小
(define window-size (* seat-width theatre-size))


;; draw-vertical-lines : number -> true
;; 画出场地的垂直线
(define (draw-vertical-lines n)
  (cond
    [(zero? n) true]
    [else (and (draw-vertical-lines (sub1 n))
               (draw-solid-line (make-posn 0 (* n seat-width))
                                (make-posn window-size (* n seat-width))))]))

;; draw-horizontal-lines : number -> true
;; 画出场地的水平线
(define (draw-horizontal-lines n)
  (cond
    [(zero? n) true]
    [else (and (draw-horizontal-lines (sub1 n))
               (draw-solid-line (make-posn (* n seat-width) 0)
                                (make-posn (* n seat-width) window-size)))]))

;; riot : number -> true
;; 随机分布小点
(define (riot balls)
  (cond
    [(zero? balls) true]
    [else (and (draw-solid-disk (make-posn (random window-size) (random window-size))
                                2
                                'red)
               (riot (sub1 balls)))]))

(start window-size window-size)
(draw-vertical-lines theatre-size)
(draw-horizontal-lines theatre-size)

;; example as test
(riot 20)
