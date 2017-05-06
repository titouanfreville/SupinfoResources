%{
package main

import (
    "bufio"
    "log"
    "strconv"
)

type yylexer struct{
    src     *bufio.Reader
    buf     []byte
    empty   bool
    current byte
}

func newLexer(src *bufio.Reader) (y *yylexer) {
    y = &yylexer{src: src}
    if b, err := src.ReadByte(); err == nil {
        y.current = b
    }
    return
}

func (y *yylexer) getc() byte {
    if y.current != 0 {
        y.buf = append(y.buf, y.current)
    }
    y.current = 0
    if b, err := y.src.ReadByte(); err == nil {
        y.current = b
    }
    return y.current
}

func (y yylexer) Error(e string) {
    log.Fatal(e)
}

func (y *yylexer) Lex(lval *yySymType) int {
    var err error
    c := y.current
    if y.empty {
        c, y.empty = y.getc(), false
    }
%}

%yyc c
%yyn c = y.getc()

Number [0-9]+
Exposant [eE][-+]?{Number}
Reel {Number}{Exposant}?|{Number}"."{Number}?{Exposant}?|"."{Number}{Exposant}?

%%
  y.buf=y.buf[:0]

[ \t\r]+
exit return EXIT
{Reel} if lval.value, err = strconv.ParseFloat(string(y.buf), 64); err != nil {
      log.Fatal(err)
    }
    return NB

%%
  y.empty = true
  return int(c)
}