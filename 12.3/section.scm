(require-extension
 syntax-case
 (srfi 27))
(require '../12.1/section)
(require '../12.2/section)
(module
 section-12.3
 (bt-insert!
  bt-delete!
  bt-delete!/preserve-pointer
  bt-delete!/fair
  figure-12.3
  figure-12.4
  figure-12.4/root
  figure-12.4/13
  figure-12.4/16
  figure-12.4/6
  figure-12.4/5)
 (import* section-12.1
          make-bt-node
          bt-node-key
          bt-node-right
          bt-node-left
          bt-node-datum
          bt-node-parent
          bt-inorder-tree-map
          set-bt-node-right!
          set-bt-node-left!
          set-bt-node-parent!
          set-bt-node-key!
          set-bt-node-datum!
          set-bt-node-left-right-parent!)
 (import* section-12.2
          bt-successor
          bt-predecessor)
 (include "../12.3/binary-tree.scm"))
