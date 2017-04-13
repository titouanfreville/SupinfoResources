%{
    int nbPOuv = 0;
    int nbPFem = 0;
    int nbOpp = 0;
    int nbVar = 0;
%}
space[ ]
chiffre[0-9]
op[+*-/]
notvalid[^ 0-9+*-/()\n]
%%
\( nbPOuv++;
\) nbPFem++;
{notvalid} printf("Error: Symbol <%s> is not valid\n", yytext);
{op}       nbOpp++;
{chiffre}  nbVar++;
[\n] {
        if (nbPOuv != nbPFem) {
            printf("Error: Parenthèse are not matched\n"); 
        } else 
        if (nbOpp > (nbVar-1)) {
            printf("Error: More opperators than opperand\n");
        } else
        if (nbOpp < (nbVar-1)) {
            printf("Error: More opperand than opperators\n");
        } else {
            printf ("Line ok \n");
        }
        nbPFem=0; nbPOuv=0; nbVar=0; nbOpp=0;
    }
.|\n
%%
int main(int argc, char** argv)
{
    if (argc != 2){
        printf("Usage:\t %s FolderToAnalyse\n", argv[0]);
        return 1;
    }
    yyin=fopen(argv[1],"r");
    if (yyin==NULL){
        printf("Cannont open <%s>.\n", argv[1]);
        return 2;
    }
    yylex();
    printf("\n");
    return 0;
}
int yywrap()
{
    return 1;
}