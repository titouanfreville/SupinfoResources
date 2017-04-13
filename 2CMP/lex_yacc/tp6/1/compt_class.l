%{
   int nbMot = 0, nbChar = 0, nbLinebreak = 0;
%}
maj[A-Z]
min[a-z]
ponct[,;?!.:\-"']
sepliant[-_.]
mot({maj}?{min}({min}*{sepliant}?{min}*)*)
%%
{mot}       nbMot ++; nbChar+= yyleng;
{ponct}     nbChar++;
[\n]        nbLinebreak++;
.|\n        /**/
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
    printf("Nb nbMot - Chars - Line Break in <%s>: %d - %d - %d. \n", argv[1], nbMot, nbChar, nbLinebreak);
    return 0;
}
int yywrap()
{
    return 1;
}