## This is a general Make file to include into your repo.
## Please it will not be able to compile multiple file as it is.
default: all

all: exec.bin

exec.bin: parser.c lexer.c
	gcc -o $@ $^

parser.c: *.y
	yacc -d -o $@ $^

lexer.c: *.l
	lex -o $@ $^

clean:
	rm *.c *.h exec.bin