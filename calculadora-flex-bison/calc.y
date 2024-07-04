%{
#include <stdio.h>
#include <stdlib.h>

extern int yylex();
extern char* yytext;
void yyerror(const char* s);
%}

%token NUMERO MAS MENOS POR DIVIDIDO PARENTESIS_IZQ PARENTESIS_DER EVALUAR PUNTO_Y_COMA

%%

programa: 
    | programa declaracion
    ;

declaracion: EVALUAR PARENTESIS_IZQ expresion PARENTESIS_DER PUNTO_Y_COMA { printf("resultado=%d\n", $3); }
    ;

expresion: expresion MAS termino   { $$ = $1 + $3; }
    | expresion MENOS termino      { $$ = $1 - $3; }
    | termino                      { $$ = $1; }
    ;

termino: termino POR factor        { $$ = $1 * $3; }
    | termino DIVIDIDO factor      { 
        if ($3 == 0) {
            yyerror("Error: División por cero");
            exit(1);
        }
        $$ = $1 / $3; 
    }
    | factor                       { $$ = $1; }
    ;

factor: NUMERO                     { $$ = $1; }
    | PARENTESIS_IZQ expresion PARENTESIS_DER { $$ = $2; }
    ;

%%

void yyerror(const char* s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    yyparse();
    return 0;
}