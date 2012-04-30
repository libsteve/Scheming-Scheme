/***********************************************************
 * File:         routes.pl
 * Author        Steven Brunwasser, sjb9815
 * Author		 
 * Description:  the rules you developed to meet the routing 
 *				 requirements for Task B.
 *
 ************************************************************/

/* start, destination, routing, duration */
route(X, Y, R, D) :- 
	flight(X, Y, D1), layover(X, L1), layover(Y, L2),
	D is D1 + L1 + L2, R is [X, Y].
route(X, Y, R, D) :- 
	flight(X, A, D1), route(A, Y, R1, D2), layover(X, L1),
	notin(X, R1),
	D is D1 + D2 + L1, R is [X | R1].

/* make sure that the given element is not in the given list */
notin(_, []) :- true.
notin(Elm, [Elm | _]) :- false.
notin(Elm, [_ | T]) :- find(Elm, T).