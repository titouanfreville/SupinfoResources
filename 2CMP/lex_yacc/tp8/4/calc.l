%{
    #include<stdio.h>
    #include "calc_grm.h"
    #define YYSTYPE int;
    extern YYSTYPE yylval;
%}
nombre [0-9]+
signe [=\-+*/()]
%%
{nombre}   yylval=atoi(yytext); return NB;
[=]        return EQUAL;
[-]        return MINUS;
[+]        return ADD;
[*]        return MULT;
[/]        return DIV;
[(]        return LBR;
[)]        return RBR;
(exit)\n   return EXIT;
\n         /* don't like whitelines*/
[ \t]+     /* same goes for whitespace*/
%%