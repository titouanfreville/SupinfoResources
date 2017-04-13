%{
    #include <stdio.h>
    #include <string.h>
    #include <math.h>
    int yylex();
%}
%token NB ADD MULT MINUS DIV EQUAL LBR RBR EXIT OPPOSE
%%
exprs: expr | exprs expr;
expr:   
        calc EQUAL {printf("%d\n\n", $$);} |
        EXIT {YYACCEPT;} |
        error '\n' {yyerrok;} | 
        error EQUAL {yyerrok;};

calc:
        term |
        expr ADD term {$$=$1+$3;} |
        expr MINUS term {$$=$1-$3;} |
        expr MULT term {$$=$1*$3;} |
        expr DIV term {$$=$1/$3;};
term: 
        OPPOSE expr {$$=-$2;} |
        LBR expr RBR {$$=$2;} |
        NB {$$=$1;};

%%
void yyerror(const char *str)
{
        fprintf(stderr,"error: %s\n",str);
}

int yywrap(void)
{
        return 1;
} 

int main(void)
{
        printf("Hello and welcome into Yacc Calculator. Enter your expression using '=' to have the result (spaces unsupported). Exit by typing 'exit'.\n\n");
        yyparse();
        printf("\n");
        return 0;
} 