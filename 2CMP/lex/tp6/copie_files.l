%{
    #include<string.h>
    FILE *out;
    char line[10000];
%}
%%
[\n] {fprintf(out, "%s\n", line); strcpy(line, ""); line[0]= '\0';}
.* {strcpy(line, yytext);}
%%
int main(int argc, char** argv)
{
    if (argc != 3){
        printf("Usage:\t %s FolderToCopy WhereToCopy\n", argv[0]);
        return 1;
    }
    yyin=fopen(argv[1],"r");
    out=fopen(argv[2], "w");
    if (yyin==NULL){
        printf("Cannont open <%s>.\n", argv[1]);
        return 2;
    }
    if (out==NULL){
        printf("Cannont create or open <%s>.\n", argv[2]);
        return 3;
    }
    yylex();
    printf("\n");
    return 0;
}
int yywrap()
{
    return 1;
}