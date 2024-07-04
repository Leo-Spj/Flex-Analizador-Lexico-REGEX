%option noyywrap
%{
#include<stdio.h>
%}

/*
Desarrollar un analizador que permita ingresar:
0 y  1  y arroje un mensaje cero/uno
Ingresar dígitos y arroje un mensaje NUMERO ENTERO
MINUSCULA Y arroje un mensaje PALABRA MINUSCULA
MAYUSCULA Y arroje un mensaje PALABRA MAYUSCULA
Puede recibir la letras e ó puede recibir una ó mas letras f
Puede recibir dos letras, la a ó b
*/

%%

[0-1]+           { printf("Cero/Uno\n"); }
[0-9]*     { printf("NUMERO ENTERO\n"); }
e               { printf("Letra e\n"); }
f+              { printf("Una o más letras f\n"); }
(a|b){2}        { printf("Dos letras, a o b\n"); }
[a-z]+          { printf("PALABRA MINUSCULA\n"); }
[A-Z]+          { printf("PALABRA MAYUSCULA\n"); }


%%

int main()
{
    yyin = stdin;
    yylex();
    return 0;
}