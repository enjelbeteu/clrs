(require-extension syntax-case check)
(require '../11.4/section)
(import section-11.4)
(let ((keys '(10 22 31 4 15 28 17 88 59))
      (m 11))
  (let ((hash (lambda (k) (modulo k m)))
        (table (make-oa-table m (linear-probe hash m))))
    (for-each (lambda (key) (oa-insert! table key)) keys)
    (check (oa-search table 88) => 1)
    (oa-delete! table 22)
    ;; The search for 88 goes over the deleted 22.
    (check (oa-search table 88) => 1)
    (oa-insert! table 66)
    ;; 66 hashes to 22's old position.
    (check (oa-search table 66) => 0)))