all: init gen_all compile_all test

gen_all: gen_calc1 gen_calc3

compile_all: cmp_calc1 cmp_calc3

init:
	-mkdir compiled 1> /dev/null 3> /dev/null > /dev/null

# TP 8-1 ###################################
gen_calc1: 1/calc.y 1/calc.y
	lex -o 1/calc_stx.c 1/calc.l && \
	yacc -d -o 1/calc_grm.c 1/calc.y

cmp_calc1: 1/calc_stx.c 1/calc_grm.c
	gcc -o compiled/calc1.bin 1/calc_stx.c 1/calc_grm.c
# ##########################################
# TP 8-2 ###################################
gen_calc2: 2/calc.y 2/calc.y
	lex -o 2/calc_stx.c 2/calc.l && \
	yacc -d -o 2/calc_grm.c 2/calc.y

cmp_calc2: 2/calc_stx.c 2/calc_grm.c
	gcc -o compiled/calc2.bin 2/calc_stx.c 2/calc_grm.c
# ##########################################
# TP 8-3 ###################################
gen_calc3: 3/calc.y 3/calc.y
	lex -o 3/calc_stx.c 3/calc.l && \
	yacc -d -o 3/calc_grm.c 3/calc.y

cmp_calc3: 3/calc_stx.c 3/calc_grm.c
	gcc -o compiled/calc3.bin 3/calc_stx.c 3/calc_grm.c
# ##########################################

test: 
	compiled/calc1.bin < 1/test &&\
	compiled/calc2.bin < 2/test &&\
	compiled/calc3.bin < 3/test

clean:
	-rm -rf compiled **/*.c **/*.h