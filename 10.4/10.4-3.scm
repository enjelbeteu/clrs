(require-extension syntax-case check)
(require '../10.4/section)
(import section-10.4)
(check (tree-map/iter tree-node-key exercise-10.4-1)
       => '(7 5 4 12 2 21 10 18))
