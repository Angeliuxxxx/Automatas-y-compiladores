
%{
#include "y.tab.h"
%}

%%

[0-9]+          { return NUM; }
"*"             { return MUL; }
[ \t\n]         ;  // Ignorar espacios y saltos de línea
.               { return yytext[0]; }  // Cualquier otro carácter

%%
int yywrap() { return 1; }
