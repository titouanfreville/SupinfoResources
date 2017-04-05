default: compileall test

genall: gen_copie gen_compt_voyelle gen_compt_consonne gen_compt_linebreak gen_compt_allchars gen_compt_chars_notarbreak gen_compt_class

compileall: compile_copie compile_compt_voyelle compile_compt_consonne compile_compt_linebreak compile_compt_allchars compile_compt_chars_notarbreak compile_compt_class

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

test: copie_from_lex compt_voyelle compt_consonne compt_mot
	./test.sh makefile