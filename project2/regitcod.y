/********************************************************************************************
 * File:	$Id: regitcod.y,v 1.2 2012/04/08 21:47:35 ejp6914 Exp ejp6914 $
 * Author:	Rajendra K. Raj, rkr
 * Author:	Steven Brunwasser, sjb9815
 *		Ethan Peters, ejp6914
 *		Peter Mikitsh, pam3961
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
char symbol_table[51][41];
int number_of_identifiers;
int number_of_output_characters;
void handle_output_size(int numChars)
{
	number_of_output_characters += numChars;
	if (number_of_output_characters > 10000)
	{
		printf("Error: Too many characters in output\n");
		exit(-1);
	}

}
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
			{ number_of_output_characters += 8 + strlen($2);
			  printf("PGRM %s\n", $2);
			  printf("FLSH\n");
			  strcpy(program_name, $2); }
			;

programClosingStatement : END END_STATEMENT '\n' { handle_output_size(8 + strlen(program_name));
						   printf("FLSH\n");
						   printf("ENDP %s\n", program_name); }
			;

statement : assignmentTarget EQUALS expr END_STATEMENT	{ printf("STOR\n"); }
	  | expr END_STATEMENT			{  }
          ;

expr: expr PLUS term		{ handle_output_size(4);				  
				  printf("PLUS\n"); }
    | expr MINUS term		{handle_output_size(4);	
				 printf("MINU\n"); }
    | term			{  }
    ;

term : term TIMES varOrNum	{ handle_output_size(4);	
     				  printf("TIMS\n"); }
     | term DIVIDE varOrNum	{ handle_output_size(4);	
				  printf("DIVD\n"); }
     | ABS LPAREN expr RPAREN	{ handle_output_size(4);	
				  printf("ABS\n"); }
     | SQRT LPAREN expr RPAREN	{ handle_output_size(4);	
				  printf("SQRT\n"); }
     | SHOW LPAREN expr RPAREN	{ handle_output_size(4);	
				  printf("PRNT\n"); }
     | varOrNum                 {  }
     ;

varOrNum : NUMBER		{ handle_output_size(4);	
	 			  printf("SIMM %f\n", $1); }
	 | IDENTIFIER		{ handle_output_size(4);	
				  printf("SVAL %s\n", $1); }
         ;

assignmentTarget : IDENTIFIER	{ //search the symbol table for the identifier
				  int i;
				  for ( i = 0; i < number_of_identifiers; i++)
				  {
					if (strcmp(symbol_table[i], $1) == 0)
					{
						break;
					}
				  }
				  if (i == number_of_identifiers)
				  {
					if (i == 51)
					{
						printf("Error: Too many identifiers\n");
						exit(-1);
					}
					//new variable
					strcpy(symbol_table[i], $1);
					number_of_identifiers++;
				  }
				  printf("SADR %s\n", $1); }
		 ;

%%

main() {
	number_of_output_characters = number_of_identifiers = 0;
        yyparse();
}

