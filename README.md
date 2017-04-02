# Supinfo AIT resources

This repository provide resources for AIT courses of Supinfo schools (3rd year and 4th year). They mostly consist in LABS and TPs corrections in various langages and syntaxes.

## 2 CMP


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
 

### List of corrections available (lisp)

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

### List of correction (CAML -> All tps, in CAML :)

In CAML folder ;)

| TP number | TP group | File to consult | Lines       |
| --------- | -------- | --------------- | ----------- |
| TP 1      | 1        | tp1_to_3.ml     | 22 to 57    |
|           | 2        | tp1_to_3.ml     | 56 to 89    |
|           | 3        | tp1_to_3.ml     | 90 to 148   |
| TP 2      | 3        | tp1_to_3.ml     | 149 to 257  |
| TP 3      |          | tp1_to_3.ml     | 258 to 427  |
| TP 5      |          | tree.ml         | Stand Alone |


### List of correction (Pyhton -> All tps, in Python :)

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

| What    | Where      |
| ------- | ---------- |
| general | others.txt |
| lisp    | lisp.lisp  |
| python  | python.py  |

### TPs

TP_NOTE contain correction of the TP we had in 2016.
rattrapage contain correction of the TP for 2d timer we had in 2016.

## 4 AIT

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

- get `Seti UI` package
- get `lisp indent` package

# Nicer VSCode

- get `icon theme`
- get `seti icon theme`
