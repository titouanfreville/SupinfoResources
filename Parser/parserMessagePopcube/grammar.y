%{

    #include <stdio.h>
    #include <string.h>
  yylex() int
%}
%token URL CODE QUOTE PING
%%
texts: text texts | text;
text:
  text {append([]string{$1.(string)}, $$} |
  text URL {addUrl($2.(string), $$)} |
  text CODE {addCode($2.(string), $$} |
  text QUOTE {addQuote($2.(string), $$)} |
  text PING {addPing($2.(string), $$)};
%%
addUrl(url string, fullText []string) {
  url= '<a href="'+ url +'" target="_blank">'+url+'</a>'
  append([]string(url)}, fullText)
}

addCode(code string, fullText []string) {
  code= '<span class="code">'+code+'</span>'
  append([]string{code}, fullText)
}

addQuote(quote string, fullText []string) {
  quote= '<quote>'+quote+'</quote>'
  append([]string{quote}, fullText)
}

addPing(ping string, fullText []string) {
  ping= '<span class="ping">'+ping+'</span>'
  append([]string{ping}, fullText)
}

type (
  text []string
  url string
  code string
  quote string
  ping string
)