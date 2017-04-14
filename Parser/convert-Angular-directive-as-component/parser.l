%{
    #include<stdio.h>
    #include "grammar.h"
%}
imports (import)[a-zA-Z*' ]+;
variable (const)|(let)[a-zA-Z*' ]+;
definition {variable}[ ]?=[a-zA-Z*' ]+;
bindings (scope:[ ]\{)[a-zA-Z*', ]+\},
template (templateUrl:)[a-zA-Z*', ]+,
args ([a-zA-Z]+,)*\)[ ]?\{
funcstart (function[ ][a-zA-Z]+[ ]?\()|(scope\.)?[a-zA-Z]+[ ]?=[ ]?function\(
instruction [^;]+;\n
%%
{imports}                     yylval.str=yytext; return IMPORTS;
export[ ]default[ ]function\( return DIRECTIVE_START;
return[ ]\{                   return DIRECTIVE_OBJECT;
{definition}                  yylval.str=yytext; return DEFINITION;
{variable}                    yylval.str=yytext; return VARIABLE;
{bindings}                    yylval.str=yytext; return BINDINGS;
{template}                    yylval.str=yytext; return TEMPLATE;
link[ ]?\(scope,              return LINK;
{funcstart}                    yylval.str=yytext; return METHODE;
{args}                        yylval.str=yytext; return ARGS;
\};                           return EOM;
{instruction}                 yylval.str=yytext; return ACTIONS;
.|\n                          /**/
