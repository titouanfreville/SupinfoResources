%{
  package main

  import (
    "bufio"
    "fmt"
    "math"
    "os"
  )
%}

%union{
  value float64
}


%token NB EXIT

%left NEG

%type <value> NB, expNum, fact, expo, term

%%

calc: /**/ | calc exp;

exp: '\n' {} | expNum '=' { fmt.Printf("\t%.10g\n",$1) } | EXIT { return 0} ;

expNum: fact 
      | expNum '+' fact { $$ = $1 + $3 }
      | expNum '-' fact { $$ = $1 - $3 };

fact: expo
    | fact '*' expo     { $$ = $1 * $3 }
    | fact '/' expo     { $$ = $1 / $3 };

expo: term 
    | expo '^' term        { $$ = math.Pow($1,$3) };

term: NB                   { $$ = $1              }
    | '-' expNum %prec NEG { $$ = -$2             }
    | '(' expNum ')'       { $$ = $2              };
%%
func main() {
  fmt.Printf("Hello and welcomme on the Golang Yacc Calculator.\n")
  fmt.Printf("Enter your expression using '=' to have the result.\n")
  fmt.Printf("Exit with blank line or 'exit'\n\n")
  os.Exit(yyParse(newLexer(bufio.NewReader(os.Stdin))))
}