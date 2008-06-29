(define-record-type :tree-node
  (make-tree-node parent left right key)
  tree-node?
  (parent tree-node-parent set-tree-node-parent!)
  (left tree-node-left set-tree-node-left!)
  (right tree-node-right set-tree-node-right!)
  (key tree-node-key set-tree-node-key!))

;;; Sans mutation?
(define (tree-map proc root)
  (let ((mapping '()))
    (let continue ((parent root))
      (if parent
          (begin (set! mapping (cons (proc parent) mapping))
                 (continue (tree-node-left parent))
                 (continue (tree-node-right parent)))))
    mapping))

(define (tree-for-each proc root)
  (let continue ((parent root))
    (if parent
        (begin (proc parent)
               (continue (tree-node-left parent))
               (continue (tree-node-right parent))))))

(define (set-tree-node-parent-left-right! node parent left right)
  (set-tree-node-parent! node parent)
  (set-tree-node-left! node left)
  (set-tree-node-right! node right))

;; (define (10.4-1)
;;   (letrec ((node-0 (make-tree-node node-5 node-6 node-2 12))
;;            (node-1 (make-tree-node node-7 node-7 #f 15))
;;            (node-2 (make-tree-node node-0 node-9 #f 4))
;;            (node-3 (make-tree-node node-5 node-4 node-8 10))
;;            (node-4 (make-tree-node node-3 #f #f 2))
;;            (node-5 (make-tree-node node-7 node-0 node-3 18))
;;            (node-6 (make-tree-node node-0 #f #f 7))
;;            (node-7 (make-tree-node node-1 node-5 node-1 14))
;;            (node-8 (make-tree-node node-3 #f #f 21))
;;            (node-9 (make-tree-node node-2 #f #f 5)))
;;     (map tree-node-key (list node-0 node-1 node-2 node-3 node-4 node-5 node-6 node-7 node-8 node-9))
;;     node-5))

(define 10.4-1
  (let ((node-0 (make-tree-node #f #f #f 12))
        (node-1 (make-tree-node #f #f #f 15))
        (node-2 (make-tree-node #f #f #f 4))
        (node-3 (make-tree-node #f #f #f 10))
        (node-4 (make-tree-node #f #f #f 2))
        (node-5 (make-tree-node #f #f #f 18))
        (node-6 (make-tree-node #f #f #f 7))
        (node-7 (make-tree-node #f #f #f 14))
        (node-8 (make-tree-node #f #f #f 21))
        (node-9 (make-tree-node #f #f #f 5)))
    (set-tree-node-parent-left-right! node-0 node-5 node-6 node-2)
    (set-tree-node-parent-left-right! node-1 node-7 node-7 #f)
    (set-tree-node-parent-left-right! node-2 node-0 node-9 #f)
    (set-tree-node-parent-left-right! node-3 node-5 node-4 node-8)
    (set-tree-node-parent-left-right! node-4 node-3 #f #f)
    (set-tree-node-parent-left-right! node-5 node-7 node-0 node-3)
    (set-tree-node-parent-left-right! node-6 node-0 #f #f)
    (set-tree-node-parent-left-right! node-7 node-1 node-5 node-1)
    (set-tree-node-parent-left-right! node-8 node-3 #f #f)
    (set-tree-node-parent-left-right! node-9 node-2 #f #f)
    node-5))