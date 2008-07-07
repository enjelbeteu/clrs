(require-extension syntax-case check)
(require '../12.1/section)
(require '../12.3/section)
(import section-12.1)
(import section-12.3)
(let ((tree (figure-12.4)))
  (let ((root (figure-12.4/root tree))
        (node (figure-12.4/5 tree))
        (successor (figure-12.4/6 tree)))
    (bt-delete!/preserve-pointer node)
    ;; Check whether node was deleted.
    (check (bt-inorder-tree-map bt-node-datum root)
           => '(23 20 18 16 15 13 12 10 7 6 3))
    ;; Check whether successor's pointer is preserved.
    (check (bt-node-datum successor) => 6)
    ;; Check whether graft was successful.
    (check (bt-node-datum (bt-node-left successor))
           => (bt-node-datum (bt-node-left node)))
    (check (bt-node-datum (bt-node-right successor))
           => (bt-node-datum (bt-node-right node)))
    (check (bt-node-datum (bt-node-parent successor))
           => (bt-node-datum (bt-node-parent node)))))