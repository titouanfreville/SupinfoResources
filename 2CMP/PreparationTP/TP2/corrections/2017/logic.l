%{
  #include "parser.h"
  int nbLine = 1, LexError = 0, inError = 1;

  #define RED   "\x1B[31m"
  #define GRN   "\x1B[32m"
  #define YEL   "\x1B[33m"
  #define BLU   "\x1B[34m"
  #define MAG   "\x1B[35m"
  #define CYN   "\x1B[36m"
  #define WHT   "\x1B[37m"
  #define RESET "\x1B[0m"

  #define YYSTYPE int;
  extern YYSTYPE yylval;
  extern void yyerror();
  void printLexicalError(int nbError, int nbLine, char* error) {
    printf("\n%sWarning - lexical error (%d), line (%d):%s %s\n", CYN, nbError, nbLine, RESET, error);
  } 
%}
%option noyywrap
%%
[01]      if (inError == 0) {yymore();} else { yylval=atoi(yytext); return VAL;};
[&]       if (inError == 0) {yymore();} else { return AND;};
and       if (inError == 0) {yymore();} else { return AND;};
[|]       if (inError == 0) {yymore();} else { return OR;};
or        if (inError == 0) {yymore();} else { return OR;};
[(]       if (inError == 0) {yymore();} else { return LBR;};
[)]       if (inError == 0) {yymore();} else { return RBR;};
[=]       if (inError == 0) {yymore();} else { return EQ;};
\n        if (inError == 0) {printLexicalError(LexError, nbLine, yytext); inError=1;}; printf("\n");nbLine++;/* don't like whitelines*/
[ \t]+    /* same goes for whitespace*/
.         LexError++; inError=0; yymore();
%%