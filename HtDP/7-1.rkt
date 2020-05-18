;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6-6) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))


;; pixel为二者之一：1.数 2.posn结构体
;; distance-to-0: pixel -> number
;; 计算顶点到pixel的距离
(define (disctance-to-0 pixel)
  (cond
      [(number? pixel) pixel]
      [(posn? pixel) (sqrt (+ (sqr (posn-x pixel))
                              (sqr (posn-y pixel))))]
      )
  )
