%{
    #include <stdio.h>
    #include <string.h>
    int yylex();
%}
%token EOF EOM
%token IMPORTS 
%token DIRECTIVE_START DIRECTIVE_DEFINITION DIRECTIVE_OBJECT LINK
%token METHODE VARIABLE BINDINGS ARGUMENTS ACTIONS DEFINITION TEMPLATE ARGS
%union {
    char *str;
}
%%
files: file | files file;

file: expression EOF {YYACCEPT;} |
      error 'EOF' {printf("Cannot correctly parse"); yyerrok;};

expression: IMPORTS {printf("Import : %s\n", $1.str);} |
            DIRECTIVE_START directive_main {printf("\nStart Directive\n\n");};

directive_main: ARGS DEFINITION dd_corps DIRECTIVE_OBJECT object;

dd_corps: DEFINITION {printf("Directive Definitions: %s\n", $1.str);} |
          VARIABLE {printf("Variable: %s\n",$1.str);};

object: TEMPLATE {printf("Template : %s\n", $1.str);} |
        BINDINGS {printf("Bindings : %s\n", $1.str);} |
        LINK link_corps {printf("Starting LINK \n\n");};

link_corps: VARIABLE {printf("Var : %s\n", $1.str);} | 
            DEFINITION  {printf("def : %s\n", $1.str);}| 
            METHODE ARGUMENTS corps_methode {printf("METHOD : %s ARGUMENT: %s\n", $1.str, $2.str);};

corps_methode: VARIABLE { printf("%s\n", $1.str); } |
               ACTIONS  { printf("%s\n", $1.str); } |
               DEFINITION { printf("%s\n", $1.str); } |
               EOM {printf("} End Method \n");};
%%
void yyerror(const char *str)
{
        fprintf(stderr,"error: %s\n",str);
}

int yywrap(void)
{
        return 1;
} 

int main(void)
{
        // if (argc != 2){
        // printf("Usage:\t %s FolderToCopy\n", argv[0]);
        // return 1;
        // }
        // yyin=fopen(argv[1],"r");
        // if (yyin==NULL){
        // printf("Cannont open <%s>.\n", argv[1]);
        // return 2;
        // }
        // printf("Hello and welcome into Yacc Calculator. Enter your expression using '=' to have the result (spaces unsupported). Exit by typing 'exit'.\n\n");
        yyparse();
        printf("\n");
        return 0;
} 