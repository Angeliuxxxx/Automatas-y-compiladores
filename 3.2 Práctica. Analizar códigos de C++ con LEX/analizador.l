%{
#include <stdio.h>
#include <string.h>

int comment_count = 0;
%}

%%

/* Palabras reservadas de C++ */
"auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|
"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"int"|"long"|"register"|
"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|
"union"|"unsigned"|"void"|"volatile"|"while"|"class"|"public"|"private"|
"protected"|"template"|"typename"|"using"|"namespace"|"virtual"|"this"|
"try"|"catch"|"new"|"delete"|"operator"|"bool"|"true"|"false"|"inline" {
    printf("Palabra reservada: %s\n", yytext);
}

/* Comentarios */
"//".* { 
    comment_count++;
    printf("Comentario de una línea encontrado.\n");
}
"/*"([^*]|\*+[^/])*"*/" {
    comment_count++;
    printf("Comentario de múltiples líneas encontrado.\n");
}

/* Identificación de nombres de variables */
[a-zA-Z_][a-zA-Z0-9_]* {
    printf("Variable: %s\n", yytext);
}

/* Constantes numéricas */
[0-9]+ {
    printf("Constante numérica: %s\n", yytext);
}

/* Operadores aritméticos */
"+"|"-"|"*"|"/"|"%" {
    printf("Operador aritmético: %s\n", yytext);
}

/* Operadores lógicos */
"&&"|"||"|"!" {
    printf("Operador lógico: %s\n", yytext);
}

/* Símbolos especiales */
"{"|"}"|"["|"]"|"("|")"|";"|","|"."|":" {
    printf("Símbolo especial: %s\n", yytext);
}

/* Ignorar espacios y nuevas líneas */
[ \t\n]+ { /* No hacer nada */ }

/* Cualquier otro carácter desconocido */
. {
    printf("Carácter desconocido: %s\n", yytext);
}

%%

int main(int argc, char **argv) {
    if (argc != 2) {
        printf("Uso: %s <archivo_c++>\n", argv[0]);
        return 1;
    }

    FILE *archivo = fopen(argv[1], "r");
    if (!archivo) {
        printf("Error al abrir el archivo %s\n", argv[1]);
        return 1;
    }

    yyin = archivo;
    yylex();
    fclose(archivo);

    printf("\n--- Resumen ---\n");
    printf("Comentarios encontrados: %d\n", comment_count);

    return 0;
}
