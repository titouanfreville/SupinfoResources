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
