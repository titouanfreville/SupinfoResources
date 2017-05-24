%{
    #include <stdio.h>
    #include <string.h>
    int yylex();
%}
%token NB ADD MULT MINUS DIV EQUAL LBR RBR EXIT
%%
expr_calcs: expr_calc | expr_calcs expr_calc;
expr_calc: expr_num EQUAL
           {
                printf("EQUAL\n");
           } | EXIT {YYACCEPT;};
expr_num: facteur 
          | expr_num ADD facteur 
            {printf("ADD\n");}
          | expr_num MINUS facteur
            {printf("MINUS\n");};
facteur: terme 
        | facteur MULT terme 
          {printf("MULT\n");}
        | facteur DIV terme
          {printf("DIV\n");};
terme: NB {printf("Nb = %d \n", $1);} | LBR expr_num RBR {printf("BRACKETS\n");};
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
        yyparse();
        printf("\n");
        return 0;
} 