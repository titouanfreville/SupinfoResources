# TP 2 - Les Expressions Régulières

## 1 - Langages

∑ = {L, C}, avec L= {a,b,...,z} et C={0,1,..,9}

### 1 - ER représetant l'ensemble des lettres et l'ensemble des chiffres de ∑

L+C

### 2 - ER représeant les mots de logueur 2 composé en alternance d'une lettre et d'un chiffre sur ∑

(L+C)(C+L)

### 3 - ER représentant les nombres de ∑

C⁺

### 4 - ER chaînes de lettre de longuer 4

LLLL

### 5 - Chaînes quelconques commençant par une lettre

L(L+C)\*

## 2 - Réécriture

∑ =  {Nom, Maj, min, sep}, avec Maj= {A,B,...,Z}, min= {a,b,...,z}, sep={., }, Nom={Maj,min\*}

F1 = NomsepMaj(min)\*

F2 = MajsepsepNom (?)

## 3 - Signification des expressions

### (aa)⁺

Chaines de double a avec au moins un éléments (aa) (aaaa) (aaaa......)

### b|a*

Expression b ou vide ou toutes suites d'expression a (b) (epsilon) (a...)

### a(a|b)*a

Chaines dont les extrèmes sont a et l'interieur une suite quelconque de a ou b (aa) (a∑a), ∑= a ou b
