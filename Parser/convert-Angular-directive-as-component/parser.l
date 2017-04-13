%{
    #include<stdio.h>
    #include "calc_grm.h"
    #define YYSTYPE char*;
    extern YYSTYPE yylval;
%}
imports (import)[a-zA-Z*' ]+;
variable (const)|(let)[a-zA-Z*' ]+;
definition {variable}[ ]?=[a-zA-Z*' ]+;
bindings (scope: {)[a-zA-Z*', ]+},
template (templateUrl:)[a-zA-Z*', ]+,
%%
{imports}  yylval=yytext; return IMPORTS;
export[ ]default[ ]function( return DIRECTIVE_START;
{definition}    return DEFINITION;
{variable}      return VARIABLE;
