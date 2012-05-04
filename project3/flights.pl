/***********************************************************
 * File:         flights.pl
 * Author        Steven Brunwasser, sjb9815
 * Author	 Ethan Peters, ejp6914
 * Author	 Peter Mikitsh, pam3961	 
 * Description:  the flight and airport facts you set up 
 *				 for Task B.
 *
 ************************************************************/

flight(roc, syr, 25).
flight(bos, syr, 40).
flight(roc, jfk, 55).
flight(jfk, syr, 50).
flight(jfk, bos, 65).
flight(bos, roc, 50).

layover(roc, 25).
layover(bos, 40).
layover(jfk, 55).
layover(syr, 30).
