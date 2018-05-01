%{
    #include "parser.h"
%}
%option noyywrap
%%
a  return A;
b  return B;
c  return C;
.  
%%