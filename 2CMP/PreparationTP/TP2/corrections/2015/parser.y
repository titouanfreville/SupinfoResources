%{
    #include <stdio.h>
    int yylex();
%}
%token Nb L Var Comp Inc Eq LAcc RAcc Sep
%token BoucStart CondConcat ActStart BoucEnd
%token EXIT ERROR
%%
Exprs: Expr Exprs | Expr;

Expr: BoucStart GlCond ActStart Actions BoucEnd {printf("Accepted\n");}
    | EXIT {YYACCEPT;}
    | ERROR {yyerrok;}
    | error {YYABORT;};

GlCond: Cond | Cond CondConcat Cond;

Cond: LAcc Var Comp Nb RAcc;

Actions: LAcc A1 Sep A2 Sep RAcc;

A1: Var Eq Nb;

A2: L Inc Inc;

%%
void yyerror(const char *str)
{
        fprintf(stderr,"lexical error: %s is not in the alphabet\n",str);
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
        int r;
        printf("Exit by typing 'exit'.\n\n");
        r = yyparse();
        printf("\n");
        return r;
} 