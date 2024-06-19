%option noyywrap
%{
	#include<stdio.h>
%}

%%

"a"|"b"                {printf("Es la letra a ó la b ");}
"c"|((("d")*)(e))      {printf("Es la letra c ó la letra(s) d  agregando solo la letra e");}

%%

int main()
{
	yyin=stdin;
	yylex();
	return 0;
}