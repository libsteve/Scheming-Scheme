;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; File:      $Id: project1_simpleDriver.scm,v 1.2 2012/03/19 02:50:58 rkr Exp rkr $
;;;; Author:    Rajendra K. Raj
;;;; Purpose:   Simple test driver program for Scheme Symbol Table project
;;;; Revisions:	$Log: project1_simpleDriver.scm,v $
;;;; Revisions:	Revision 1.2  2012/03/19 02:50:58  rkr
;;;; Revisions:	Minor typo fix
;;;; Revisions:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; This Scheme program loads the student submission, and executes each
;;;; of the required functions. The intent here is to cover each of the
;;;; required functions at least once.
;;;;
;;;; This file is not meant to be an exhaustive test of the student
;;;; program; a more complex version of this file will be used for final
;;;; testing by the instructor after project submission.
;;;;
;;;; Students must ensure their program works on different inputs and
;;;; supports arbitrary nesting.
;;;;
;;;; Helper functions may be defined in project1.scm as needed. Again, 
;;;; develop this program in the two phases as stated in the handout.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; load student submitted program
(display "About to load student program, project1.scm ....")
(newline)
(load "project1.scm")
(display "Loaded student program, project1.scm.")
(newline)

;;; enter a new table
(display "Creating a new table")
(newline)
(define symTable (table-create))
(newline)
(table-print symTable)
(newline)

;;; Set new identifiers
(display "Adding identifiers")
(newline)
(define symTable (set-identifier symTable 'c 'class))
(define symTable (set-identifier symTable 'a 'int))
(define symTable (set-identifier symTable 'b 'float))
(table-print symTable)
(newline)

;;; Get identifiers
(display "Getting info about identifier c: ")
(display (get-identifier symTable 'c))
(newline)
(display "Getting info about identifier a: ")
(display (get-identifier symTable 'a))
(newline)
(display "Getting info about identifier b: ")
(display (get-identifier symTable 'b))
(newline)
(display "Getting info about identifier d: ")
(display (get-identifier symTable 'd))
(newline)
(display "Getting info about identifier x: ")
(display (get-identifier symTable 'x))
(newline)
(table-print symTable)
(newline)

;;; enter a new block
(display "Entering a new block")
(newline)
(define symTable (enter-block symTable))
(table-print symTable)
(newline)

;;; Set new identifiers
(display "Adding new inner identifiers")
(define symTable (set-identifier symTable 'a 'char))
(define symTable (set-identifier symTable 'd 'int))
(table-print symTable)
(newline)

;;; Get identifiers
(display "Getting info about identifier c: ")
(display (get-identifier symTable 'c))
(newline)
(display "Getting info about identifier a: ")
(display (get-identifier symTable 'a))
(newline)
(display "Getting info about identifier b: ")
(display (get-identifier symTable 'b))
(newline)
(display "Getting info about identifier d: ")
(display (get-identifier symTable 'd))
(newline)
(display "Getting info about identifier x: ")
(display (get-identifier symTable 'x))
(newline)
(table-print symTable)
(newline)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; NOTE: The actual test will test entry into more nested blocks
;;; among several other things!
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Leave inner block
(display "Leaving inner block")
(newline)
(define symTable (exit-block symTable))
(table-print symTable)
(newline)

;;; Get identifiers
(display "Getting info about identifier c: ")
(display (get-identifier symTable 'c))
(newline)
(display "Getting info about identifier a: ")
(display (get-identifier symTable 'a))
(newline)
(display "Getting info about identifier b: ")
(display (get-identifier symTable 'b))
(newline)
(display "Getting info about identifier d: ")
(display (get-identifier symTable 'd))
(newline)
(display "Getting info about identifier x: ")
(display (get-identifier symTable 'x))
(newline)
(table-print symTable)
(newline)
