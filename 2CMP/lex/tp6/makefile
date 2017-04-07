default: genall compileall test

genall: gen_copie gen_compt_voyelle gen_compt_consonne gen_compt_linebreak gen_compt_allchars gen_compt_chars_notarbreak gen_compt_class gen_filt_sl_comment gen_filt_ml_comment gen_filt_chars gen_copie_files gen_crypt gen_decrypt gen_print_nb gen_calc gen_pgm_analysor gen_polish_syntax_checker_automate gen_polish_syntax_checker

compileall: compile_copie compile_compt_voyelle compile_compt_consonne compile_compt_linebreak compile_compt_allchars compile_compt_chars_notarbreak compile_compt_class compile_polish_syntax_checker compile_filt_sl_comment compile_filt_ml_comment compile_filt_chars compile_copie_files compile_crypt compile_decrypt compile_print_nb compile_calc compile_pgm_analysor compile_polish_syntax_checker_automate

# ########### TP 6 - 1 ########### #
gen_copie: copie.l
	lex -o copie_from_lex.c copie.l

compile_copie: copie_from_lex.c
	gcc -o copie_from_lex copie_from_lex.c

gen_compt_voyelle: compt_voyelle.l
	lex -o compt_voyelle.c compt_voyelle.l

compile_compt_voyelle: compt_voyelle.c
	gcc -o compt_voyelle compt_voyelle.c

gen_compt_consonne: compt_consonne.l
	lex -o compt_consonne.c compt_consonne.l

compile_compt_consonne: compt_consonne.c
	gcc -o compt_consonne compt_consonne.c

gen_compt_mot: compt_mot.l
	lex -o compt_mot.c compt_mot.l

compile_compt_mot: compt_mot.c
	gcc -o compt_mot compt_mot.c

gen_compt_linebreak: compt_linebreak.l
	lex -o compt_linebreak.c compt_linebreak.l

compile_compt_linebreak: compt_linebreak.c 
	gcc -o compt_linebreak compt_linebreak.c

gen_compt_allchars: compt_allchars.l
	lex -o compt_allchars.c compt_allchars.l

compile_compt_allchars: compt_allchars.c
	gcc -o compt_allchars compt_allchars.c

gen_compt_chars_notarbreak: compt_chars_notarbreak.l
	lex -o compt_chars_notarbreak.c compt_chars_notarbreak.l

compile_compt_chars_notarbreak: compt_chars_notarbreak.c
	gcc -o compt_chars_notarbreak compt_chars_notarbreak.c

gen_compt_class: compt_class.l
	lex -o compt_class.c compt_class.l

compile_compt_class: compt_class.c
	gcc -o compt_class compt_class.c
# ########### ######## ########### #
# ########### TP 6 - 2 ########### #
gen_filt_sl_comment: filt_sl_comment.l
	lex -o filt_sl_comment.c filt_sl_comment.l

compile_filt_sl_comment: filt_sl_comment.c
	gcc -o filt_sl_comment filt_sl_comment.c

gen_filt_ml_comment: filt_ml_comment.l
	lex -o filt_ml_comment.c filt_ml_comment.l

compile_filt_ml_comment: filt_ml_comment.c
	gcc -o filt_ml_comment filt_ml_comment.c

gen_filt_chars: filt_chars.l
	lex -o filt_chars.c filt_chars.l

compile_filt_chars: filt_chars.c
	gcc -o filt_chars filt_chars.c
# ########### ######## ########### #compile_calc
# ########### TP 6 - 3 ########### #
gen_copie_files: copie_files.l
	lex -o copie_files.c copie_files.l

compile_copie_files: copie_files.c
	gcc -o copie_files copie_files.c

gen_crypt: crypt.l
	lex -o crypt.c crypt.l

compile_crypt: crypt.c
	gcc -o crypt crypt.c

gen_decrypt: decrypt.l
	lex -o decrypt.c decrypt.l

compile_decrypt: decrypt.c
	gcc -o decrypt decrypt.c
# ########### ######## ########### #
# ########### TP 6 - 4 ########### #
gen_print_nb: affiche_nombre.l
	lex -o print_nb.c affiche_nombre.l

compile_print_nb: print_nb.c
	gcc -o print_nb print_nb.c

gen_calc: calculator.l
	lex -o calc.c calculator.l

compile_calc: calculator.l
	gcc -o calc calc.c
# ########### ######## ########### #
# ########### TP 6 - 5 ########### #

gen_pgm_analysor: pgm_analysor.l
	lex -o pgm_analysor.c pgm_analysor.l

compile_pgm_analysor: pgm_analysor.l
	gcc -o pgm_analysor pgm_analysor.c
# ########### ######## ########### #
# ########### TP 6 - 6 ########### #
gen_polish_syntax_checker: polish_syntax_checker.l
	lex -o polish_syntax_checker.c polish_syntax_checker.l

compile_polish_syntax_checker: polish_syntax_checker.l
	gcc -o polish_syntax_checker polish_syntax_checker.c
# ########### ######## ########### #
# ########### TP 6 - 7 ########### #
gen_polish_syntax_checker_automate: polish_syntax_checker_automate.l
	lex -o polish_syntax_checker_automate.c polish_syntax_checker_automate.l

compile_polish_syntax_checker_automate: polish_syntax_checker_automate.l
	gcc -o polish_syntax_checker_automate polish_syntax_checker_automate.c
# ########### ######## ########### #
# ########### # TEST # ########### #
test: copie_from_lex compt_voyelle compt_consonne compt_mot compt_class filt_sl_comment copie_files polish_syntax_checker_automate polish_syntax_checker
	./test.sh makefile makefile test.filt test.filt.out test.pgm test.calcs
# ########### ######## ########### #
# ###########  CLEAN   ########### #
clean:
	rm -rf *.c && chmod -x test.sh && find . -maxdepth 1 -type f -executable -exec rm {} + && chmod +x test.sh
# ########### ######## ########### #