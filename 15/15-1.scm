(require-extension syntax-case srfi-11 array-lib array-lib-hof check)
(require '../util/util)
(require '../15/chapter)
(import* util round-array)
(import chapter-15)
(let ((p '((0 . 6) (1 . 0) (2 . 3) (5 . 4) (7 . 5) (8 . 2) (6 . 1))))
  (let-values (((b r) (memoized-bitonic-euclidean-salesman p)))
    (check (array->list (round-array b)) =>
           '((#f 6.0 9.0 12.0 16.0 20.0 #f)
             (#f #f 10.0 13.0 16.0 20.0 #f)
             (#f #f #f 15.0 18.0 22.0 #f)
             (#f #f #f #f 18.0 22.0 #f)
             (#f #f #f #f #f 20.0 #f)
             (#f #f #f #f #f #f 22.0)
             (#f #f #f #f #f #f 26.0)))
    (check (array->list r) =>
           '((#f 0 1 2 3 4 #f)
             (#f #f 0 2 3 4 #f)
             (#f #f #f 0 3 4 #f)
             (#f #f #f #f 1 4 #f)
             (#f #f #f #f #f 3 #f)
             (#f #f #f #f #f #f 4)
             (#f #f #f #f #f #f 5)))
    (check (construct-path (sort-by-x p) r) =>
           '((8 . 2) (7 . 5) (5 . 4) (2 . 3) (0 . 6) (1 . 0) (6 . 1)))))
