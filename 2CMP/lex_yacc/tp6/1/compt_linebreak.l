%{
   int lineBreak = 0; 
%}
%%
["\n"] lineBreak++;
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
    printf("Nb lineBreak in <%s>: %d. \n", argv[1], lineBreak);
    return 0;
}
int yywrap()
{
    return 1;
}