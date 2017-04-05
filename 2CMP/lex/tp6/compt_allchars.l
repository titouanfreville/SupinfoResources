%{
    long int nbChar = 0;
%}
%%
.*   {nbChar+= yyleng;}
.|\n {;}
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
    printf("Nb chars in <%s>: %ld \n", argv[1], nbChar);
    return 0;
}
int yywrap()
{
    return 1;
}