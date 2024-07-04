%option noyywrap

%{
#include <stdio.h>
#include "calc.tab.h"
%}

%%

[0-9]+      { yylval = atoi(yytext); return NUMERO; }
"+"         { return MAS; }
"-"         { return MENOS; }
"*"         { return POR; }
"/"         { return DIVIDIDO; }
"("         { return PARENTESIS_IZQ; }
")"         { return PARENTESIS_DER; }
"evaluar"   { return EVALUAR; }
";"         { return PUNTO_Y_COMA; }
[ \t\n]     { /* Ignorar espacios en blanco */ }
.           { printf("Error léxico: carácter no reconocido %s\n", yytext); }

%%