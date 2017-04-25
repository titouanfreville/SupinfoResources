# TP 1 Calcul des Proposition

## Generalités

### Sous formules

- (a ∨ b) -> a, b
- (a ∧ b) -> a, b
- (e => f) -> e, f
- (e <=> f) -> e, f
- ¬i -> i
- ((a => b) => b) => ¬(a ∨ b) -> a => b, a ∨ b, (a => b) => b, ¬(a ∨ b), ((a => b) => b) => (¬(a ∨ b)),a , b

### Table de vérité

| A | ¬A |
| - | -- |
| 0 | 1  |
| 1 | 0  |

| A | B | ∨ | ∧ | => | <=> |
| - | - | - | - | -- | --- |
| 0 | 0 | 0 | 0 | 1  | 1   |
| 0 | 1 | 1 | 0 | 1  | 0   |
| 1 | 0 | 1 | 0 | 0  | 0   |
| 1 | 1 | 1 | 1 | 1  | 1   |

### Equivalence à ET et OU

| A | ¬A | B | ¬B | ∨ | ∧ | => | <=> |
| - | -- | - | -- | - | - | -- | --- |
| 0 | 1  | 0 | 1  | 0 | 0 | 1  | 1   |
| 0 | 1  | 1 | 0  | 1 | 0 | 1  | 0   |
| 1 | 0  | 0 | 1  | 1 | 0 | 0  | 0   |
| 1 | 0  | 1 | 0  | 1 | 1 | 1  | 1   |


| A | B | ∧ | ¬(a=>¬b) |
| - | - | - | -------- |
| 0 | 0 | 0 | 0        |
| 0 | 1 | 0 | 0        |
| 1 | 0 | 0 | 0        |
| 1 | 1 | 1 | 1        |



| A | B | ∨ | ¬a=>b |
| - | - | - | ----- |
| 0 | 0 | 0 | 0     |
| 0 | 1 | 0 | 0     |
| 1 | 0 | 0 | 0     |
| 1 | 1 | 1 | 1     |

### Mise sous forme normale conjonctive

```OCaml
(( a => (b ∨ c)) ∧ ((b ∨ d) => (e ∧ f))) ∧ ¬e
( (¬a ∨ b ∨ c) ∧ ( ¬(b ∨ d) ∨ (e ∧ f) ) ) ∧ ¬e
((¬a ∨ b ∨ c) ∧ ( (¬b ∧ ¬d) ∨ (e ∧ f))) ∧ ¬e
( (¬a ∨ b ∨ c) ∧ ¬e ) ∧ ( (¬b ∧ ¬d) ∨ (e ∧ f)) ∧ ¬e )
( (¬a ∨ ¬e) ∧ (b ∨ ¬e) ∧ (c ∨ ¬e) ) ∧ ( (¬b ∧ ¬d ∧ ¬e) ∨ ( e ∧ f ∧ ¬e ))
( (¬a ∨ ¬e) ∧ (b ∨ ¬e) ∧ (c ∨ ¬e) ) ∧ ( (¬b ∧ ¬d ∧ ¬e) ∨ FAUX )
(¬a ∨ ¬e) ∧ (b ∨ ¬e) ∧ (c ∨ ¬e) ∧ ¬b ∧ ¬d ∧ ¬e
```

## Formules à démontrer

### Donner deux totologie

a ∨ ¬a

a <=> a

### Donner une formule élémentaire toujours fausse

a => ¬a

a ∧ ¬a

### Déduire ε des formules suivantes

formules:

- a∨¬b∨c
- d∨¬b∨c
- ¬a∨ d
- ¬a∨b
- ¬a∨¬c
- b∨¬q
- b
- b∨¬c
- ¬c∨¬q
- ¬c∨¬b
- ¬c

![](images/epsilon.png)

### Montrer par réfutation la proposition

```OCaml
(( ( a => (b ∨ c)) ∧ ((b ∨ d) => (e ∧ f)) ) ∧ ¬e ) => (a => c)

¬[ (( ( a => (b ∨ c)) ∧ ((b ∨ d) => (e ∧ f)) ) ∧ ¬e ) => (a => c) ]
¬[ ¬(( ( a => (b ∨ c)) ∧ ((b ∨ d) => (e ∧ f)) ) ∧ ¬e )  ∨ (a => c) ]
¬[ ¬(( ( ¬a ∨ (b ∨ c)) ∧ (¬(b ∨ d) ∨ (e ∧ f)) ) ∧ ¬e )  ∨ (¬a ∨ c) ]
(( ( ¬a ∨ (b ∨ c)) ∧ (¬(b ∨ d) ∨ (e ∧ f)) ) ∧ ¬e ) ∧ ¬(¬a ∨ c)
((( ¬a ∨ b ∨ c) ∧ ((¬b ∨ e)∧(¬b ∨ f) ∨ (¬d ∨ e)∧(¬d ∨ f))) ∧ ¬e ) ∧ a ∧ ¬c

arbre:
```

![](images/preuve_refutation.png)

### L'expression {a=>b, c=>b} ⊧ (a ∨ c) => b satisfiable

![](images/preuve_aoucimpb.png)

## Modelisation de Sequence

### Si la neige tombe, je ne roule pas en voiture

```OCaml
neige => ¬(voiture ∧ rouler)
```

### Je suis à l'heure

```OCaml
moi ∧ onTime
```

### Je suis en retard

```OCaml
¬(moi ∧ onTime)
```

### Je mange, la neige tombe, je ne roule pas en voiture donc je suis en retard

```OCaml
(moi ∧ manger ∧ neige ∧ ¬(voiture ∧ rouler)) => ¬(moi ∧ onTime)
```

### Si je suis en retard, je ne manges pas.

```OCaml
¬(moi ∧ onTime) => ¬(moi ∧ manger)
```

## Modelisation d'un raisonnement

### Raisonnement

```OCaml
  S'il est arrivé tout seul, il a pris sa moto ou le traway.
  S'il a pris le traway ou sa voiture, alors il est arrivé en retard et a manqué la réunion.
  Il n'est pas arrivé en retard. 
  Donc, s'il est venu seul, il a pris sa moto.
```

#### Formalisez l'énoncé en CP

```OCaml
Axiome :
seul => (moto ∨ tram)
(tram ∨ voiture) => (retard ∧ ¬reunion)

Raisonnement:
```

![](images/raisonement_seul.png)

### Enquête

Clauses:

```OCaml
Le premier suspect Mr A dit : Mrs C et D mentent.
Le deuxième suspect Mr B dit : Mrs A et E mentent.
Le troisième suspect Mr C dit : Mrs B et D mentent.
Le quatrième suspect Mr D dit : Mrs C et E mentent.
Et le cinquième suspect Mr E dit : Mrs A et B mentent.
```

Ecriture en proposition logique:

```OCaml
Propositions:
A => ¬(C∧D)
B => ¬(A∧E)
C => ¬(B∧D)
D => ¬(C∧E)
E => ¬(A∧B)

Formule:
(A => ¬(C∧D)) ∧ (B => ¬(A∧E)) ∧ (C => ¬(B∧D)) ∧ (D => ¬(C∧E)) ∧ (E => ¬(A∧B))

Simplification:
(¬A∨¬C∨¬D) ∧ (¬B∨¬A∨¬E) ∧ (¬C∨¬B∨¬D) ∧ (¬D∨¬C∨¬E) ∧ (¬E∨¬A∨¬B)
(¬A∨¬C∨¬D) ∧ (¬A∨¬B∨¬E) ∧ (¬B∨¬C∨¬D) ∧ (¬C∨¬D∨¬E) ∧ (¬A∨¬B∨¬E)
(¬A∨¬C∨¬D) ∧ (¬A∨¬B∨¬E) ∧ (¬A∨¬B∨¬E) ∧ (¬B∨¬C∨¬D) ∧ (¬C∨¬D∨¬E)
(¬A∨¬C∨¬D) ∧ (¬A∨¬B∨¬E) ∧ (¬B∨¬C∨¬D) ∧ (¬C∨¬D∨¬E)
((¬A ∧ ¬B) ∨ (¬C∨¬D)) ∧ (¬C∨¬D∨¬E) ∧ (¬A∨¬B∨¬E)
(¬(A∨B)∨¬(C∧D)) ∧ (¬C∨¬D∨¬E) ∧ (¬A∨¬B∨¬E)
((A∨B) => ¬(C∧D)) ∧ (A => ¬(B∧E)) ∧ (C => ¬(D∧E))
```

Après simplification:

```OCaml
Si A ou B disent la vérité, C et D mentent.
Si A dit vrai, B et E mentent.
Si C dit vrai, D et E mentent.
```

Arbre de résolution:

![](images/enquete.png)

couple solution:
(A,C), (A,B,C), (D,E), (A,B,D,E), (C,E)

A et C mentent:

- D dit vrai ? -> C et E mentent
  - B dit vrai ? -> A et E mentent -> mentent: A,C,E. vrai: B,D
  - B dit faux ? -> A et E mentent -> mentent: A,B,C,E. vrai: D
- D dit faux ? -> 
  - E dit vrai ? -> A et B mentent -> mentent: A,B,C,D. vrai: E
  - E ment ? -> 
    - B dit vrai ? -> mentent: A,C,D,E. vrai: B.
    - B ment -> mentent A,B,C,D,E
     
A,B,C mentent:

- D dit vrai ? -> C et E mentent -> A et E mentent -> mentent: A,B,C,E. vrai: D
- D dit faux ? -> 
  - E dit vrai ? -> mentent: A,B,C,D. vrai: E
  - E ment ? -> mentent A,B,C,D,E
 
A,B,D,E mentent: 

- C vrai -> mentent: A,B,D,E vrai: C
- C faux -> mentent A,B,C,D,E

D,E mentent: 

- C dit vrai ? -> B et D mentent
  - A dit vrai ? -> C et D mentent -> contradiction
  - A ment ? -> mentent: A,B,D,E, vrai: C
- C ment ? -> 
  - B dit vrai ? -> A et E mentent -> mentent: A,C,D,E vrai: B
  - B dit faux ? -> 
    - A dit vrai ? -> C et D mentent -> mentent: B,C,D,E vrai: A
    - A ment ? -> mentent: A,B,C,D,E

C,E mentent:
- D dit vrai ->
- B dit vrai ? -> A et E mentent -> mentent: A,C,E vrai: B,D
- B dit faux ? -> 
  - A dit vrai ? -> C et D mentent -> contradiction
  - A dit faux ? -> mentent: A,B,C,E vrai: D

Conclusion: A ment très probablement. Si A dit vrai, tous les autres mentent.