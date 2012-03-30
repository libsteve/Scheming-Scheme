;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Symbol Table and Blocks Project
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Contributers:
;; Steven Brunwasser - sjb9815
;; Ethan Peters - ejp6914
;; Peter Mikitsh - pam3961
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;create an empty symbol table
(define (table-create) '(0))

;helper function for set-identifier
;for use only by set-identifier
(define set-helper
  (lambda (table id type)
    (cond 
      ((empty? (cdr table)) (list (list id type (car table))))
      ((not (eq? (caddr (cadr table)) (car table))) (list (list id type (car table))))
      ((eq? (caadr table) id) (display "identifier already exists") table)
      (else (append (set-helper (cons (car table) (cddr table)) id type) (cdr table)))
    )
  )
)

;check to see if the identifier is already in the table
;if yes, print an error message
;else, save the identifier and its type level
;return the table
(define set-identifier
  (lambda (table id type) 
    (cond
      ((empty? (cdr table)) (list (car table) (list id type (car table))))
      ((not (eq? (caddr (cadr table)) (car table))) (cons (car table) (cons (list id type (car table)) (cdr table))))
      (else (cons (car table) (set-helper table id type)))
    )
  )
)
                         

;return the type and level of the specified identifier in the symbol table
;if the identifier is not in the table, return the empty list
(define get-identifier
  (lambda (table identifier) 
    (cond
      ((null? (cdr table)) ())
      ((eq? (caadr table) identifier) (cdadr table))
      (else (get-identifier (cons (car table) (cddr table)) identifier))
    )
  )
)

;format and print the symbol table entries, their types, and their levels
;the output should illustrate the block levels of the identifier entries
(define table-print
  (lambda (table) 
    (cond
      ((null? table) (display "()"))
      (else (print-helper (reverse (cdr table))))
    )  
  )
)

(define print-helper
  (lambda (lst) 
    (cond ((null? lst) (display "") )
      (else
        (print-space (car (cdr (cdr (car lst)))))
        (display (car (car lst)))
        (display " ")
        (display (car (cdr (car lst))))
        (display " ")
        (display (car (cdr (cdr (car lst)))))
        (display "\n")
        (print-helper (cdr lst))
      )
    )
  )
)

(define print-space
  (lambda (num)
    (cond
      ((= num 0) ())
      (else
        (display " ")
        (print-space (- num 1))
      )
    )
  )
)

; enter a new block
(define enter-block
  (lambda (table)
    (cons (+ 1 (car table)) (cdr table))
   )
)

; exit a block and only return upper level blocks
(define exit-block
  (lambda (table)
    (cond
      ((eq? (car table) 0) table-create)
      ((not (eq? (car table) (car (cddadr table)))) (cons (- (car table) 1) (cdr table)))
      (else (exit-block (cons (car table) (cddr table))))
    )
  )
)