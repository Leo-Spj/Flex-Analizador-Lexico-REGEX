%option noyywrap
%{
#include <stdio.h>
%}

cuerpo [a-zA-Z0-9._%+-]+
arroba @
dominio [a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}

%%

{cuerpo}{arroba}{dominio}  { printf("Email valido\n"); }
.+                         { printf("Email invalido\n"); }

%%

int main()
{
    yyin = stdin;
    yylex();
    return 0;
}