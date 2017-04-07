%{
    #include <stdio.h>
    #include <string.h>
%}
%token NB ADD MULT MINUS DIV EQUAL LBR RBR
%%
expr_calcs: expr_calc | expr_calcs expr_calc;
expr_calc: expr_num EQUAL;
expr_num: facteur | expr_num ADD facteur | expr_num MINUS facteur;
facteur: terme | facteur MULT terme | facteur DIV terme;
terme: NB | LBR expr_num RBR;
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
        yyparse();
} 