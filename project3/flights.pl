/***********************************************************
 * File:         flights.pl
 * Author        Steven Brunwasser, sjb9815
 * Author		 
 * Description:  the flight and airport facts you set up 
 *				 for Task B.
 *
 ************************************************************/

flight(roc, syr, 25).
flight(bos, syr, 40).

layover(roc, 25).
layover(bos, 40).

flight(roc, jfk, 55).
flight(jfk, syr, 50).

layover(jfk, 55).

flight(jfk, bos, 65).
flight(bos, roc, 50).

layover(syr, 30).