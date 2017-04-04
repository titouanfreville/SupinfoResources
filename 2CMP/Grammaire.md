# TP 4 - Les Grammaires

## 1 - BNF et EBNF

### 1 - Listez les éléments dans la grammaire (cf pdf)

règles de syntaxe : < ifelse >, < if >, < else >

symbole non terminaux : < instruction >, < condition >

symbole terminaux:  if, else, ;, {, }

### 2 - Grammaire BNF puis EBNF pour les entiers Naturels

#### BNF et EBNF

GN = (

    {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9",} /* termiaux */

    { < nombre >, < chiffre > }, /* non terminaux */

    {   /* production */

        < nombre > ::= < nombre > | < chiffre >

        < chiffre > ::= "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9"

    }

    < nombre > /* axiome */

)

### 3 - Grammaire BNF puis EBNF pour les entiers

#### BNF

GN = (

    {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "-", "+"} /* termiaux */

    { < nombre >, < chiffre >, < signe > }, /* non terminaux */

    {   /* production */

        < nombre > ::= < signe > < nombre > | < signe >< chiffre > | < chiffre >

        < signe > ::= "+" | "-"

        < chiffre > ::= "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9"

    }

    < nombre > /* axiome */

)

#### EBNF

GN = (

    {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "-"} /* termiaux */

    { < nombre >, < chiffre >, < signe > }, /* non terminaux */

    {   /* production */

        < nombre > ::= [ < signe > ] (< nombre > | < chiffre >)

        < signe > ::= "-"

        < chiffre > ::= "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9"

    }

    < nombre > /* axiome */

)

### 4 - Donnez les phrases générer par la grammaire ... 

La voiture roule. La moto roule. Une voiture roule. Une moto roule. La voiture est. La moto est. Une voiture est. Une moto est.
La voiture roule bien. La moto roule bien. Une voiture roule bien. Une moto roule bien. La voiture roule bleue. La moto roule bleue. Une voiture roule bleue. Une moto roule bleue.
La voiture est bien. La moto est bien. La voiture est bleue. La moto est bleue. Une voiture est bien. Une moto est bien. Une voiture est bleue. UNe moto est bleue.

### 5 - Type de la grammaire

EBNF ( présence du raccourice [])

## 2 - Description grammaire de Chomsky

### Grammaire des mots binaires

GB = (

    {

      < mot >: < mot >< chiffre >

      < chiffre >: "0" | "1"

    },

    {"0", "1"},

    {},

    {< mot >}

)

type 3 : règulière à gauche. (Mot -> Mot 0 | Mot 1)

### S -> aS | ab | ε est elle hors contexte ? Mot générée ?

Non. Car S -> aS (grammaire régulière à droite).

a, ε, aab, aabab, aababab ....

### La grammaire S -> aS | T , T -> b | bT est elle régulière à droite ? Mots engendrés ?

Oui.

Tout ensemble de a et b en contenant au moins un. (a, b, ab, ba, abab, aabb, abba, ......... )

### Mettre sous forme normale la grammaire : S -> TF | aS | a, T -> Tb | ε, F -> TS

S -> aS0
S -> TF
S -> a
S0 -> TF
S0 -> a
T -> T0b
T -> b
T0 -> ε
T0 -> b
F -> TS
