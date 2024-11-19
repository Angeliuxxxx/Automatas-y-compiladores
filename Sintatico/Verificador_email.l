%option noyywrap
%{
#include <stdio.h>
#include <stdlib.h>
extern FILE *yyin;
%}
IZQ [a-zA-Z0-9._%+-]
DER [a-zA-Z0-9.-]
ARROBA @
DOMINIO \.[a-zA-Z]{2,}
%%
{IZQ}+{ARROBA}{DER}+{DOMINIO}
    printf("Correo electrónico válido: %s\n", yytext);
.|\n    /* Ignorar otros caracteres */
%%
int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "Uso: %s <archivo>\n", argv[0]);
        return 1;
    } 
    FILE *file = fopen(argv[1], "r");
    if (!file) {
        perror("Error al abrir el archivo");
        return 1;
    }
    yyin = file;   
    yylex();
    fclose(file);
    return 0;
}
