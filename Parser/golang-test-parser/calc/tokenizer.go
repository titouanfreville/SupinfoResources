// CAUTION: Generated file - DO NOT EDIT.

package main

import (
	"bufio"
	"log"
	"strconv"
)

type yylexer struct {
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

yystate0:

	y.buf = y.buf[:0]

	goto yystart1

	goto yystate0 // silence unused label error
	goto yystate1 // silence unused label error
yystate1:
	c = y.getc()
yystart1:
	switch {
	default:
		goto yyabort
	case c == '.':
		goto yystate3
	case c == '\t' || c == '\r' || c == ' ':
		goto yystate2
	case c == 'e':
		goto yystate9
	case c >= '0' && c <= '9':
		goto yystate8
	}

yystate2:
	c = y.getc()
	switch {
	default:
		goto yyrule1
	case c == '\t' || c == '\r' || c == ' ':
		goto yystate2
	}

yystate3:
	c = y.getc()
	switch {
	default:
		goto yyabort
	case c >= '0' && c <= '9':
		goto yystate4
	}

yystate4:
	c = y.getc()
	switch {
	default:
		goto yyrule3
	case c == 'E' || c == 'e':
		goto yystate5
	case c >= '0' && c <= '9':
		goto yystate4
	}

yystate5:
	c = y.getc()
	switch {
	default:
		goto yyabort
	case c == '+' || c == '-':
		goto yystate6
	case c >= '0' && c <= '9':
		goto yystate7
	}

yystate6:
	c = y.getc()
	switch {
	default:
		goto yyabort
	case c >= '0' && c <= '9':
		goto yystate7
	}

yystate7:
	c = y.getc()
	switch {
	default:
		goto yyrule3
	case c >= '0' && c <= '9':
		goto yystate7
	}

yystate8:
	c = y.getc()
	switch {
	default:
		goto yyrule3
	case c == '.':
		goto yystate4
	case c == 'E' || c == 'e':
		goto yystate5
	case c >= '0' && c <= '9':
		goto yystate8
	}

yystate9:
	c = y.getc()
	switch {
	default:
		goto yyabort
	case c == 'x':
		goto yystate10
	}

yystate10:
	c = y.getc()
	switch {
	default:
		goto yyabort
	case c == 'i':
		goto yystate11
	}

yystate11:
	c = y.getc()
	switch {
	default:
		goto yyabort
	case c == 't':
		goto yystate12
	}

yystate12:
	c = y.getc()
	goto yyrule2

yyrule1: // [ \t\r]+

	goto yystate0
yyrule2: // exit
	{
		return EXIT
	}
yyrule3: // {Reel}
	{
		if lval.value, err = strconv.ParseFloat(string(y.buf), 64); err != nil {
			log.Fatal(err)
		}
		return NB
	}
	panic("unreachable")

	goto yyabort // silence unused label error

yyabort: // no lexem recognized
	y.empty = true
	return int(c)
}
