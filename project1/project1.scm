;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Symbol Table and Blocks Project
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Contributers:
;; Steven Brunwasser - sjb9815
;; Ethan Peters - ejp6914
;; Peter Mikitch - ???????
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;create an empty symbol table
(define table-create ())

;check to see if the identifier is already in the table
;if yes, print an error message
;else, save the identifier and its type level
;return the table
(define set-identifier ())

;return the type and level of the specified identifier in the symbol table
;if the identifier is not in the table, returnt the empty list
(define get-identifier ())

;format and print the symbol table entries, their types, and their levels
;the output should illustrate the block levels of the identifier entries
(define table-print ())