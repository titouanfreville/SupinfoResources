# Résolution du problème


## Ennoncé

Cinq hommes de nationalités et de professions différentes habitent des maisons de couleurs différentes et situés côte à côte dans le même alignement. Ils ont chacun un animal favori et une boisson préférée.

Les données du problème sont :

- l'anglais habite la maison rouge
- l'espagnol a un chien
- dans la maison verte on boit du café
- l'ukrainien boit du thé
- la maison verte est immédiatement à droite de la maison blanche
- le sculpteur élève des escargots
- le diplomate habite la maison jaune
- dans la maison du milieu on boit du lait
- le norvégien habite la première maison à gauche
- le médecin habite une maison voisine de celle où demeure le propriétaire du renard
- la maison du diplomate est à côté de celle où il y a un cheval
- le violoniste boit du jus d'orange
- le japonais est acrobate
- le norvégien habite à côté de la maison bleue

La problématique à résoudre est :

- Qui boit de l'eau et qui possède le zèbre ?

## Formalisation

```Ocaml
soit A l'anglais, E l'espagnol, U l'ukrainien, N le norvégien, J le japonais.
soit The, Cafe, Eau, Jus, Lait les variables de boisson.
soit Chien, Escargot, Renard, Cheval, Zèbre les variables pour les animaux.
soit Rouge, Verte, Blanche, Jaune,  Bleu les couleurs des maisons.
```

## Traduction de l'énoncé en proposition logique

```OCaml
A ∧ Rouge
E ∧ Chien
Verte ∧ Cafe
U ∧ The
droite(Verte,Blanche)
S ∧ Escargot
Diplomate ∧ Jaune
milieu(M) ∧ Lait
N ∧ gauche(_)
Medecin ∧ voisin(Renard)
Diplomate ∧ voisin(Cheval)
Violoniste ∧ Jus
N ∧ droite(Bleu,X)
```

## Traduction en prologue

```prolog

% fact: maison(nat, couleur, animal, boisson, metier)

%relation:
in(X,[X|_]).
in(X,[_|Q]):- in(X,Q).

first(X, [X|_]).

right(X,Y,[X,Y|_]).
right(X,Y,[_|Q]):-right(X,Y,Q).

voisin(X,Y,L):- right(X,Y,L).
voisin(X,Y,L):- right(Y,X,L).

middle(X,[_,_,X,_,_]).

solve(Res):- Res = [_,_,_,_,_],
             first(maison(norvegien, _, _, _, _), Res),
             middle(maison(_, _, _, lait, _), Res),
             right(maison(_, verte, _, _, _), maison(_, blanche, _, _, _), Res),
             voisin(maison(_, _, _, _, medecin), maison(_, _, renard, _, _), Res),
             voisin(maison(_, _, _, _, diplomate), maison(_, _, cheval, _, _), Res),
             voisin(maison(norvegien, _, _, _, _), maison(_, bleu, _, _, _), Res),
             in(maison(anglais,rouge,_,_,_), Res),
             in(maison(espagnol,_,chien,_,_), Res),
             in(maison(_, verte, _, cafe, _), Res),
             in(maison(ukrainien, _, _, the, _), Res),
             in(maison(_, _, escargot, _, sculpteur), Res),
             in(maison(_, jaune, _, _, diplomate), Res),
             in(maison(_, _, _, jus, violoniste), Res),
             in(maison(japonais, _, _, _, accrobate), Res),
             in(maison(_,_,zebre,_,_), Res),
             in(maison(_,_,_,eau,_), Res).
```

Solution:

- Le zèbre est l'animal du japonais
- L'eau est la boisson du norvégien