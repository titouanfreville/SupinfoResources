%{
    #include <stdio.h>
    #include <string.h>
    #include <math.h>
    int yylex();
%}
%token NB ADD MULT MINUS DIV EQUAL LBR RBR EXIT ABS OPPOSE
%%
expr_calcs: expr_calc | expr_calcs expr_calc;
expr_calc: expr_num EQUAL
           {
              printf("%d\n\n", $$);
           } 
           | EXIT {YYACCEPT;} 
           | error '\n' {yyerrok;} 
           | error EQUAL {yyerrok;};
expr_num: facteur 
          | expr_num ADD facteur 
            {
                $$=$1+$3;
            }
          | expr_num MINUS facteur
            {
                $$=$1-$3;
            };
facteur: terme 
        | facteur MULT terme 
          {
                $$=$1*$3;
          }
        | facteur DIV terme;
          {
                $$=$1/$3;
          };
terme: NB { $$=$1;} | LBR expr_num RBR {$$=$2;} | ABS expr_num {$$=fabs($2);}| OPPOSE expr_num {$$=-($2);};
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
        // if (argc != 2){
        // printf("Usage:\t %s FolderToCopy\n", argv[0]);
        // return 1;
        // }
        // yyin=fopen(argv[1],"r");
        // if (yyin==NULL){
        // printf("Cannont open <%s>.\n", argv[1]);
        // return 2;
        // }
        printf("Hello and welcome into Yacc Calculator. Enter your expression using '=' to have the result (spaces unsupported). Exit by typing 'exit'.\n\n");
        yyparse();
        printf("\n");
        return 0;
} 