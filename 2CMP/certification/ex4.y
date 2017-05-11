%{
    #include <stdio.h>
    #include <string.h>
    int yylex();
%}
%token ta tb tc td
%%
A: A | C | ta | A ta A td;
C: tb C | tb;
B: tc | B tc;
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
        printf("\n");
        return 0;
} 