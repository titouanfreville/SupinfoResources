%{
   int nbMot = 0; 
%}
maj[A-Z]
min[a-z]
sepliant[-_.]
mot({maj}?{min}({min}*{sepliant}?{min}*)*)
%%
{mot}  nbMot ++;
.|\n
%%
int main(int argc, char** argv)
{
    if (argc != 2){
        printf("Usage:\t %s FolderToCopy\n", argv[0]);
        return 1;
    }
    yyin=fopen(argv[1],"r");
    if (yyin==NULL){
        printf("Cannont open <%s>.\n", argv[1]);
        return 2;
    }
    yylex();
    printf("Nb nbMot in <%s>: %d. \n", argv[1], nbMot);
    return 0;
}
int yywrap()
{
    return 1;
}