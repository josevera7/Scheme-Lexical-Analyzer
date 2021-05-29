; insert-in-order : num sorted-list-of-numbers -> sorted-list-of-numbers
(define (insert-in-order newnum sorted-nums)
  (cond [(empty? sorted-nums) (list newnum)]
        [(cons? sorted-nums)
         (cond [(<= newnum (first sorted-nums))
                (cons newnum sorted-nums)]
               [else
                (cons (first sorted-nums)
                      (insert-in-order newnum (rest sorted-nums)))
                ])                                                  
         ]))
"Examples of insert-in-order:"
(insert-in-order 5 empty) "sb" (list 5)
(insert-in-order 7 (list 4)) "sb" (list 4 7)
(insert-in-order 7 (list 8)) "sb" (list 7 8)
(insert-in-order 7 (list 7)) "sb" (list 7 7)
(insert-in-order 7 (list -5 0 1 4 8 9 237)) "sb" (list -5 0 1 4 7 8 9 237)
(insert-in-order 7 (list 8 9 13.4 237)) "sb" (list 7 8 9 13.4 237)


; sort : list-of-numbers => sorted-list-of-numbers
(define (sort nums)
  (cond [(empty? nums) empty]
        [(cons? nums)
;         nums              (list 6 9 5 2 7 3 5)
;         (first nums)      6
;         (rest nums)           (list 9 5 2 7 3 5)
;         (sort (rest nums))    (list 2 3 5 5 7 9)
;         right answer          (list 2 3 5 5 6 7 9)
         (insert-in-order (first nums) (sort (rest nums)))
         ]))
"Examples of sort:"
(sort empty) "should be" empty
(sort (list 5)) "sb" (list 5)
(sort (list 5 2)) "sb" (list 2 5)
(sort (list 2 5)) "sb" (list 2 5)
(sort (list 6 9 5 2 7 3 5)) "should be" (list 2 3 5 5 6 7 9)
(sort (list 1 9 5 2 7 3 5)) "should be" (list 1 2 3 5 5 7 9)