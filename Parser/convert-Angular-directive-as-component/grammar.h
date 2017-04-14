#define EOF 257
#define EOM 258
#define IMPORTS 259
#define DIRECTIVE_START 260
#define DIRECTIVE_DEFINITION 261
#define DIRECTIVE_OBJECT 262
#define LINK 263
#define METHODE 264
#define VARIABLE 265
#define BINDINGS 266
#define ARGUMENTS 267
#define ACTIONS 268
#define DEFINITION 269
#define TEMPLATE 270
#define ARGS 271
#define EOF 272
#ifdef YYSTYPE
#undef  YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
#endif
#ifndef YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
typedef union {
    char *str;
} YYSTYPE;
#endif /* !YYSTYPE_IS_DECLARED */
extern YYSTYPE yylval;
