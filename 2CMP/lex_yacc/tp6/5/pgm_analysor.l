space[ ]
%%
tant{space}que       {ECHO; printf("\n");}
Fair                 {ECHO; printf("\n");}
si                   {ECHO; printf("\n");}
alors                {ECHO; printf("\n");}
sinon                {ECHO; printf("\n");}
debut                {ECHO; printf("\n");}
fin                  {ECHO; printf("\n");}
affectation          {ECHO; printf("\n");}
\:=                  {ECHO; printf("\n");}
ET                   {ECHO; printf("\n");}
&&                   {ECHO; printf("\n");}
ou                   {ECHO; printf("\n");}
\|\|                 {ECHO; printf("\n");}
non                  {ECHO; printf("\n");}
!                    {ECHO; printf("\n");}
inferieur            {ECHO; printf("\n");}
\<                   {ECHO; printf("\n");}
superieur            {ECHO; printf("\n");}
\>                   {ECHO; printf("\n");}
egal                 {ECHO; printf("\n");}
=                    {ECHO; printf("\n");}
different            {ECHO; printf("\n");}
!=                   {ECHO; printf("\n");}
Fin[ ]du[ ]programme {ECHO; printf("\n");}
;;                   {ECHO; printf("\n");}
\(                   {ECHO; printf("\n");}
\)                   {ECHO; printf("\n");}
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