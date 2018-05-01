%{
    #include <stdio.h>
    int yylex();
%}
%token A B C
%%
S: A S B | stateB;
stateB: B | stateB stateC | C;
stateC: C;
%%
void yyerror(const char *str)
{
        fprintf(stderr,"lexical error: %s is not in the alphabet\n",str);
}

int main(void)
{
        printf("Exit by typing 'exit'.\n\n");
        yyparse();
        printf("\n");
        return 0;
} 