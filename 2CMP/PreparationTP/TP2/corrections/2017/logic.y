%{
    #include <stdio.h>
    #include <string.h>
    #include <math.h>

    #define RED   "\x1B[31m"
    #define GRN   "\x1B[32m"
    #define YEL   "\x1B[33m"
    #define BLU   "\x1B[34m"
    #define MAG   "\x1B[35m"
    #define CYN   "\x1B[36m"
    #define WHT   "\x1B[37m"
    #define RESET "\x1B[0m"


    int yylex();
%}
%token VAL AND OR LBR EQ RBR
%%
logicExprs: logicExpr logicExprs | logicExpr;

logicExpr: operations EQ {printf("Logic Value : %d\n", $1);}
          | error '\n' {YYABORT;}
          | error EQ {YYABORT;};

operations: opFact AND operations {$$=$1*$3;}
             | opFact OR operations {$$=($1|$3);}
             | opFact;

opFact: LBR operations RBR {$$=$2;}
      | VAL OR operations {$$=($1|$3);}
      | VAL AND operations {$$=$1*$3;}
      | VAL {$$=$1;};
%%
void yyerror(const char *str)
{
  extern int nbLine;
  printf("%sFatal - syntaxe error line (%d): %s.\n",RED,nbLine,str, RESET);
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
        int r = 0;
        printf("Hello and welcome into Yacc Logical Calculator. Enter your expression using '=' to have the result (spaces unsupported).\n\n");
        r=yyparse();
        printf("\n");
        return r;
} 