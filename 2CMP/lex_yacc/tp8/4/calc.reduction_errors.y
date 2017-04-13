%{
    #include <stdio.h>
    #include <string.h>
    #include <math.h>
    int yylex();
%}
%token NB ADD MULT MINUS DIV EQUAL LBR RBR EXIT OPPOSE
%%
expr: 
        expr ADD expr {$$=$1+$3;} |
        expr MINUS expr {$$=$1-$3;} |
        MINUS expr {$$=-$2;} |
        LBR expr RBR {$$=$2;} |
        expr MULT expr {$$=$1*$3;} |
        expr DIV expr {$$=$1/$3;} |
        NB { $$=$1;} |
        expr EQUAL {printf("%d\n\n", $$);} |
        EXIT {YYACCEPT;} |
        error '\n' {yyerrok;} |
        error EQUAL {yyerrok;};
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