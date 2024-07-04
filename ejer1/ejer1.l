%option noyywrap
%{
	#include<stdio.h>
%}

/*
Puede recibir la letras e ó puede recibir una ó mas letras f
Puede recibir dos letras, la a ó b
*/

DIGITOS [0-9]+
MINISCULAS [a-z]+
MAYUSCULAS [A-Z]+

%%
(a|b){2} 		{printf("Letra a o b repetida 2 veces");}
"e"|"f"+ 		{printf("Letra e o f repetida 1 o mas veces");}
"0"|"1" 		{printf("CERO/UNO");}
{DIGITOS} 		{printf("Numero Entero");}
{MINISCULAS} 	{printf("Letra(s) Minuscula(s)");}
{MAYUSCULAS} 	{printf("Letra(s) Mayuscula(s)");}

%%

int main()
{
	yyin=stdin;
	yylex();
	return 0;
}