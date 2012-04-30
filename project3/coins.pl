/***********************************************************
 * File:         coins.pl
 * Author        Steven Brunwasser, sjb9815
 * Author		 
 * Description:  Find the smallest amount of coins.
 *
 ************************************************************/

/* Definitions for all the coin values */
 pound(Pennies, Amount, Remainder) :- 
 	shilling(Pennies, A1, R1),
 	Amount is A1 // 20, R2 is A1 mod 20, Remainder is R1 + R2.

 shilling(Pennies, Amount, Remainder) :- 
 	Amount is Pennies // 12, Remainder is Pennies mod 12.

 tenner(Pennies, Amount, Remainder) :- 
 	shilling(Pennies, A1, R1),
 	Amount is A1 // 10, R2 is A1 mod 10, Remainder is R1 + R2.

 halfCrown(Pennies, Amount, Remainder) :- 
	Amount is Pennies // 18, Remainder is Pennies mod 18.

 florin(Pennies, Amount, Remainder) :- 
 	shilling(Pennies, A1, R1),
 	Amount is A1 // 2, R2 is A1 mod 2, Remainder is R1 + R2.

sixpence(Pennies, Amount, Remainder) :- 
	Amount is Pennies // 6, Remainder is Pennies mod 6.

joey(Pennies, Amount, Remainder) :- 
	Amount is Pennies // 4, Remainder is Pennies mod 4.

tickie(Pennies, Amount, Remainder) :- 
	Amount is Pennies // 3, Remainder is Pennies mod 3.

tuppence(Pennies, Amount, Remainder) :- 
	Amount is Pennies // 2, Remainder is Pennies mod 2.

copper(Pennies, Amount, Remainder) :- 
	Amount is Pennies // 1, Remainder is Pennies mod 1.

haPenny(0, 0, 0).
haPenny(0.5, 1, 0).
haPenny(0.75, 1, 0.25).
haPenny(0.25, 0, 0.25).

farthing(0, 0, 0).
farthing(0.25, 1, 0).

/* Find the minimal amount of coins that a number of pence can be represented as */
coins(Pennies, Amount) :- 
	Pence is truncate(Pennies), PartPence is Pennies - Pence,
	pound(Pence, A1, R1), tenner(R1, A2, R2), halfCrown(R2, A3, R3), florin(R3, A4, R4),
	shilling(R4, A5, R5), sixpence(R5, A6, R6), joey(R6, A7, R7), tickie(R7, A8, R8),
	tuppence(R8, A9, R9), copper(R9, A10, 0),
	haPenny(PartPence, A11, R11), farthing(R11, A12, 0),
	Amount is A1 + A2 + A3 + A4 + A5 + A6 + A7 + A8 + A9 + A10 + A11 + A12.