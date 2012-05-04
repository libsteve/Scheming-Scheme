/***********************************************************
 * File:         routes.pl
 * Author        Steven Brunwasser, sjb9815
 * Author	 Ethan Peters, ejp6914
 * Author	 Peter Mikitsh, pam3961	 
 * Description:  the rules you developed to meet the routing 
 *				 requirements for Task B.
 *
 ************************************************************/

/* start, destination, routing, duration */
route(X, Y, R, D) :- 
	X \= Y,
	flight(X, Y, D1),
	D is D1, R = [X, Y].
route(X, Y, R, D) :-
       	X \= Y,	
	flight(X, A, D1), route(A, Y, R1, D2), layover(A, L1),
	notin(X, R1),
	D is D1 + D2 + L1, R = [X | R1].

/* make sure that the given element is not in the given list */
notin(_, []) :- true.
notin(Elm, [Elm | _]) :- false.
notin(Elm, [H | T]) :- H \= Elm, notin(Elm, T).
