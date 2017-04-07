%{
    #include<string.h>
    FILE *out;
    int key = 1;
    char line[10000];
    char store[1];
    int charasint;
%}
%%
[\n] {fprintf(out, "%s\n", line); strcpy(line, ""); line[0]= '\0';}
. {charasint=yytext[0]; store[0]= charasint+key; strcat(line, store);}
%%
int main(int argc, char** argv)
{
    char* output_file_name;
    if (argc < 3 || argc > 4){
        printf("Usage:\t %s FolderToCopy [WhereToCopy] [cryptkey]\n", argv[0]);
        return 1;
    }
    yyin=fopen(argv[1],"r");
    out=fopen(argv[2], "w");
    if (argc==4) {
        key=atoi(argv[3]);
    }
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