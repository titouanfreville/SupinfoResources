%{
    #include <stdio.h>
    #include <string.h>
    #define YYSTYPE char*;
    int yylex();
%}
%token EOF EOM
%token IMPORTS 
%token DIRECTIVE_START DIRECTIVE_NAME DIRECTIVE_ARGS DIRECTIVE_DEFINITION DIRETIVE_OBJECT LINK
%token METHODE VARIABLE BINDINGS ARGUMENTS ACTIONS DEFINITION TEMPLATE
%%
files: file | files file;

file: expression EOF {YYACCEPT;} |
      error 'EOF' {printf("Cannot correctly parse"); yyerrorok;};

expression: IMPORTS {printf("Import : %s\n", $1);} |
            DIRECTIVE_START directive_main {printf("\nStart Directive\n\n");};

directive_main: DIRECTIVE_ARGS DIRECTIVE_DEFINITION dd_corps DIRECTIVE_OBJECT object;

dd_corps: DEFINITION {printf("Directive Definitions: %s\n", $1);} |
          VARIABLE {printf("Variable: %s\n",$1);};

object: TEMPLATE {printf("Template : %s\n", $1);} |
        BINDINGS {printf("Bindings : %s\n", $1);} |
        LINK link_corps {printf("Starting LINK \n\n");};

link_corps: VARIABLE {printf("Var : %s\n", $1);} | 
            DEFINITION  {printf("def : %s\n", $1);}| 
            METHODE ARGUMENTS corps_methode {printf("METHOD : %s ARGUMENT: %s\n", $1, $2);};

corps_methode: VARIABLE { printf("%s\n", $1); } |
               ACTIONS  { printf("%s\n", $1); } |
               DEFINITION { printf("%s\n", $1); } |
               EOM {printf("} End Method \n");};
