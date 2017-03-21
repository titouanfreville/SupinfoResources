# TP 1 Calcul des Proposition

## Generalités

### Sous formules

- (a ∨ b) -> a ∨ b
- (a ∧ b) -> a ∧ b
- (e => f) -> e => f
- (e <=> f) -> e <=> f
- ¬i -> ¬i
- ((a => b) => b) => ¬(a ∨ b) -> a => b, a ∨ b, (a => b) => b, ¬(a ∨ b), ((a => b) => b) => (¬(a ∨ b))

### Table de vérité

| A | ¬A |
| - | -- |
| 0 | 1  |
| 1 | 0  |

| A | B | ∨ | ∧ | => | <=> |
| - | - | - | - | -- | --- |
| 0 | 0 | 0 | 0 | 1  | 1   |
| 0 | 1 | 1 | 0 | 1  | 0   |
| 1 | 0 | 1 | 0 | 0  | 0   |
| 1 | 1 | 1 | 1 | 1  | 1   | 

### Equivalence à ET et OU

| A | ¬A | B | ¬B | ∨ | ∧ | => | <=> |
| - | -- | - | -- | - | - | -- | --- |
| 0 | 1  | 0 | 1  | 0 | 0 | 1  | 1   |
| 0 | 1  | 1 | 0  | 1 | 0 | 1  | 0   |
| 1 | 0  | 0 | 1  | 1 | 0 | 0  | 0   |
| 1 | 0  | 1 | 0  | 1 | 1 | 1  | 1   | 


| A | B | ∧ | ¬(a=>¬b) |
| - | - | - | -------- |
| 0 | 0 | 0 | 0        |
| 0 | 1 | 0 | 0        | 
| 1 | 0 | 0 | 0		   |
| 1 | 1 | 1 | 1		   |



| A | B | ∨ | ¬a=>b |
| - | - | - | ----- |
| 0 | 0 | 0 | 0     |
| 0 | 1 | 0 | 0     | 
| 1 | 0 | 0 | 0	    |
| 1 | 1 | 1 | 1	    |

### Mise sous forme normale conjonctive

(( a => (b ∨ c)) ∧ ((b ∨ d) => (e ∧ f))) ∧ ¬e

-> ( (¬a ∨ b ∨ c) ∧ ( ¬(b ∨ d) ∨ (e ∧ f) ) ) ∧ ¬e
-> ((¬a ∨ b ∨ c) ∧ ( (¬b ∧ ¬d) ∨ (e ∧ f))) ∧ ¬e
-> ( (¬a ∨ b ∨ c) ∧ ¬e ) ∧ ( (¬b ∧ ¬d) ∨ (e ∧ f)) ∧ ¬e )
-> ( (¬a ∨ ¬e) ∧ (b ∨ ¬e) ∧ (c ∨ ¬e) ) ∧ ( (¬b ∧ ¬d ∧ ¬e) ∨ ( e ∧ f ∧ ¬e ))
-> ( (¬a ∨ ¬e) ∧ (b ∨ ¬e) ∧ (c ∨ ¬e) ) ∧ ( (¬b ∧ ¬d ∧ ¬e) ∨ FAUX )
-> (¬a ∨ ¬e) ∧ (b ∨ ¬e) ∧ (c ∨ ¬e) ∧ ¬b ∧ ¬d ∧ ¬e

## Formules à démontrer

### Donner deux totologie

a ∨ ¬a

a <=> a

### Donner une formule élémentaire toujours fausse

a => ¬a
a ∧ ¬a

### Déduire ε dans les forumles suivantes

Do not know yet. 

### Montrer par réfutation la proposition : 
(( ( a => (b ∨ c)) ∧ ((b ∨ d) => (e ∧ f)) ) ∧ ¬e ) => (a => c)
  