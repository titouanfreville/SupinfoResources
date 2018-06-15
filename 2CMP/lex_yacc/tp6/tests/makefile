default: init genall compileall test

genall: gen_copie gen_compt_voyelle gen_compt_mot gen_compt_consonne gen_compt_linebreak gen_compt_allchars gen_compt_chars_notarbreak gen_compt_class gen_filt_sl_comment gen_filt_ml_comment gen_filt_chars gen_copie_files gen_crypt gen_decrypt gen_print_nb gen_calc gen_pgm_analysor gen_polish_syntax_checker_automate gen_polish_syntax_checker

compileall: compile_copie compile_compt_voyelle compile_compt_consonne compile_compt_linebreak compile_compt_allchars compile_compt_chars_notarbreak compile_compt_class compile_polish_syntax_checker compile_filt_sl_comment compile_filt_ml_comment compile_filt_chars compile_copie_files compile_crypt compile_decrypt compile_print_nb compile_calc compile_pgm_analysor compile_polish_syntax_checker_automate

init:
	-mkdir compiled 1> /dev/null 2> /dev/null > /dev/null

# ########### TP 6 - 1 ########### #
gen_copie: 1/copie.l
	lex -o copie_from_lex.c 1/copie.l

compile_copie: copie_from_lex.c
	gcc -o compiled/copie_from_lex copie_from_lex.c

gen_compt_voyelle: 1/compt_voyelle.l
	lex -o compt_voyelle.c 1/compt_voyelle.l

compile_compt_voyelle: compt_voyelle.c
	gcc -o compiled/compt_voyelle compt_voyelle.c

gen_compt_consonne: 1/compt_consonne.l
	lex -o compt_consonne.c 1/compt_consonne.l

compile_compt_consonne: compt_consonne.c
	gcc -o compiled/compt_consonne compt_consonne.c

gen_compt_mot: 1/compt_mot.l
	lex -o compt_mot.c 1/compt_mot.l

compile_compt_mot: compt_mot.c
	gcc -o compiled/compt_mot compt_mot.c

gen_compt_linebreak: 1/compt_linebreak.l
	lex -o compt_linebreak.c 1/compt_linebreak.l

compile_compt_linebreak: compt_linebreak.c 
	gcc -o compiled/compt_linebreak compt_linebreak.c

gen_compt_allchars: 1/compt_allchars.l
	lex -o compt_allchars.c 1/compt_allchars.l

compile_compt_allchars: compt_allchars.c
	gcc -o compiled/compt_allchars compt_allchars.c

gen_compt_chars_notarbreak: 1/compt_chars_notarbreak.l
	lex -o compt_chars_notarbreak.c 1/compt_chars_notarbreak.l

compile_compt_chars_notarbreak: compt_chars_notarbreak.c
	gcc -o compiled/compt_chars_notarbreak compt_chars_notarbreak.c

gen_compt_class: 1/compt_class.l
	lex -o compt_class.c 1/compt_class.l

compile_compt_class: compt_class.c
	gcc -o compiled/compt_class compt_class.c
# ########### ######## ########### #
# ########### TP 6 - 2 ########### #
gen_filt_sl_comment: 2/filt_sl_comment.l
	lex -o filt_sl_comment.c 2/filt_sl_comment.l

compile_filt_sl_comment: filt_sl_comment.c
	gcc -o compiled/filt_sl_comment filt_sl_comment.c

gen_filt_ml_comment: 2/filt_ml_comment.l
	lex -o filt_ml_comment.c 2/filt_ml_comment.l

compile_filt_ml_comment: filt_ml_comment.c
	gcc -o compiled/filt_ml_comment filt_ml_comment.c

gen_filt_chars: 2/filt_chars.l
	lex -o filt_chars.c 2/filt_chars.l

compile_filt_chars: filt_chars.c
	gcc -o compiled/filt_chars filt_chars.c
# ########### ######## ########### #compile_calc
# ########### TP 6 - 3 ########### #
gen_copie_files: 3/copie_files.l
	lex -o copie_files.c 3/copie_files.l

compile_copie_files: copie_files.c
	gcc -o compiled/copie_files copie_files.c

gen_crypt: 3/crypt.l
	lex -o crypt.c 3/crypt.l

compile_crypt: crypt.c
	gcc -o compiled/crypt crypt.c

gen_decrypt: 3/decrypt.l
	lex -o decrypt.c 3/decrypt.l

compile_decrypt: decrypt.c
	gcc -o compiled/decrypt decrypt.c
# ########### ######## ########### #
# ########### TP 6 - 4 ########### #
gen_print_nb: 4/affiche_nombre.l
	lex -o print_nb.c 4/affiche_nombre.l

compile_print_nb: print_nb.c
	gcc -o compiled/print_nb print_nb.c

gen_calc: 4/calculator.l
	lex -o calc.c 4/calculator.l

compile_calc: calc.c
	gcc -o compiled/calc calc.c
# ########### ######## ########### #
# ########### TP 6 - 5 ########### #q
gen_pgm_analysor: 5/pgm_analysor.l
	lex -o pgm_analysor.c 5/pgm_analysor.l

compile_pgm_analysor: pgm_analysor.c
	gcc -o compiled/pgm_analysor pgm_analysor.c
# ########### ######## ########### #
# ########### TP 6 - 6 ########### #
gen_polish_syntax_checker: 6/polish_syntax_checker.l
	lex -o polish_syntax_checker.c 6/polish_syntax_checker.l

compile_polish_syntax_checker: polish_syntax_checker.c
	gcc -o compiled/polish_syntax_checker polish_syntax_checker.c
# ########### ######## ########### #
# ########### TP 6 - 7 ########### #
gen_polish_syntax_checker_automate: 7/polish_syntax_checker_automate.l
	lex -o polish_syntax_checker_automate.c 7/polish_syntax_checker_automate.l

compile_polish_syntax_checker_automate: polish_syntax_checker_automate.c
	gcc -o compiled/polish_syntax_checker_automate polish_syntax_checker_automate.c
# ########### ######## ########### #
# ########### # TEST # ########### #
test: copie_from_lex compt_voyelle compt_consonne compt_mot compt_class filt_sl_comment copie_files polish_syntax_checker_automate polish_syntax_checker
	./test.sh makefile makefile test.filt test.filt.out test.pgm test.calcs
# ########### ######## ########### #
# ###########  CLEAN   ########### #
clean:
	rm -rf *.c compiled
# ########### ######## ########### #