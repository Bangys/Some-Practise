#| 模型一
 Data Definition:
 file是symbol类型
 dir是其中之一：
   1. empty;
   2. (cons f d) 其中f是file，d是dir
   3. (cons d1 d2) 其中d1、d2都是dir

;; dir template
(define (how-many adir)
  (cond
    [(empty? adir) ...]
    [(symbol? (first adir)) ...(first adir)...
                            ...(how-many (rest adir))...]
    [else ...(how-many (first adir))...
          ...(how-many (rest adir))...]))
|#
;; how-many: dir -> number
;; 读入一个dir，返回dir树中的文件数
(define (how-many adir)
  (cond
    [(empty? adir) 0]
    [(symbol? (first adir))
     (+ 1 (how-many (rest adir)))]
    [else (+ (how-many (first adir))
             (how-many (rest adir)))]))



#|模型二
 Data Definition:
 file是symbol类型
 dir是结构体:
       (make-dir n c) 其中n是symbol，c是文件和目录的表

文件和目录的表 (LOFD)是其中之一：
    1. empty;
    2.(cons f d) 其中f是文件，d是LOFD
    3.(cons d1 d2) 其中d1是dir，d2是LOFD

directory template:
(define (how-many adir)
  ...(dir-name adir)...
  ...(how-many-in-content (dir-content adir))...)
|#
(define-struct dir(name content))


 ;;how-many: dir -> number
 ;;读入一个dir，返回该dir中的文件数
 (define (how-many adir)
   (how-many-in-content (dir-content adir)))


#|需要一个相互递归的函数来计算出在LOFD中的文件数
;LOFD Template:
(define (how-many-in-content aLOFD)
 (cond
   [(empty? aLOFD)...]
   [(symbol? (first aLOFD))
    ...(first aLOFD)...
    ...(how-many-in-content (rest aLOFD))...]
   [else
    ...(how-many (first aLOFD))...
    ...(how-many-in-content (rest aLOFD))...]))
|#

;;how-many-in-content: LOFD -> number
;;读入一个LOFD，返回其包含的文件数
(define (how-many-in-content aLOFD)
  (cond
    [(empty? aLOFD) 0]
    [(symbol? (first aLOFD))
     (+ 1 (how-many-in-content (rest aLOFD)))]
    [else (+ (how-many (first aLOFD))
             (how-many-in-content (rest aLOFD)))]))



#| 模型三
data defination:
;; 文件是结构体：
  (make-file n s x) 其中n是符号，s是数字，s是某scheme值

;; 文件表是其中之一：
;;   1.empty
;;   2.(cons s lof) s是文件，lof是文件表

;; dir是结构体:
;;   (make-dir n ds fs) 其中n是符号，ds目录表，fs是文件表

;; 目录表是其中之一：
;;   1.empty
;;   2.(cons s lod) 其中s是目录，lod是目录表
|#

(define-struct file (name size content))
(define-struct dir (name dirs files))


;; how-many: dir -> number
;; ditto
(define (how-many a-dir)
  (+ (how-many-in-dir-list (dir-dirs a-dir))
     (how-many-in-file-list (dir-files a-dir))))

;; List-of-dirs -> number
;; 计算出在目录表中的文件数
(define (how-many-in-dir-list dirs)
  (cond
    [(empty? dirs) 0]
    [else (+ (how-many (first dirs))
             (how-many-in-dir-list (rest dirs)))]))

;; List-of-files -> number
;; 计算出在文件表中的文件数
(define (how-many-in-file-list files)
  (cond
    [(empty? files) 0]
    [else (add1 (how-many-in-file-list (rest files)))]))


#|
为什么我们相信函数会得出正确的结果?

By following the design recipe, we know that each function eventually
lives up to the promise of its purpose statement. Hence when we call
'how-many-in-dir-list' from 'how-many', we are confident that the
function will deliver the number of files in a list of directories --
no matter how complicated the computation gets. Similarly, when we
call 'how-many' from 'how-many-in-dir-list', we know that it computes
how many files are in a single directory -- no matter what it needs to
do to compute this number. Even if something goes wrong, the test
cases quickly expose which function(s) messed up.
|#
