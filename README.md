# Supinfo AIT resources

This repository provide resources for AIT courses of Supinfo schools (3rd year and 4th year). They mostly consist in LABS and TPs corrections in various langages and syntaxes.

## 2 CMP

### Working environement

- Linux `sudo apt-get install gcc flex byacc`
- Mac `brew install gcc flex bison` (if exist in brew, used `byacc` instead of `bison`)

### Automata tool

[http://madebyevan.com/fsm/](http://madebyevan.com/fsm/) is the one I used. You can also use yEd or any graphics editor you like and master.

### Labs Correction

When codes have to be generated, I used `Makefile` to allow you to go through the compilations process. Think to use it (in general, you can just run `make` in the folder where the code is, and `make test` if the rules exist). 

#### Part 1

| TP Number | Tp Group | File to consult               | Lines     | Link                                                                        |
| --------- | -------- | ----------------------------- | --------- | --------------------------------------------------------------------------- |
|  1        | 2        | discovery/factorielle.c       | all       | [click](2CMP/discovery/factorielle.c)                                       |
|           | 3        | discovery,discovery/Makefile  | all       |                                                                             |
|  2        | 1        | Regex.md                      | 1 - 26    | [Regex.md](2CMP/Regex.md)                                                   |
|           | 2        | Regex.md                      | 27 - 34   | [Regex.md](2CMP/Regex.md#2---réécriture)                                    |
|           | 3        | Regex.md                      | 35 - end  | [Regex.md](2CMP/Regex.md#3---signification-des-expressions)                 |
|  3        | 1        | Automates.md                  | 1 - 12    | [Automates.md](2CMP/Automates.md)                                           |
|           | 2        | images/morse.png              |           | [Automates.md](2CMP/Automates.md#morse)                                     |
|           | 3        | Automates.md                  | 17 - 30   | [Automates.md](2CMP/Automates.md#er)                                        |
|           | 4        | Automates.md                  | 31 - end  | [Automates.md](2CMP/Automates.md#automates-à-pile)                          |
| 4         | 1        | Grammaire.md                  | 3 - 70    | [Grammaire.md](2CMP/Grammaire.md)                                           |
|           | 2        | Grammaire.md                  | 71 - 138  | [Grammaire.md](2CMP/Grammaire.md#2---description-grammaire-de-chomsky)      |
|           | 3        | Grammaire.md                  | 139 - 171 | [Grammaire.md](2CMP/Grammaire.md#3-grammaire-des-expressions-arithmétiques) |
|           | 4        | Grammaire.md                  | 172 - end | [Grammaire.md](2CMP/Grammaire.md#4---grammaire-et-automates)                |
| 5         | 1        | ArbreDR.md                    | 3 - 56    | [ArbreDR.md](2CMP/ArbreDR.md)                                               |
|           | 2        | ArbreDR.md                    | 57 - 79   | [ArbreDR.md](2CMP/ArbreDR.md#2---expression-booleene)                       |
|           | 3        | ArbreDR.md                    | 80 - end  | [ArbreDR.md](2CMP/ArbreDR.md#3---expression-arithmétique)                   |

#### Part 2

| TP Number | Tp Group | File to consult (base: lex\_yacc/tp6, lex\_ycc/tp8) | Link                                                                          |
| --------- | -------- | --------------------------------------------------- | ---------------------------------------------------------------------------   |
|  6-1      | 1        | 1/copie.l                                           | [copie.l](2CMP/lex_yacc/tp6/1/copie.l)                                        |
|           | 2        | 1/compt_voyelle.l                                   | [compt_voyelle.l](2CMP/lex_yacc/tp6/1/compt_voyelle.l)                        |
|           | 3        | 1/compt_consonne.l                                  | [compt_consonne.l](2CMP/lex_yacc/tp6/1/compt_consonne.l)                      |
|           | 4        | 1/compt_mot.l                                       | [compt_mot.l](2CMP/lex_yacc/tp6/1/compt_mot.l)                                |
|           | 5        | 1/compt_linebreak.l                                 | [compt_linebreak.l](2CMP/lex_yacc/tp6/1/compt_linebreak.l)                    |
|           | 6        | 1/compt_allchars.l                                  | [compt_allchars.l](2CMP/lex_yacc/tp6/1/compt_allchars.l)                      |
|           | 7        | 1/compt\_chars\_notarbreak.l                        | [compt_chars_notarbreak.l](2CMP/lex_yacc/tp6/1/compt_chars_notarbreak.l)      |
|           | 8        | 1/compt_class.l                                     | [compt_class.l](2CMP/lex_yacc/tp6/1/compt_class.l)                            |
|  6-2      | 1        | 2/filt\_sl\_comment.l                               | [filt_sl_comment.l](2CMP/lex_yacc/tp6/2/filt_sl_comment.l)                    |
|           | 2        | 2/filt\_ml\_comment.l                               | [filt_ml_comment.l](2CMP/lex_yacc/tp6/2/filt_ml_comment.l)                    |
|           | 3        | 2/filt_chars.l                                      | [filt_chars.l](2CMP/lex_yacc/tp6/2/filt_chars.l)                              |
|  6-3      | 1        | 3/copie_files.l                                     | [copie_files.l](2CMP/lex_yacc/tp6/3/copie_files.l)                            |
|           | 2        | 3/crypt.l                                           | [crypt.l](2CMP/lex_yacc/tp6/3/crypt.l)                                        |
|           | 3        | 3/decrypt.l                                         | [decrypt.l](2CMP/lex_yacc/tp6/3/decrypt.l)                                    |
|  6-4      | 1        | 4/affiche_nombre.l                                  | [affiche_nombre.l](2CMP/lex_yacc/tp6/4/affiche_nombre.l)                      |
|           | 2-3-4    | 4/calculator.l                                      | [calculator.l](2CMP/lex_yacc/tp6/4/calculator.l)                              |
|  6-5      |          | 5/pgm_analysor.l                                    | [pgm_analysor.l](2CMP/lex_yacc/tp6/5/pgm_analysor.l)                          |
|  6-6      |          | 6/polish_syntax_checker.l                           | [polish.l](2CMP/lex_yacc/tp6/6/polish_syntax_checker.l)                       |
|  6-7      |          | 7/polish_syntax_checker_automate.l                  | [polish_automate.l](2CMP/lex_yacc/tp6/7/polish_syntax_checker_automate.l)     |
|  7        | 1        | 2CMP/Grammaire.md                                   | [Grammaire LL](2CMP/Grammaire.md#1---grammaire-ll)                            |
|           | 2        | 2CMP/Grammaire.md                                   | [CGES](2CMP/Grammaire.md#2---conception-de-grammaire--exécution-de-séquences) |
|           | 3        | 2CMP/Grammaire.md                                   | [Grammaire LR](2CMP/Grammaire.md#3---grammaire-lr)                            |
|  8-1      | 1        | 1/calc.y                                            | [parser](2CMP/lex_yacc/tp8/1/calc.y)                                          |
|           | 2        | 1/calc.l                                            | [lexer](2CMP/lex_yacc/tp8/1/calc.l)                                           |
|  8-2      | 1        | 2/Grammar.md                                        | [Grammar](2CMP/lex_yacc/tp8/2/Grammar.md)                                     |
|           | 2        | 2/calc.l                                            | [lexer](2CMP/lex_yacc/tp8/2/calc.l)                                           |
|           | 3-5      | 2/calc.y                                            | [parser](2CMP/lex_yacc/tp8/2/calc.y)                                          |
|  8-3      | 1        | 3/Grammar.md                                        | [Grammar](2CMP/lex_yacc/tp8/3/Grammar.md)                                     |
|           | 1        | 3/calc.y                                            | [parser](2CMP/lex_yacc/tp8/3/calc.y)                                          |
|  8-3      | 2        | 3/calc.l                                            | [lexer](2CMP/lex_yacc/tp8/3/calc.l)                                           |
|  8-4      | 1        | 4/calc.reduction_errors.y                           | [parser wih erd errors](2CMP/lex_yacc/tp8/4/calc.reduction_errors.y)          |
|           | 2        | 4/calc.no_reduction.y                               | [parser wih erd errors](2CMP/lex_yacc/tp8/4/calc.no_reduction.y)              |
|           | 1-2      | 4/calc.l                                            | [lexer](2CMP/lex_yacc/tp8/4/calc.l)                                           |


## 3 AIT

### Working environement

- Linux `sudo apt-get install clisp`
- Mac `brew install clisp`
- Windows télécharger `clisp`

#### Set up with Sublime

- Download `sublime text`
- get package manager
- get SublimeREPL and Lisp langage support
- Run REPL with common lisp

#### Set up with atom-slime

 - Clone `slime` project: `git clone https://github.com/slime/slime.git`
 - Get `atom-slime` package from atom
 - Go into `slime` clone
 - run `make && make run-swank`
 - into atom: `Maj+Ctl+P`, `Slime:Connect`
 

### List of corrections available (lisp)

In lisp folder :)

| TP number | TP group | File to consult                    | Lines       |
| --------- | -------- | ---------------------------------- | ----------- |
| TP 1      | 1        | easy_labs.lisp                     | 17 to 54    |
|           | 2        | easy_labs.lisp                     | 55 to 123   |
|           | 3        | easy_labs.lisp                     | 124 to 179  |
| TP 2      | 1        | easy_labs.lisp                     | 180 to 214  |
|           | 2        | easy_labs.lisp                     | 215 to 253  |
|           | 3        | easy_labs.lisp                     | 254 to 326  |
| TP 3      |          | easy_labs.lisp                     | 327 to 528  |
| TP 4      |          | the_lab_that_should_not_exist.lisp | Stand Alone |
| TP 5      |          | easy_labs.lisp                     | 529 to 528  |
| TP 6      |          | laby.lisp                          | Stand Alone |

### List of correction (CAML -> All tps, in CAML :)

In CAML folder ;)

| TP number | TP group | File to consult | Lines       |
| --------- | -------- | --------------- | ----------- |
| TP 1      | 1        | tp1_to_3.ml     | 22 to 57    |
|           | 2        | tp1_to_3.ml     | 56 to 89    |
|           | 3        | tp1_to_3.ml     | 90 to 148   |
| TP 2      | 3        | tp1_to_3.ml     | 149 to 257  |
| TP 3      |          | tp1_to_3.ml     | 258 to 427  |
| TP 5      |          | tree.ml         | Stand Alone |


### List of correction (Pyhton -> All tps, in Python :)

Guess where :p

| TP number | TP group | File to consult | Lines       |
| --------- | -------- | --------------- | ----------- |
| TP 1      | 1        | tp1_to_3.py     | 36 to 128   |
|           | 2        | tp1_to_3.py     | 56 to 89    |
|           | 3        | tp1_to_3.py     | 90 to 148   |
| TP 2      | 3        | tp1_to_3.py     | 149 to 257  |
| TP 3      |          | tp1_to_3.py     | 258 to 427  |
| TP 5      |          | tree.py         | Stand Alone |
| TP 9      | 1        | lab9.py         | 8 to 162    |

### Be ready for SOE

| What    | Where      |
| ------- | ---------- |
| general | others.txt |
| lisp    | lisp.lisp  |
| python  | python.py  |

### TPs

TP_NOTE contain correction of the TP we had in 2016.
rattrapage contain correction of the TP for 2d timer we had in 2016.

## 4 AIT

### Calcul logique

### Prologue

Get started contain all 'mini' exercises introducting prolog language in the course and some others bases.

#### Working environement

##### Linux / MacOS

- `sudo apt-get install swi-prolog`
- Download `sublime text` or `visual studio code`

###### `VSCode`

- get package Prologue
- in configuration add: `"files.associations": { "*.pl": "prolog"}`
- use terminal (integrated or extern) to run prologue: `swipl`
- clauses and foncteur are to be used with `consult`. Goals need to be copy paste to `swipl`

###### `Sublime Text`

- get package manager
- get SublimeREPL and Prolog langage support
- Open package (`~/.config/sublime-text-3/Packages/SublimeREPL/config/Prolog`)
- Change `Main.sublime-menu` `"cmd": ["...."]` into `"cmd": ["swipl"]`
- Run REPL with prolog

#### Correction TPs

| TP number | TP group | File to consult | Lines       |
| --------- | -------- | --------------- | ----------- |
| TP 4      | 1        | tp4.pl          | 1 to 71     |
|           | 2        | tp4.pl          | 72 to 141   |
|           | 3        | tp4.pl          | 142 to 170  |
|           | 4        | tp4.pl          | 171 to 186  |
|           | 5        | tp4.pl          | 187 to 243  |


# Nicer Sublime text

- get `Seti UI` package
- get `lisp indent` package

# Nicer VSCode

- get `icon theme`
- get `seti icon theme`
