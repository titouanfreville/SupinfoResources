# TP 3 - Les Automates

## Automates Binaire

### Automates binaire simple

![](images/automate_binaire_simple.png)

### Automates binaire sans bites non significatifs

![](images/automates_binaire_no_unsig_bites.png)

## Morse

![](images/morse.png)

## ER

### a\*b\*c

![](images/er1_a*b*c.png)

### (ab)⁺

![](images/er2_ab+.png)

### c|(a⁺b\*)

![](images/er3.png)

## Automates à Pile

### Calcul 10+11

Automate = (S, ∑, P, T, q0, $, F)



S = {1, 0, +}

∑ = {1,0,+}

P = {$,p0,p1,p+}

q0 = {1}

$ = {$}

F = {1}




T : {

   (1, 1, $) -> (1, $p1)
   
   (1, 0, $p1) -> (0, $p1p0)
   
   (0, +, $p1p0) -> (+, $p1p0p+)
   
   (+, 1, $p1p0p+) -> (1, $p1p0p+p1)
   
   (1, 1, $p1p0p+p1) -> (1,  ε)
   
}



Config = {

   (1,1,$) |- (1,  ε, $p1)
    
   (1, 0, $p1) |- (0,  ε, $p1p0)
   
   (0, +, $p1p0) |- (+,  ε, $p1p0p+)
   
   (+, 1, $p1p0p+) |- (1,  ε, $p1p0p+p1)
   
   (1, 1, $p1p0p+p1) |- (1,  ε) **->** Accepté
   
}

![](images/pile_addition_1.png)

### Lecture 180+26

Automate = (S, ∑, P, T, q0, $, F)



S = {N, +}

∑ = {1,8,0,6,+,2}

P = {$,p0,p1, p2, p8, p+}

q0 = {1}

$ = {$}

F = {N}




T : {

   (N, 1, $) -> (N, $p1)
   
   (N, 8, $p1) -> (N, $p1p8)
   
   (N, 0, $p1p8) -> (+, $p1p8p0)
   
   (+, +, $p1p8p0) -> (N, $p1p8p0p+)
   
   (N, 2, $p1p8p0p+) -> (N, $p1p8p0p+p2)

   (N, 6, $p1p8p0p+p2) -> (N,  ε)
   
}



Config = {

   (N, 1, $) |- (N,  ε, $p1)
   
   (N, 8, $p1) |- (N,  ε, $p1p8)
   
   (N, 0, $p1p8) |- (+,  ε, $p1p8p0)
   
   (+, +, $p1p8p0) |- (N,  ε, $p1p8p0p+)
   
   (N, 2, $p1p8p0p+) |- (N,  ε, $p1p8p0p+p2)

   (N, 6, $p1p8p0p+p2) |- (N,  ε) **->** Accepté
   
}

![](images/pile_lecture_1.png)

### Lecture 180+26=

Automate = (S, ∑, P, T, q0, $, F)



S = {N, S}

∑ = {1,8,0,+,2,6}

P = {$,p0,p1, p2, p6, p8, p+}

q0 = {1}

$ = {$}

F = {S}




T : {

   (N, 1, $) -> (N, $p1)
   
   (N, 8, $p1) -> (N, $p1p8)
   
   (N, 0, $p1p8) -> (S, $p1p8p0)
   
   (S, +, $p1p8p0) -> (N, $p1p8p0p+)
   
   (N, 2, $p1p8p0p+) -> (N, $p1p8p0p+p2)

   (N, 6, $p1p8p0p+p2) -> (S, $p1p8p0p+p2p6)

   (S, =, $p1p8p0p+p2p6) -> (S,  ε)
   
}



Config = {

   (N, 1, $) |- (N,  ε, $p1)
   
   (N, 8, $p1) |- (N,  ε, $p1p8)
   
   (N, 0, $p1p8) |- (+,  ε, $p1p8p0)
   
   (+, +, $p1p8p0) |- (N,  ε, $p1p8p0p+)
   
   (N, 2, $p1p8p0p+) |- (N,  ε, $p1p8p0p+p2)

   (N, 6, $p1p8p0p+p2) |- (N,  ε, $p1p8p0p+p2p6)
   
   (S, =, $p1p8p0p+p2p6) |- (S,  ε) **->** Accepté
   
}

![](images/pile_lecture_2.png)
