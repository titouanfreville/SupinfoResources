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

Autre solution :

``` C
    S --> 0|1B
    B --> 0B|1B|*e*
```

type trois, régulière à droite

```C
    S --> 0B|1B
    B --> 0B|1B|*e*
```

type trois, régulière à droite

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

## 3 Grammaire des expressions arithmétiques.

### Création de la grammaire X cat X ou X in {1}\*

G : (

    {
        < exp > : < nombre > "cat" < nombre > "="
        < nombre > : < nombre > 1
    },
    {
        "cat", "=", 1
    },
    {},
    {< exp >}

)

Exp -> Nb "cat" Nb "="

Nb -> Nb 1

### Représentation cohérante de la grammaire arithmétique polonaise

S -> (Opérateur T T)

T -> S | N

Opérateur -> + | - | * | /

N -> N0 | N1 | N2 | N3 | N4 | N5 | N6 | N7 | N8 | N9


## 4 - Grammaire et Automates

### Shématisez sous forme d'automates la grammaire vue en 4-3-2

![](images/automates_syntaxe_polonaise.png)

### Fini ?

Dans le sens ou la grammaire défini ne contient que les 4 opérateurs, les (), l'espace et les chiffres, l'automates est finis.

# TP 7 - Nouvelles Grammaires de l'analyse syntaxique

## 1 - Grammaire LL

## 2 - Conception de grammaire && exécution de séquences

### Donnez G1 la grammaire récursive a droite engeandrant le langage des multiplication

```OCaml
Expr -> nb * Fact
Fact -> nb * Fact
Fact -> nb
```

#### Donnez la table syntaxique correspondante

- Calcul d'ε : Pas de ε règles, donc pas ε(G) est null 
- Calcul des Premiers :
    - Premier( nb * Fact ) = nb *
    - Premier( nb ) = nb
- table:

|      | nb *               | nb         |
| -----| ------------------ | ---------- |
| Expr |  Expr -> nb * Fact |            |
| Fact |  Fact -> nb * Fact | Fact -> nb |

<!-- Calcul ex 1*5*5 -->
```Ocaml
1*5*5 -> Expr.
Premier(1*5*5) = 1*
Expr(nb * ) -> nb * Fact
```

pile:

|    |
|----|
| 1* |
| $  |

```Ocaml
5*5 -> Fact.
Premier(5*5) = 5*
Fact(nb * ) -> nb*Fact
```

pile:

|    |
|----|
| 5* |
| 1* |
| $  |

```Ocaml
5 -> Fact.
Premier(5) = 5
Fact(nb) -> nb
```

pile:

|    |
|----|
| 5  |
| 5* |
| 1* |
| $  |

<!-- Calcul ex 1*2+2*3  -->

```Ocaml
1*2+2*3 -> Expr.
Premier(1*2+2*3) = 1*
Expr(nb * ) -> nb * Fact
```

pile:

|    |
|----|
| 1* |
| $  |

```Ocaml
2+2*3 -> Fact.
Premier(2+) = 2+
Fact(nb + ) -> NO RULES
```

pile:

|    |
|----|
| 1* |
| $  |

### Donnez la grammaire G2 rec à droite -> arithmétique addition && mult

```OCaml
Expr -> (Expr)
Expr -> Fact * Expr
Expr -> Fact + Expr
Expr -> Fact
Fact -> Sum * Fact
Fact -> Sum
Fact -> (Fact)
Sum -> nb
Sum -> (Sum)
Sum -> nb + Sum
```

#### Table synt

```Ocaml
Premier( (Expr) ) = (
Premier( Fact * Expr ) = Fact *
Premier( Fact + Expr ) = Fact +
Premier( Sum * Fact ) = Sum *
Premier( Sum ) = Sum
Premier( (Fact) ) = (
Premier( nb ) = nb
Premier( (Sum) ) = (
Premier( nb + Sum ) = nb +
```

|      | (                | nb        | Sum         | Fact *              | Sum *              | Fact +             | nb +            |
|------|------------------|-----------|-------------|---------------------|--------------------|--------------------|-----------------|
| Expr | Expr -> ( Expr ) |           |             | Expr -> Fact * Expr |                    | Expr -> Sum + Expr |                 |
| Fact | Fact -> ( Fact ) |           | Fact -> Sum |                     | Fact -> Sum * Fact |                    |                 |
| Sum  | Sum -> ( Sum )   | Sum -> nb |             |                     |                    |                    | Sum -> nb + Sum |

<!-- Calcul (1*5*5) -->
```Ocaml
(1*5*5) -> Expr
Premier (1*5*5) = (
Expr -> (Expr)
```

pile:

|    |
|----|
| )  |
|Expr|
| (  |
| $  |

```Ocaml
1*5*5) -> Expr
Premier 1*5*5) = 1*
Expr * -> Fact * Expr
```

pile:

|    |
|----|
| )  |
|Expr|
|*   |
|Fact|
| (  |
| $  |

```Ocaml
1 -> Fact
5*5) -> Expr
Premier 1 = 1
Premier 5*5) = 5*
Fact -> Sum -> nb
Expr -> Fact * Expr
```

pile:

|    |
|----|
| )  |
|Expr|
|Fact|
|*   |
|nb=1|
| (  |
| $  |

```Ocaml
5 -> Fact
5) -> Expr
Premier 5 = 5
Premier 5) = 5
Fact -> Sum -> nb
Expr -> Fact -> Sum -> nb
```

pile:

|    |
|----|
| )  |
|nb=5|
|*   |
|nb=5|
|*   |
|nb=1|
| (  |
| $  |

## 3 - Grammaire LR

```OCaml
G:
E' -> .E
E -> .E+T
E -> .T
T -> .T*F
T -> .(E)
F -> .(id)
```

#### Automate Déterministe