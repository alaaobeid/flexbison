%{

#include <stdio.h>
#include <string.h>
#include "test.tab.h"
void showError();
%}



%%
"if"  { return IF; }
"("  { return OPEN; }
")"  { return CLOSE; }
"=="  { return EQUAL_TO; }
"!="  { return NOT_EQUAL_TO; }
"&&"  { return AND; }
"||"  { return OR; }
">="  { return GREAT_EQ; }
"<="  { return LESS_EQ; }
"."  {return DOT;}
[ \t\r\f]+  {return SPACE;}
"{" {return OPENCURL;}
"}" {return CLOSECURL;}
[a-zA-Z]+			   {sscanf(yytext, "%s", yylval.name); return (WORD);}
[0-9]+      {yylval.number = atoi(yytext); return (NUM);}
"," {return COMMA;}
";" {return SEMICOLON;}
"+" {return PLUS;}
"-" {return MINUS;}
"=" {return EQUAL;}
["] {return DOUBLE_QUOTE;}
['] {return SINGLE_QUOTE;}
"!" {return EXCL;}

\n 	{return NEWLINE;}
%%


void showError(){
    printf("Other input");
}


