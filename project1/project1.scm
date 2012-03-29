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

;create an empty symbol table
(define (table-create) ())

;we need da y-combinator
;for a three parameter function
(define set-helper (lambda (table identifier type)
                                    (cond ((null? table) (list (list identifier type block-depth)))
                                          ((not (eq? (caddr (car table)) block-depth)) (list (list identifier type block-depth)))
                                          ((not (eq? (caar table) identifier)) (append (set-helper (cdr table) identifier type) table))
                                          ((eq? (caar table) identifier) (display "identifier already exists") table)
                                          )))

;check to see if the identifier is already in the table
;if yes, print an error message
;else, save the identifier and its type level
;return the table
(define set-identifier (lambda (table identifier type) 
                         (cond ((null? table) (list (list identifier type block-depth)))
                               ((not (eq? (caddr (car table)) block-depth)) (cons (list identifier type block-depth) table))
                               (else (set-helper table identifier type))
                               )))
                         

;return the type and level of the specified identifier in the symbol table
;if the identifier is not in the table, return the empty list
(define get-identifier (lambda (table identifier) 
                         (cond ((null? table) ())
                               ((eq? (caar table) identifier) (cdar table))
                               (else (get-identifier (cdr table) identifier))
                               )))

;format and print the symbol table entries, their types, and their levels
;the output should illustrate the block levels of the identifier entries
(define table-print (lambda (table) ()))

;
;
(define enter-block ())

;
;
(define exit-block ())