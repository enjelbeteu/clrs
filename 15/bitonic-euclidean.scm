(define (sort-by-x p)
  (let ((x->y (alist->hash-table p))
        (sorted-x (heapsort (map car p))))
    (map (lambda (x) (cons x (hash-table-ref x->y x))) sorted-x)))

(define (memoized-bitonic-euclidean-salesman p)
  (let* ((n (length p))
         (dim `(0 ,n)))
    (let ((b (make-array '#(#f) dim dim))
          (r (make-array '#(#f) dim dim))
          (square (lambda (a) (* a a)))
          (p (sort-by-x p)))
      (let* ((distance
              (lambda (p1 p2)
                (let ((x1 (car p1))
                      (y1 (cdr p1))
                      (x2 (car p2))
                      (y2 (cdr p2)))
                  (sqrt (+ (square (- x2 x1))
                           (square (- y2 y1)))))))
             (iter
              (rec (iter i j)
                   (let ((length (array-ref b i j)))
                     (if length
                         length
                         (let ((pi (list-ref p i))
                               (pj (list-ref p j)))
                           (cond ((equal? (list i j) '(0 1))
                                  (array-set! b (distance pi pj) i j)
                                  (array-set! r 0 i j))
                                 ((= (- j 1) i)
                                  (array-set! b +inf i j)
                                  (loop ((for k (up-from 0 (to (- j 1)))))
                                        (let* ((pk (list-ref p k))
                                               (q (+ (iter k (- j 1))
                                                     (distance pk pj))))
                                          (if (< q (array-ref b i j))
                                              (begin (array-set! b q i j)
                                                     (array-set! r k i j))))))
                                 (else
                                  (let ((pj-1 (list-ref p (- j 1))))
                                    (array-set! b (+ (iter i (- j 1))
                                                     (distance pj-1 pj)) i j)
                                    (array-set! r (- j 1) i j))))
                           (array-ref b i j)))))))
        (let ((pn-1 (list-ref p (- n 1)))
              (pn-1-1 (list-ref p (- n 1 1))))
          (array-set! b (+ (iter (- n 1 1) (- n 1))
                           (distance pn-1 pn-1-1)) (- n 1) (- n 1))
          (array-set! r (- n 1 1) (- n 1) (- n 1)))
        (values b r)))))

(define (construct-path p r)
  (let ((n (length p)))
    (let ((pn-1 (list-ref p (- n 1)))
          (pn-1-1 (list-ref p (- n 1 1)))
          (k (array-ref r (- n 1 1) (- n 1)))
          (iter
           (rec (iter i j)
                (if (< i j)
                    (let ((k (array-ref r i j)))
                      (if (= k i)
                          '()
                          (cons (list-ref p k) (iter i k))))
                    (let ((k (array-ref r j i)))
                      (if (> k 0)
                          (append (iter k j) (list (list-ref p k)))
                          '()))))))
      (append (list pn-1 pn-1-1)
              (iter k (- n 1 1))
              (list (list-ref p k))))))
