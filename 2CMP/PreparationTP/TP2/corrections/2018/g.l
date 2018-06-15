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
1         if (inError == 0) {yymore();} else { return One;};
2         if (inError == 0) {yymore();} else { return Two;};
a         if (inError == 0) {yymore();} else { return A;};
z         if (inError == 0) {yymore();} else { return Z;};
s         if (inError == 0) {yymore();} else { return S;};
d         if (inError == 0) {yymore();} else { return D;};
\n        if (inError == 0) {printLexicalError(LexError, nbLine, yytext); inError=1;}; nbLine++;/* don't like whitelines*/
[ \t]+    /* same goes for whitespace*/
.         LexError++; inError=0; yymore();
%%