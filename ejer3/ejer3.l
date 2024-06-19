%option noyywrap
%{
#include<stdio.h>
%}

/*
Desarrollar un analizador que permita:
Cuando ejecutemos e ingresamos los datos de entrada, en este caso será:

if ( x > 5 ) { y = 10 ; } else { y = 20 ; }

Obtendremos como salida:

parabra clave 'if'
caracter no reconocido: (
caracter no reconocido: x
caracter no reconocido: >
numero entero: 5
caracter no reconocido: )
parabra clave 'else'
caracter no reconocido: {
*/

%%

"if" {printf("palabra clave 'if'\n");}
"else" {printf("palabra clave 'else'\n");}

"(" {printf("caracter no reconocido: (\n");}
")" {printf("caracter no reconocido: )\n");}
"{" {printf("caracter no reconocido: {\n");}


"x" {printf("caracter no reconocido: x\n");}
">" {printf("caracter no reconocido: >\n");}
"5" {printf("numero entero: 5\n");}

%%

int main()
{
yyin=stdin;
yylex();
return 0;
}
