 /********************************************************************************************
 * File:	$Id: regitcod.l,v 1.2 2012/04/08 21:47:29 ejp6914 Exp ejp6914 $
 * Author:	Rajendra K. Raj, rkr
 * Author:	STUDENT NAME, STUDENT UNIX ID.
 * Description:	A simple flex/lex file for a rudimentary calculator
 * Revision History:
 *      $Log: regitcod.l,v $
 *      Revision 1.2  2012/04/08 21:47:29  ejp6914
 *      Ready to turn in
 *
 *      Revision 1.1  2012/04/08 21:17:39  ejp6914
 *      Initial revision
 *
 *      Revision 1.1  2012/03/27 22:01:41  rkr
 *      Initial revision
 *
 *******************************************************************************************/
	
%{
#include <stdlib.h>
#include "regitcod.h"
%}

%%
[0-9]+			{ yylval.dvalue = atof((char *)yytext); 
                          return NUMBER; 
                        }
"PROGRAM"		{ return PROGRAM; }
"START"			{ return START; }
"END"			{ return END; }
"ABS"			{ return ABS; }
"SQRT"			{ return SQRT; }
"SHOW"			{ return SHOW; }
"."			{ return END_STATEMENT; }
"="			{ return EQUALS; }
"+"			{ return PLUS; }
"-"			{ return MINUS; }
"*"			{ return TIMES; }
"/"			{ return DIVIDE; }
"("			{ return LPAREN; }
")"			{ return RPAREN; }
[a-zA-Z]+               { strcpy(yylval.identifier, yytext);
			  return IDENTIFIER;
                        }
[ \t]                   ;
\n|.                    { return yytext[0]; 
                        }
%%

int yywrap() {
   return 1;
}
