# TP 5 - Les arbres de Dérivation et de Réduction

## 1 - Expression Lexicale

### G : S -> xSyS | z

#### Terminaux et non terminaux de la grammaire G

NT : S. T : x, y, z

#### Appartenance à L(G)

t=xzyz : vrai. s=xxzzyy : faux, il doit y avoir un z en fin de chaque expression.

Démonstration par arbre (t puis s) :
![](images/demo_reduction_511.png)

u= xxxyyyzxyz: faux, un x ne peut pas être suivi d'un y.

![](images/demo_reduction_511_u.png)


v= xxzyxxzyzyzyzyxzyz : Faux. Un yS n'est pas lié avec un xS en fin d'arbre. (il reste S, yS).

![](images/demo_reduction_511_v.png)

### G2: S -> x | (T) , T -> S, T | S

#### Terminaux et non terminaux de la grammaire G2

NT: S, T. T: ",", "x"

#### Appartenance à L(G2)

##### (x,x)

t=(x,x) : vrai.

(x, x) -> (x, S) -> (S, S) -> (S, T) -> (T) -> S

##### (x, (x,x))

s=(x, (x,x)): vrai.

(x, (x, x)) -> (S, (x,x)) -> (S, S) -> (S, T) -> S

S -> (T) -> (S, T) -> (S, S) -> (S, (x,x)) -> (x, (x,x))

##### (x,((x,x)(x,x)))

u=(x,((x,x)(x,x))): faux, il n'y a pas de virgule entre (x,x) et (x,x).

(x,((x,x)(x,x))) -> (S, (SS)) -> Can't match SS.

S -> (T) -> ((S, T)) -> Can't use to to get SS

## 2 - Expression booleene

GB: A -> A ou A | A et A | non A | (A) | B
    B -> vrai | faux

### Terminaux et non terminaux de GB

T: vrai/faux/ou/et/non/(). NT: A, GB

### Appartenance a L(GB)

t= non(faux ou vrai) : vrai

![](images/demo_reduction_GB_t.png)

s = non vrai ou non (faux et vrai) : vrai.

![](images/demo_reduction_GB_s.png)

u = ((non vrai ou (faux ou vrai)) ou (vrai ou (vrai et faux))) ou vrai: vrai

![](images/demo_reduction_GB_u.png)

## 3 - Expression Arithmétique

GA = (
    E -> (E) | E+T | T
    T -> T * F | F
    F -> nombre
)

### Axiome de GA

E

### Appartient à L(GA)

t= 3+4+5: vrai

![](images/demo_reduction_GA_t.png)

s=(1+3*2): vrai

![](images/demo_reduction_GA_s.png)

u=((2+3)*((4+5)+7))+123: vrai

![](images/demo_reduction_GA_u.png)

### Ambigüe (?)

La grammaire GA n'est pas ambigüe. Il n'y a qu'une façon de remonter jusqu'à E quelque soit l'ensemble de terminaux séléctionner à l'origine.

### Reformuler si Ambigüe

GA non amnigüe