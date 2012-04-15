/********************************************************************************************
 * File:	$Id: regitcod.y,v 1.2 2012/04/08 21:47:35 ejp6914 Exp ejp6914 $
 * Author:	Rajendra K. Raj, rkr
 * Author:	STUDENT NAME, STUDENT UNIX ID.
 * Description:	A simple yacc/bison file for a rudimentary calculator
 * Revision History:
 *      $Log: regitcod.y,v $
 *      Revision 1.2  2012/04/08 21:47:35  ejp6914
 *      Ready to turn in
 *
 *      Revision 1.1  2012/04/08 21:17:44  ejp6914
 *      Initial revision
 *
 *      Revision 1.1  2012/03/27 22:01:41  rkr
 *      Initial revision
 *
 *******************************************************************************************/

%{ 
#include <stdio.h>
#include <stdlib.h>  // often required 
#include <string.h>

// A simple error message to move things along
void yyerror(const char *msg)
{
      printf("ERROR(PARSER): %s\n", msg);
}

// Storage for variables: yes Virginia, only 26 variables possible in this language!
double variables[50];
char program_name[100];
%}

%union {
	double dvalue;
	int varindex;
	char identifier[41];
}

%token <dvalue> NUMBER
%token <varindex> NAME

%token <dvalue> PROGRAM
%token <dvalue> START
%token <dvalue> END
%token <dvalue> ABS
%token <dvalue> SQRT
%token <dvalue> SHOW
%token <dvalue> END_STATEMENT
%token <dvalue> EQUALS
%token <dvalue> PLUS
%token <dvalue> MINUS
%token <dvalue> TIMES
%token <dvalue> DIVIDE
%token <dvalue> LPAREN
%token <dvalue> RPAREN
%token <identifier> IDENTIFIER

%type <dvalue> expr
%type <dvalue> term
%type <dvalue> varOrNum
%%
program : programOpeningStatement statementList programClosingStatement
	| programOpeningStatement programClosingStatement
	;

statementList : statement '\n' 
              | statement '\n' statementList	      
              ;

programOpeningStatement : PROGRAM IDENTIFIER END_STATEMENT '\n' START END_STATEMENT '\n'
								{ printf("PGRM %s\n", $2);
								  printf("FLSH\n");
								  strcpy(program_name, $2); }
			;

programClosingStatement : END END_STATEMENT '\n' { printf("FLSH\n");
						   printf("ENDP %s\n", program_name); }
			;

statement : assignmentTarget EQUALS expr END_STATEMENT	{ printf("STOR\n"); }
	  | expr END_STATEMENT			{  }
          ;

expr: expr PLUS term		{ printf("PLUS\n"); }
    | expr MINUS term		{ printf("MINU\n"); }
    | term			{  }
    ;

term : term TIMES varOrNum	{ printf("TIMS\n"); }
     | term DIVIDE varOrNum	{ printf("DIVD\n"); }
     | ABS LPAREN expr RPAREN	{ printf("ABS\n"); }
     | SQRT LPAREN expr RPAREN	{ printf("SQRT\n"); }
     | SHOW LPAREN expr RPAREN	{ printf("PRNT\n"); }
     | varOrNum                 {  }
     ;

varOrNum : NUMBER		{ printf("SIMM %f\n", $1); }
	 | IDENTIFIER		{ printf("SVAL %s\n", $1); }
         ;

assignmentTarget : IDENTIFIER	{  printf("SADR %s\n", $1); }
		 ;

%%

main() {
        yyparse();
}

