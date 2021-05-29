; largest : non-empty-list-of-numbers -> number
(define (largest nums)
  (cond [(empty? (rest nums)) (first nums)]
        [(cons? (rest nums))
         (cond [(>= (first nums) (largest (rest nums)))
                (first nums)]
               [else
                (largest (rest nums))])
         ]))

(largest (list 1 2 3 4))