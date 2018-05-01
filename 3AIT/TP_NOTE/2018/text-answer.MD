# Correction TP noté 2018

*temps correcteur: 2h 10mins (vitesse moyenne)*

## Résumé des difficultés et connaissances nécessaires

- **SAVOIR LIRE UN SUJET**
- Bien lire le sujet, identifié les questions faciles
- Résoudre le sujet dans l'ordre vous donant le plus de points
- Les questions les plus simples du sujet *12pts*:
- - Tout l'exercice 1
- - Exercice 4 question 1 et 2
- - Exercice 3 question 1, 3 et 6.
- Théorie de la Programmation fonctionnelle (forme des constructeurs et des sélecteurs) (6pts)
- Connaissance basique du fonctionnement des Systèmes Experts
- Bonne compréhension des système récursif
- Compréhension basique à correcte de lisp
- Connaissance général de Python
- Pour avoir la totalité des points:
- - très bonne comprhéension de python et de lisp
- - bonne bases mathématiques (pour la dernière question)

Conclusion: Il était largement possible de récupérer les 11 points des questions simple en 4h avec l'accés au supports. Obtenir une note supérieure à 15 demande une bonne compréhension de la récursivité et des languages de programmation Lisp et Python, et un bon niveau mathématique.

## Ex 1: Programmation Fonctionnelle (Théorie)

### 1.1 Ecrire au sens des sélecteurs ou des constructeurs a fonction récursive NB comptant le nombre d'atome dans une liste

*atome: élément d'une liste n'étant pas lui-même une liste*

Création de la fonction **NB**

Soit **NB** une fonction d'arité 1 prenant une liste quelconque en argument et renvoyant un entier.

Sens des Sélecteur:

```OCaml
NB(liste) -> int
Selon liste:
    Vide(liste) -> 0
    True -> 1 + NB(Suite(liste))
```

Sens des Constructeur:

```OCaml
NB(liste) -> int
Selon liste:
    [] -> 0
    t°Q -> 1 + NB(Q)
```

### 1.2 écrire la fonction VF qui vérifie si une liste contient des sous listes contenant le même nombre d'atome (dans chaque sous-listes)

Pour réaliser cette fonction nous avons plusieurs solutions, et plusieurs besoin. Tout d'abord, il nous faut être capable de savoir combien d'atome contient chaque sous listes. Nous pouvons réutilisé la fonction NB définis dans la question précédente. Ensuite, nous avons plusieur possibilité. La question n'étant pas de savoir si **toutes** les sous-listes contiennent le même nombre d'atome mais si au moins deux des sous listes contiennent le même nombre d'atome, il nous est possible d'utiliser des accumulateurs pour stocker les différentes tailles de listes, puis les comparers pour voir si nous en trouvons 2 identiques. Nous pouvons aussi comparé sous-listes a sous-listes le nombre d'atome, etc.

La solution la plus simple a coder est la suivant:

- Remplacer chaque sous liste par son nombre d'atome
- Trier la liste
- Comparer les tailles consécutive jusqu'à en trouver deux identiques

Soit **MapAtome** une fonction d'arité prenant une liste quelconque et renvoyant une liste d'entiers.

Soit **QuickSort** la fonction de trie optimal (décomposé en trois partie, **QuickSort**, **Split** et **Fuse**) d'arité 1 prenant une liste d'entier et renvoyant cette même liste trié par ordre croissant.

Soit **VF** une fonction d'arité 1 prenant une liste quelconque en argument et renvoyant un booléen.

Au Sens des Constucteur:

```OCaml
MapAtome(list) -> int list
Selon list:
    [] -> []
    t°Q -> NB(t)°(MapAtome Q)

Split(list) -> list
Selon list:
    [] -> []
    t°[] -> (t,[])
    t1°t2°Q -> Soit (l1, l2) = Split(Q) dans
        (t1°l1,t2°l2)

Fuse(list1, list2) -> list
Selon list1, list2:
    [], _ -> list2
    _, [] -> list1
    t1°Q1, t2°Q2 ->
        Si t1 < t2
        alors t1°Fuse(Q1, list2)
        Sinon t2°Fuse(list1, Q2)

QuickSort(list) -> list
Selon list:
    [] -> []
    t°[] -> [t]
    _ -> Soit l1, l2 = Split(list) dans
        Fuse(QuickSort(l1), QuickSort(l2))

VF_Rec(liste) -> bool
Selon liste:
    [] -> False
    t°[] -> False
    e1°e2°Q -> e1 == e2 || VF_Rec(Q)

VF(liste) -> bool
Selon liste:
    VF_Rec(QuickSort(MapAtome(liste)))
```

Cette solution réimplémente des fonction connue dans la majorité des langages. La fonction *MapAtome* peut être écrite en utilisant la fonction build-in de la majorité des languages de programmation actuelle *Map* appliquée à la *liste* et a la fonction *NB*. La fonction *QuickSort* est généralement implémenté sous le nom de *sort* en build-in. Ce qui laisse les 2 dernières fonctions uniquement à écrire.

### 1.3 Ecrire VLA la fonction récursive vérifiant que le nombre d'atome de chaque sous liste d'une liste est égal au nombre de sous liste de cette liste

Nous pouvons nous baser sur le même schéma que pour la fonction précédente. Il nous faut en plus connaitre le nombre de sous-liste. Cela peut se faire avec une fonction similaire à **NB** ou après le remplacement des élément de la liste principale par le nombre d'atome dans chaque sous liste (si un élément n'est pas une sous-liste, il aura la valeur 0). Nous pouvons alors supprimer les 0 de la liste puis comparer sa taille à chaque élément ou calculer le nombre d'élément différent de 0 et vérifier s'ils sont identique.

Soit *VLA* la fonction d'arité 1 prenant une liste quelconque en argument et renvoyant un booléen.

```OCaml
VLA_Rec(liste, prev, size) -> bool
Selon liste:
    [] -> prev == size
    t°Q ->
        Si t == 0 alors VLA_Rec(Q, prev)
        Sinon
            Si prev == -1
            Alors VLA_Rec(Q, t, size+1)
            Sinon
                t == prev et VLA_Rec(Q, prev, size+1)

VLA(liste) -> bool
    VLA_Rec(QuickSort(MapAtome(liste)))
```

## Ex 2: Le Problème Lisp

### 2.1: Donnez le résultat de l’expression

```Lisp
(and
    (defun E()
        (lambda (A B)
            (cond
                ((< A 20) (expt B 10))
                (T "Confirmez-moi le résultat obtenu ?")
            )
        )
    )
    (funcall (E) *read-base* *print-base*)
)
```

Copier coller dans l'interpréteur lisp. Résultat: `10000000000`

### 2.2: Expliquez ce que fait l'expression ligne par ligne

- `and`: Opérateur logique. Ici, utiliser pour lier la définition et l'appel de la fonction *E*.
- `defun E()`: Début de définition de la fonction nomée *E* d'arité 0.
- `lambda (A B)`: Création d'une fonction anonyme d'arité 2.
- `cond`: entrée dans un match conditionnel.
- `(< A 20) (expt B 10)`: Si A < 20, mise a la puissance de B (B^10).
- `T "...."`: affiche "....".
- `funcall (E) ...`: appel de la fonction E avec les valeurs `read-base` (lecture de la base naturel de l'interpréteur) et `print-base` écrivant la valeur de la base dans l'interpréteur.

Comment est obtenue le résultat.

Lors de l'éxecution, la fonction E est créer puis appelé avec `*read-base*` et `*print-base*`. La base naturelle étant `10`, nous sommes dans le premier de la condition lors de l'appel de la fonction. La valeur de `*print-base*` est donc mis à la puissance 10.

### 2.3: Modifier l'expression pour afficher la phrase

Plusieurs réponse possible:

- Supprimer la ligne `(< A 20) ...` -> l'expression devient inutile et affichera toujours le message.
- Modifier la valeur d'appel `*read-base*` pour une valeur > 20.
- Modifier le sens de comparaison `< A 20` en `> A 20`.
- Inverser la partie `(expt B 10)` et le message.
- Modifier la valeur de comparaison `20` pour une valeur < 10.
- Faire une opération sur le `A` pour le rendre > 20 (ex `(< (+ A 20) 20)`).

### 2.4: Ecrire une fonction **F** permettant de calculer les résulats

```Lisp
(funcall (F) 0) -> 0
(funcall (F) 5) -> 9765625
(funcall (F) 3) -> 59049
(funcall (F) 19) -> 6131066257801
(funcall (F) 20) -> "Confirmez-moi le résultat obtenu?"
                        "Oui il s'agit d’un 20"
(funcall (F) 25) -> " Confirmez-moi le résultat obtenu?"
                        "Oui il s'agit d’un 25"
```

Ici, *F* est une variant de l'expression donné précédemment.

Nous pouvons l'écrire ainsi:

```Lisp
(defun F()
    (lambda(x)
        (cond
            ((< x 20) (expt x 10))
            (T (and (print "Confirmez-moi le résultat obtenu ?") (format () "Oui il s'agit : ~A " x)))
        )
    )
)
```

### 2.5: Implémenter expt2 ayant les mêmes effet que expt

`expt` est la fonction puissance.

```Lisp
(defun expt2 (a b)
    (cond
        ((eq b 0) 1)
        (T (* (expt2 a (- b 1))))
    )
)
```

### 2.6: Modifié F pour utilisé `expt2` et proposer un ensemble de test

La nouvelle fonction F est:

```Lisp
(defun F()
    (lambda(x)
        (cond
            ((< x 20) (expt2 x 10))
            (T (and (print "Confirmez-moi le résultat obtenu ?") (format () "Oui il s'agit : ~A " x)))
        )
    )
)
```

Soit la même fonction en remplaçant `expt` par `expt2`.

Le jeu de test est dans l'énoncé:

```Lisp
(funcall (F) 0) -> 0
(funcall (F) 5) -> 9765625
(funcall (F) 3) -> 59049
(funcall (F) 19) -> 6131066257801
(funcall (F) 20) -> " Confirmez-moi le résultat obtenu?"
                    "Oui il s'agit d’un 20"
(funcall (F) 25) -> " Confirmez-moi le résultat obtenu?"
                    "Oui il s'agit d’un 25"
```

## Ex 3: Le Système Python

### 3.1 `F = lambda L: L.reverse()`

La fonction **F** inverse une liste passé en argument. Elle s'appelle : `F(list)`, nous pouvons récupérer le résultat en l'affectant à une variable `L=F(L)` ou en l'affichant `print(F(L))`

### 3.2 écrire une fonction en Python nommée EG d’arité 2 qui élimine toutes les valeurs à gauche d’une valeur donnée

Fonction données:

```Python
car = lambda liste: liste[0]
cdr = lambda liste: liste[1:]
membre = lambda a, liste : a in liste
```

Solution simple: se déplacer jusqu'à l'élément voulu, renvoyer la liste restante.

```Python
def EG(a, liste):
    if not membre(a, liste):
        return liste
    if car(liste) == a:
        return liste
    return EG(a, cdr(liste))
```

### 3.3 Réaliser la fonction S calculant le produit de tout les éléments d'une liste jusqu'au dernier élément pair

```Python
def Product(list):
    if list == []:
        return 1
    return int(car(list))*Product(cdr(list))

def S(list):
    if list == []:
        return 1
    if int(list[-1])%2 == 0:
        return Product(list)
    return Product(list[0:-1])
```