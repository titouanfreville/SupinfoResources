%{
    #include "parser.h"
%}
%option noyywrap
%%
[0-9]+     return Nb;
TANTQUE    return BoucStart;
ET         return CondConcat;
FAIRE      return ActStart;
FINTANTQUE return BoucEnd;
exit       return EXIT;
[a-zA-Z]   return L;
[a-zA-Z]+  return Var;
[<>]       return Comp;
[+]        return Inc;
[=]        return Eq;
[{]        return LAcc;
[}]        return RAcc;
[;]        return Sep;
\n         /* don't like whitelines*/
[ \t]+     /* same goes for whitespace*/
.          yyerror(yytext); return ERROR;
%%