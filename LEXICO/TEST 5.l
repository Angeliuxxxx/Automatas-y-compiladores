%option noyywrap
%{
#include<stdio.h>
%}
%%
[\n\t];
[a-Az-Z]{4}[0-9]{6}[a-zA-Z0-9]{3}+ {printf("CURP V�lido:\n");}
.|\n {printf("Formato no v�lido:\n"}
%%
int main(){
printf("Ingrese el CURP:\n");
yylex();return 0;
}