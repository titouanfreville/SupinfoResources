# Correction Sujet officiel (année 2015)

*temps correcteur : 30 mins*

## Grammaire et Dérivations

Soit la grammaire :

```OCaml
G=(
    S -> aSXa | abZ | b,
    X -> S | x,
    F -> T | t,
    T -> t,
    Z -> S | z
)
```

### G est elle sous la forme BNF ? Réécrire si non. 

Non, G n'est pas parfaitement sous la forme BNF, elle ne respecte pas la notation des non-terminaux et ne défini pas l'axiome, ni les terminaux, ni les non terminaux. 

Sous forme BNF correcte :

```OCaml
G=( 
    {a,b,x,t,z} (* terminaux *)
    {<S>,<X>,<F>,<T>,<Z>}, (* non terminaux *)
    {<S>, <F> }, (* axiomes *)
    {
        <S> ::= a<S><X>a | ab<Z> | b,
        <X> ::= <S> | x,
        <F> ::= <T> | t,
        <T> ::= t,
        <Z> ::= S | z
    } (* productions *)
)
```

### Donner un arbre de réduction pour la locution L1

`L1 =aabzabza`

![](images/sujet_off_ar1.png) 

### Donner un arbre de dérivation pour la locution L2

`L2=ababababxaa`

![](images/sujet_off_ad1.png) 

## Langage, ER et automate

### Donner l'ER permettant d'engendre les mot du langage L

`L={ε,x,xz,xzxz,xzxzxz, ....}`
`ER(L) = x | (xz)*`

### Décrivez le langage L 
  
L représente le vide ou x ou toute suite de xy. 

### Donnez l'automate déterministe de L

![](images/sujet_off_automate1.png)

### Donnez l'automate déterministe de ER

`ER = b((a|c)*ab(d|c)*)`

![](images/sujet_off_automate2.png)

### Langage engendré par ER

L(ER) représente tous les mots commençant par b, puis pouvant contenir une série de a ou c ou rien suivi de ab puis une suite quelconque de d et c pouvant être vide.

## Locutions et ER

Parmi les locution:

```
M1 = cccc
M2 = aabbbbbbcfd
M3 = cafd
M4 = aabbacbccbabd
M5 = c
```

Lesquels sont reconnus par (a|b)*c(a|f|d)+

M2, M3