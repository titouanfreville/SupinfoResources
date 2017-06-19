# Correction sujet 4AIT - Devoir maison

## Calcul logique

### 1.1 Reformulation

*Chaque dirigeant a donné un formulaire à chaque employé.*

- Dirigeant: J'ai donnée un formulaire à chaque employé.
- Employé: Chaque dirigeant m'a donnée un formulaire.
- Both singulier: Je t'ai donné un formulaire. // J'ai reçu de vous un formulaire
- Both plur: Nous vous avons distribué un formulaire. // Vous nous avez donné un formulaire.

### 1.2 Logique associée

soit d.donne(e) la notation : d a donné un formulaire à e.

- Dirigeant: `∃d∈Dirigeant tel que ∀e∈Employé d.donne_formulaire(e)`
- Employé: `∃e∈Employé tel que ∀d∈Dirigeant d.donne_formulaire(e)`
- Both sing: `∃d∈Dirigeant,  ∃e∈Employé tel que d.donne_formulaire(e)`
- Both plur: `∀d∈Dirigeant, ∀e∈Employé d.donne_formulaire(e)`

donne(D,E,F) <=> dirigeant(D)^employe(E)^formulaire(F)
