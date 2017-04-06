%{
    int pMisMatched = 0;
    char buffer[10000] = "";
%}
space[ ]
chiffre[0-9]
op[+*-/]
notvalid[^ 0-9+*-/()\n]
%s Operator Numbers Final
%%
<INITIAL>\(           {strcat(buffer, yytext); pMisMatched++; BEGIN(INITIAL);}
<Numbers>\)           {strcat(buffer, yytext); pMisMatched--; if (pMisMatched == 0) {BEGIN(FINAL)};}
<Operator>{op}{space}\(        {strcat(buffer, yytext); BEGIN(Operator);}
<Numbers>{chiffre}    {;}
[\n]
{notvalid}            {printf("Error: Symbol <%s> is not valid in expression: <%s> \n", yytext, buffer); strcpy(buffer,""); pMisMatched=0; BEGIN(INITIAL);};
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