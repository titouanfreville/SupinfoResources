%{
    int pMisMatched = 0;
    int nOp = 0;
    int nNb = 0;
    char buffer[10000] = "";
%}
space[ ]
chiffre[0-9]
op[+*-/]
notvalid[^ 0-9+*-/()\n]
%s Operator Numbers FINAL
%%
<INITIAL>\(              {strcat(buffer, yytext); strcat(buffer, " "); pMisMatched++; BEGIN(INITIAL);}
<INITIAL>{op}            {strcat(buffer, yytext); strcat(buffer, " "); nOp++; BEGIN(Operator);}
<INITIAL>{chiffre}.*[\n] {printf("Error: Missing operator in <%s>\n", buffer); strcpy(buffer,""); pMisMatched=0; nOp=0; nNb=0; BEGIN(INITIAL);}
<Operator>{chiffre}      {strcat(buffer, yytext); strcat(buffer, " "); nNb++;BEGIN(Numbers);}
<Operator>\(             {strcat(buffer, yytext); strcat(buffer, " "); pMisMatched++; BEGIN(INITIAL);}
<Numbers>{chiffre}       {strcat(buffer, yytext); strcat(buffer, " "); nNb++;}
<Numbers>\(              {strcat(buffer, yytext); strcat(buffer, " "); pMisMatched++; BEGIN(INITIAL);}
<Numbers>\)              {strcat(buffer, yytext); strcat(buffer, " "); pMisMatched--; if(pMisMatched==0){BEGIN(FINAL);};}
<FINAL>[\n]              { if (nOp > nNb -1){
                                printf("Error: Expression <%s> is not valid in expression. Operators do not have enought operands.\n", buffer);
                            } else {
                                printf("Operation <%s> looks good.\n", buffer);
                            }
                            strcpy(buffer,"");
                            pMisMatched=0; nOp=0; nNb=0;
                            BEGIN(INITIAL);}
<INITIAL>[\n]            {printf("Error: Expression <%s> is not valid in expression. Parenthesis are not matching.\n", buffer); strcpy(buffer,""); pMisMatched=0;  nOp=0; nNb=0; BEGIN(INITIAL);}
<Operator>[\n]           {printf("Error: Expression <%s> is not valid in expression. Operators do not have enought operands.\n", buffer); strcpy(buffer,""); pMisMatched=0; nOp=0; nNb=0;  BEGIN(INITIAL);}
<Numbers>[\n]            {printf("Error: Expression <%s> is not valid in expression. Operands do not have enought operators.\n", buffer); strcpy(buffer,""); pMisMatched=0; nOp=0; nNb=0; BEGIN(INITIAL);}
{notvalid}.*[\n]         {yytext[strlen(yytext)-1]=0;printf("Error: Symbol <%s> is not valid in expression: <%s> \n", yytext, buffer); strcpy(buffer,""); pMisMatched=0; nOp=0; nNb=0;  BEGIN(INITIAL);}
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