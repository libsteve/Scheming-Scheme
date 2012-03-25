;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Symbol Table and Blocks Project
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Contributers:
;; Steven Brunwasser - sjb9815
;; Ethan Peters - ejp6914
;; Peter Mikitsh - ???????
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;this defines the current block depth
;the block depth always starts at 0
(define block-depth 0)

;return a stack-based table with the (identifier type block-depth) pair
;(define table-push (lambda (table identifier type)
;                     (cons '(identifier type block-depth) table)
;                     ))
;
;(define table-pop (lambda (table)
;                    (cond ((null? table) ())
;                          (else (cdr table))
;                          )))
;
;(define table-identifier-pop (lambda (table identifier)
;                               (cond ((null? table) ())
;                                     ((eq? (caar table) identifier) (table-pop table))
;                                     )))

;create an empty symbol table
(define (table-create) 'table)

;check to see if the identifier is already in the table
;if yes, print an error message
;else, save the identifier and its type level
;return the table
(define set-identifier (lambda (table identifier type) 
                         (cond ((eq? 'table table) (list (set-identifier () identifier type)))
                               ((null? table) (list (list identifier type block-depth)))
                               ((not (list? (caar table)))
                                (cond ((eq? (caar table) identifier) (display "identifier already exists") table)
                                      (else (append table (set-identifier (cdr table) identifier type)))
                                      ))
                               (else (cons (set-identifier (car table) identifier type) (cdr table)))
                               )
                         ))

;return the type and level of the specified identifier in the symbol table
;if the identifier is not in the table, returnt the empty list
(define get-identifier (lambda (table identifier) ()))

;format and print the symbol table entries, their types, and their levels
;the output should illustrate the block levels of the identifier entries
(define table-print (lambda (table) ()))