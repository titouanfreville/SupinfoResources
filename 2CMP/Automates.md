# TP 3 - Les Automates

## Automates Binaire

### Automates binaire simple

![](automate_binaire_simple.png)

### Automates binaire sans bites non significatifs

![](automates_binaire_no_unsig_bites.png)

## Morse

![](morse.png)

## ER

### a\*b\*c

![](er1_a*b*c.png)

### (ab)⁺

![](er2_ab+.png)

### c|(a⁺b\*)

![](er3.png)

## Automates à Pile

### Calcul 10+11

Automate = (S, ∑, P, T, q0, $, F)



S = {1, 0, +}

∑ = {1}

P = {$,p0,p1,p+}

q0 = {1}

$ = {$}

F = {1}




T : {

   (1, 1, $) -> (1, $p1)
   
   (1, 0, $p1) -> (0, $p1p0)
   
   (0, +, $p1p0) -> (+, $p1p0p+)
   
   (+, 1, $p1p0p+) -> (1, $p1p0p+p1)
   
   (1, 1, $p1p0p+p1) -> (1, Epsilon)
   
}



Config = {

   (1,1,$) |- (1, Epsilon, $p1)
    
   (1, 0, $p1) |- (0, Epsilon, $p1p0)
   
   (0, +, $p1p0) |- (+, Epsilon, $p1p0p+)
   
   (+, 1, $p1p0p+) |- (1, Epsilon, $p1p0p+p1)
   
   (1, 1, $p1p0p+p1) |- (1, Epsilon) *->* Accepté
   
}

![](pile_addition_1.png)

### Lecture 180+26

Automate = (S, ∑, P, T, q0, $, F)



S = {N, +}

∑ = {N}

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

   (N, 6, $p1p8p0p+p2) -> (N, Epsilon)
   
}



Config = {

   (N, 1, $) |- (N, Epsilon, $p1)
   
   (N, 8, $p1) |- (N, Epsilon, $p1p8)
   
   (N, 0, $p1p8) |- (+, Epsilon, $p1p8p0)
   
   (+, +, $p1p8p0) |- (N, Epsilon, $p1p8p0p+)
   
   (N, 2, $p1p8p0p+) |- (N, Epsilon, $p1p8p0p+p2)

   (N, 6, $p1p8p0p+p2) |- (N, Epsilon) *->* Accepté
   
}

![](pile_lecture_1.png)

### Lecture 180+26=

Automate = (S, ∑, P, T, q0, $, F)



S = {N, S}

∑ = {N}

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

   (S, =, $p1p8p0p+p2p6) -> (S, Epsilon)
   
}



Config = {

   (N, 1, $) |- (N, Epsilon, $p1)
   
   (N, 8, $p1) |- (N, Epsilon, $p1p8)
   
   (N, 0, $p1p8) |- (+, Epsilon, $p1p8p0)
   
   (+, +, $p1p8p0) |- (N, Epsilon, $p1p8p0p+)
   
   (N, 2, $p1p8p0p+) |- (N, Epsilon, $p1p8p0p+p2)

   (N, 6, $p1p8p0p+p2) |- (N, Epsilon, $p1p8p0p+p2p6)
   
   (S, =, $p1p8p0p+p2p6) -> (S, Epsilon) *->* Accepté
   
}

![](pile_lecture_2.png)
