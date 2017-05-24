%{
    #include <stdio.h>
    #include <string.h>
    #include <math.h>
    int yylex();
%}
%token Nb L Sep EXIT Lb Rb ERROR
%%
Ss: S Ss | S;

S: liste
 | atome
 | EXIT {YYACCEPT;}
 | ERROR {yyerrok;}
 | error {YYABORT;};

liste: Lb S Rb {printf("Liste\n");}
     | Lb S Rb liste {printf("Liste ");};

atome: Nb {printf("Nombre\n");}
     | Sep {printf("Séparateur\n");}
     | L {printf("Lettre\n");};
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