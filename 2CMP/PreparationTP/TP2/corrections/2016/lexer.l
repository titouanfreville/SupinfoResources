%{
    #include "parser.h"
%}
%option noyywrap
%%
[0-9]  return Nb;
[a-z]  return L;
[ ]    return Sep;
exit   return EXIT;
[(]    return Lb;
[)]    return Rb;
\n     /* don't like whitelines*/
[ \t]+ /* same goes for whitespace*/
.      yyerror(yytext); return ERROR;
%%