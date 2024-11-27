
%{
#include <stdio.h>
#include <stdlib.h>
%}

%token NUM MUL

%%
linea: expr '\n'       { printf("Expresión válida.\n"); }
     ;

expr: NUM MUL NUM      { printf("Resultado: %d\n", $1 * $3); }
    ;

%%
int main() {
    printf("Ingrese una línea de código:\n");
    return yyparse();
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
    exit(1);
}
