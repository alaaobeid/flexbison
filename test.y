
%{
#include <stdio.h>

int yylex();
int yyerror(char *s);

%}

%token WORD CHAR NUM SEMICOLON OPENCURL CLOSECURL COMMA PLUS MINUS EQUAL SINGLE_QUOTE DOUBLE_QUOTE EXCL
%token IF "if"
%token NOT_EQUAL_TO "!="
%token EQUAL_TO "=="
%token OPEN "("
%token CLOSE ")"
%token DOT "."
%token AND "&&"
%token OR "||"
%token GREAT_EQ ">="
%token LESS_EQ "<="
%token SPACE "\t"
%token NEWLINE "\n"
%type <name> WORD
%type <number> NUM
%type <name> CHAR


%union{
	  char name[20];
    int number;
    char symbol;
}

%%

prog:
  letters
  ifstmts
;

ifstmts:
		| IF OPEN letters op |ifstmts letters | NEWLINE ifstmts | SPACE ifstmts | letters ifstmts
	
op:
		EQUAL_TO {
				printf("!=");
				}
		| NOT_EQUAL_TO {
				printf("!=");
				}
		| AND {
				printf("||");
				}
		| OR {
				printf("&&");
				}
		| GREAT_EQ{
				printf("<=");
				}
		| LESS_EQ{
				printf(">=");
				}
;
letters:
		| letter letters | letters letter | letter op | op letter
letter:
		WORD{
				printf("%s",$1);
				}
		| NUM{
				printf("%d",$1);
				}
		| DOT{
				printf(".");}
		| CLOSE{
				printf(")");}
		| IF{
				printf("if");}
		| OPEN{
				printf("(");}
		| SPACE{
				printf(" ");}
		| OPENCURL{
				printf("{");}
		|CLOSECURL{
				printf("}");}
		|COMMA{
				printf(",");}
		|NEWLINE{
				printf("\n");}
		|SEMICOLON{
				printf(";");}
		|PLUS{
				printf("+");}
		|MINUS{
				printf("-");}
		|EQUAL{
				printf("=");}
		|SINGLE_QUOTE{
				printf("'");}
		|DOUBLE_QUOTE{
				printf("\"");}
		|EXCL{
				printf("!");}
				
;
%%

int yyerror(char *s)
{
	printf("Syntax Error on line %s\n", s);
	return 0;
}

int main()
{
    yyparse();
    return 0;
}
