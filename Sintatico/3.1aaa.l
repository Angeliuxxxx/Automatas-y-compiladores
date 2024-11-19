%option noyywrap
%{
#include <stdio.h>
#include <stdlib.h>
%}
DIGIT [0-9]
OPERATOR [+*/-]
%%
{DIGIT}+    printf("Número: %s\n", yytext);
{OPERATOR}  printf("Operador: %s\n", yytext);
.         
%%
int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "Uso: %s <archivo>\n", argv[0]);
        return 1;
    }
    FILE *file = fopen(argv[1], "r");
    if (!file) {
        perror("Error al abrir");
        return 1;
    }
    yyin = file;
    yylex();
    fclose(file);
    return 0;
}
