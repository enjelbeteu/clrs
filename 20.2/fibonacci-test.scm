(require '../20.2/section)
(require '../util/util)
(import section-20.2)
(import util)
(let ((h1 (make-fibonacci-heap #f 0))
      (h2 (make-fibonacci-heap #f 0))
      (n1 (make-fibonacci-node 1 'harro #f #f #f #f #f 0))
      (n2 (make-fibonacci-node 2 'harro #f #f #f #f #f 0))
      (n3 (make-fibonacci-node 3 'harro #f #f #f #f #f 0))
      (n4 (make-fibonacci-node 4 'harro #f #f #f #f #f 0)))
  (fibonacci-heap-insert! h1 n1)
  (fibonacci-heap-insert! h1 n2)
  (fibonacci-heap-insert! h2 n3)
  (fibonacci-heap-insert! h2 n4)
;;;   (debug (fibonacci-heap-map-roots fibonacci-node-key h1))
;;;   (debug (fibonacci-heap-map-roots fibonacci-node-key h2))
  (let ((union (fibonacci-heap-union! h1 h2)))
    (fibonacci-heap-map-roots fibonacci-node-key union)))