default: compile getobject getpreproc getassembleur verbosecompile

compile: factorielle.c
	gcc factorielle.c -o factorielle

verbosecompile:
	gcc -v factorielle.c -o factorielle

getobject: compile
	gcc -c factorielle.c

getpreproc: compile
	gcc -E factorielle.c > preproc

getassembleur: compile
	gcc -S factorielle.c
