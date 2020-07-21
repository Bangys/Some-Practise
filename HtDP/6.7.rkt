;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |6.7|) (read-case-sensitive #t) (teachpacks ((lib "hangman.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "hangman.rkt" "teachpack" "htdp")) #f)))

;;draw-next-part: symbol -> boolean
;; 根据输入的符号来绘制线段
(define (draw-next-part symbol)
  (cond
      [(symbol=? symbol 'noose) (draw-solid-line (make-posn 10 0) (make-posn 10 10) 'black)]
      [(symbol=? symbol 'head) (draw-solid-line (make-posn 10 10) (make-posn 10 20) 'red)]
      [(symbol=? symbol 'body) (draw-solid-line (make-posn 10 20) (make-posn 10 30) 'red)]
      [(symbol=? symbol 'right-arm) (draw-solid-line (make-posn 10 30) (make-posn 10 40) 'red)]
      [(symbol=? symbol 'left-arm) (draw-solid-line (make-posn 10 40) (make-posn 10 50) 'red)]
      [(symbol=? symbol 'left-leg) (draw-solid-line (make-posn 10 50) (make-posn 10 60) 'red)]
      [(symbol=? symbol 'right-leg) (draw-solid-line (make-posn 10 60) (make-posn 10 70) 'black)]
      ))


;;word是结构体
;   (make-word c1 c2 c3)
; 其中c1、c2、c3为a-z的符号
(define-struct word (c1 c2 c3))
;; Template:
; (define (fun-for-word)
;   (word-c1)
;   (word-c2)
;   (word-c3)
;   )


;; reveal: chosen status current-c -> word
;; usage: chosen为答案词，status为当前状态词，current-c为当前猜测词，把猜测词与答案词的每个字符对比，如果等于答案词中的某个字符，就更新到当前状态词中，否则当前状态词不变
;; example:
;;   (reveal (make-word 't 'e 'd) (make-word '_ 'e '_) 'd)
;;   return: (make-word '_ 'e 'd)
(define (reveal chosen status current-c)
  (cond
      [(symbol=? current-c (word-c1 chosen)) (make-word current-c (word-c2 status) (word-c3 status))]
      [(symbol=? current-c (word-c2 chosen)) (make-word (word-c1 status) current-c (word-c3 status))]
      [(symbol=? current-c (word-c3 chosen)) (make-word (word-c1 status) (word-c2 status) current-c)]
      [else status]
      ))


(start 200 200)
(hangman make-word reveal draw-next-part)
