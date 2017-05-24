## This is a general Make file to include into your repo.
## It is able to produce multiple lex/yacc compilation.
## You need to configure the compilation for binaries before using it.

## Default variables.
CC=gcc -o
YACC=yacc -d -o
LEX=lex -o
BIN=exec
BIN_SRC=parser.c lexer.c

default: all

all: $(BIN)

$(BIN): $(BIN_SRC)
	@$(CC) $@ $^

%.c: %.y
	@$(YACC) -d -o $@ $<

%.c: %.l
	@$(LEX) $@ $<

clean:
	rm *.c *.h exec