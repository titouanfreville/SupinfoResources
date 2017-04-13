%option noyywrap
%% 
[0-9]+ printf("nombre %d\n",atoi(yytext));
(exit) yyterminate();
.|\n
%% 
int main(void) {
    printf("Enter something: (tape exit to stop)\n");
    yylex();
    return 0; 
}