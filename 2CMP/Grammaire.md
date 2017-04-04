# TP 4 - Les Grammaires

## 1 - BNF et EBNF

### 1 - Listez les éléments dans la grammaire (cf pdf)

règles de syntaxe : < ifelse >, < if >, < else >

symbole non terminaux : < instruction >, < condition >

symbole terminaux:  if, else, ;, {, }

### 2 - Grammaire BNF puis EBNF pour les entiers

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

    {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "-", "+"} /* termiaux */

    { < nombre >, < chiffre >, < signe > }, /* non terminaux */

    {   /* production */

        < nombre > ::= [ < signe > ] (< nombre > | < chiffre >) | < chiffre >

        < signe > ::= "+" | "-"

        < chiffre > ::= "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9"

    }

    < nombre > /* axiome */
    
)

