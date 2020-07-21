;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname 6-2) (read-case-sensitive #t) (teachpacks ((lib "hangman.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "hangman.rkt" "teachpack" "htdp")) #f)))


;; 画布宽、高 灯泡半径 边距
(define WIDTH 50)
(define HEIGHT 160)
(define BULB-RADIUS 20)
(define BULB-DISTANCE 10)

;; 灯泡位置
(define X-BULBS(quotient WIDTH 2))
(define Y-RED(+ BULB-DISTANCE BULB-RADIUS))
(define Y-YELLOW (+ Y-RED BULB-DISTANCE (* 2 BULB-RADIUS)))
(define Y-GREEN (+ Y-YELLOW BULB-DISTANCE (* 2 BULB-RADIUS)))


;; clear-blub: symbol -> boolean
;; usage：输入代表颜色的符号，关闭对应的灯并画圆
;; example: (clear-bulb 'red) 会在画布上的红色圆盘清除掉并画红色空心圆
;; trick：使用了 and 进行效果组合，可以看到判断句2的效果
(define (clear-bulb color)
  (cond
  [(symbol=? color 'red)(and (clear-solid-disk(make-posn X-BULBS Y-RED) BULB-RADIUS) (draw-circle(make-posn X-BULBS Y-RED) BULB-RADIUS 'red))]
  [(symbol=? color 'yellow)(and (clear-solid-disk(make-posn X-BULBS Y-YELLOW) BULB-RADIUS) (draw-circle(make-posn X-BULBS Y-YELLOW) BULB-RADIUS 'yellow))]
  [(symbol=? color 'green)(and (clear-solid-disk(make-posn X-BULBS Y-GREEN) BULB-RADIUS) (draw-circle(make-posn X-BULBS Y-GREEN) BULB-RADIUS 'green))]
  )
)

;; draw-blub: symbol -> boolean
;; usage：输入代表颜色的符号，打开对应的灯
;; example: (draw-bulb 'red) 在画布上画一个红色圆盘
(define (draw-bulb color)
  (cond
  [(symbol=? color 'red)(draw-solid-disk(make-posn X-BULBS Y-RED) BULB-RADIUS 'red)]
  [(symbol=? color 'yellow)(draw-solid-disk(make-posn X-BULBS Y-YELLOW) BULB-RADIUS 'yellow)]
  [(symbol=? color 'green)(draw-solid-disk(make-posn X-BULBS Y-GREEN) BULB-RADIUS 'green)]
  )
)

;; switch: symbol symbol -> boolean
;; usage: 输入两个颜色符号，按顺序开关灯
;; example: (switch 'red 'green) 会先关闭红灯 然后打开绿灯
(define (switch color1 color2)
  (and (clear-bulb color1) (draw-bulb color2)))

;; next: symbol -> symbol
;; usage:把当前颜色转为下一个颜色 红转绿 绿转黄 黄转红，返回切换后颜色的字符值
;; example：next('red) 会关掉红灯然后亮绿灯
(define (next current-color)
  (cond
      [(and (symbol=? current-color 'red) (switch 'red 'green)) 'green]
      [(and (symbol=? current-color 'yellow) (switch 'yellow 'red)) 'red]
      [(and (symbol=? current-color 'green) (switch 'green 'yellow)) 'yellow]
      ))



;; run
;; 绘制画布，画出红灯，等待1s，下一个颜色
(start WIDTH HEIGHT)
(draw-bulb 'red)
(sleep 1)
(next 'red)
(sleep 1)
(next (next 'red))
