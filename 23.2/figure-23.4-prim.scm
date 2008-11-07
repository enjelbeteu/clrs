(require-extension check (srfi 1))
(require 'section)
(require '../util/util)
(import section-23.2)
(import util)
(let* ((graph (figure-23.1))
       (root (find (lambda (node) (eq? 'a (node-label node)))
                   (graph-nodes graph))))
  (debug (map node-label (adjacent-nodes graph root)))
;;;   (minimum-spanning-tree/prim graph root)
  )
