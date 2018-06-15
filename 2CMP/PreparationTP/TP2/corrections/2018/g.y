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
%token S D Z One Two A
%%
sExpr:    zExpr
        | S dExpr;
zExpr: Z;
dExpr: bExpr | dExpr D | sExpr;
bExpr: One | Two | A | bExpr dExpr;
%%
int yyerror(const char *str)
{
  extern int nbLine;
  printf("%sFatal - syntaxe error line (%d): %s.\n",RED,nbLine,str, RESET);
  return nbLine;
}


int main(int argc, char** argv)
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
        r=yyparse();
        printf("\n");
        return r;
} 