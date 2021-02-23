




#|data defination:
  BT(binary-tree)为其中之一：
  1. false;
  2. (make-node num pn lft rgt)
    其中num是数，pn是符号，lft和rgt是BT
|#
(define-struct node (num name left right))


(define bt1 (make-node 11 'Bobby false (make-node 12 'Luke false false)))
(define bt2 (make-node 11 'Bobby (make-node 12 'Luke false false) false))
(define bt3 (make-node 11 'Bobby (make-node 12 'Luke false false) (make-node 5 'Paul false false)))

;; bt-contains?: number BT -> boolean
;; 判断数n是否在此二叉树中出现
(define (bt-contains? n a-bt)
  (cond
    [(boolean? a-bt) false]
    [else
     (or (= n (node-num a-bt))
         (bt-contains? n (node-left a-bt))
         (bt-contains? n (node-right a-bt)))]))
