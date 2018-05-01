%{

}%
%option noyywrap
notes [A-G]
alteration [#b^] (*need to find becar description in ABC langage*)
silence [-_]
%%
notes 		{yylval = yytext; retun NOTE}
alteration  
