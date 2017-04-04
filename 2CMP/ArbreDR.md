# TP 5 - Les arbres de Dérivation et de Réduction

## 1 - Expression Lexicale

### G : S -> xSyS | z

#### Terminaux et non terminaux de la grammaire

NT : S. T : x, y, z

#### Appartenance à L(G)

t=xzyz : vrai. s=xxzzyy : faux, il doit y avoir un z en fin de chaque expression.

Démonstration par arbre (t puis s) :
![](demo_reduction_511.png)

u= xxxyyyzxyz: faux, un x ne peut pas être suivi d'un y.

![](demo_reduction_511_u.png)


v= xxzyxxzyzyzyzyxzyz : Faux. Un yS n'est pas lié avec un xS en fin d'arbre. (il reste S, yS).

![](demo_reduction_511_v.png)

### G: S -> x | (T) , T -> S, T | S

#### Terminaux et non terminaux de la grammaire

NT: S, T. T: ",", "x"

#### Appartenance à L(G)

t=(x,x) : vrai. t=(x, (x,x)): vrai. u=(x,((x,x)(x,x))): faux, il n'y a pas de virgule entre (x,x) et (x,x).