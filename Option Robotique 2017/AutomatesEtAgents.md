# Automates et Agents

## Horloge

### Combien d'état

2 états sont suffisant. 1 pour le calcul et 1 pour l'affichage.

### Fonction de transfert

Soit Time et Aff les deux états de l'automate.

Init : Ecrire 0:00, Aff et (int s = 0, int h =0, int m = 0), Time

+1, s<59, time -> s+1, Time
+1, s=59, m<59 -> s=0, m+1, Time et Afficher h:m, Aff
+1, s=59, m=59, h <12/24 -> s=0, m=0, h+1, Time et Afficher h:m, Aff
+1, s=59, m=59, h )12/24 -> s=0, m=0, h=0, Time et Afficher h:m, Aff

### RG

![](images/horloge.png)

## Ouverture serrure

### Dessiner l'automate

![](images/serrure_erreurs_count.png)

### Explication

Lors du dévérouillage, l'utilasteur commence par rentré des lettres de codes. Tant qu'un 8 n'est pas saisie, le processus de dévérouillage ne commence pas. Après saisie du premier 8, si l'utilisateur saisie une erreur (ex: 5), celui-ci vas aller dans l'état erreur en incrémentant la valeur de ne (nombre d'erreur). De cet état, si ne est inférieur à 4 (ce qui est le cas pour le moment), il renvois vers l'état de provenance (ici, 8). Ensuite, si l'utilisateur saisie le code correct, il passera par les états 88, puis 885, puis Open (qui ouvrira la serrure avant la prochaine fermeture). Sinon, à chaque erreur, on entre dans l'état Err en incrémentant ne. Si celui-ci atteint 4, on redirige vers l'état d'entré Close.

### Ouverture code contigüe

![](images/serrure_erreurs_follow.png)

### Algorithme

#### Fonctionnel (OCaml formated)

``` OCaml
maxErr int.
enter int.

(*func Close: int -> ('a -> 'b)*)
let rec Close err =
  err > maxErr
  && Locked()
  || begin
    Wait (enter)
    match enter with
    | 1 |5 -> Close (err+1)
    | 8 -> Step (8, err)
  end

(*func Locked: unit -> ('a -> 'b)*)
let rec Locked =
  Wait (24h) && Close 0

(*func Step: int * int -> ('a -> 'b)*)
let rec Step (val, err) =
  Wait (enter)
  && match (enter, val) with
    | 8, 8  -> Step(5, err)
    | 5, 5 -> Step(1, err)
    | 1, 1 -> Open()
    | _ -> Close(err+1)

(*func Open: unit -> unit*)
let Open =
  "Openned"
```

#### Impératif (C formated)

```C
#include <stdio.h>
#include <unistd.h>

MAXERR int

int Closed(&int err) {
  int c;
  if (err > MAXERR) {
    Locked();
    *err = 0;
    return 1;
  };
  c = getchar();
  if (c=8) {
    return Step(8, err);
  };
  *err=*err+1;
  return 1;
}

int Step(int stepval, &int err) {
  int c;
  c = getchar();
  switch c {
    case 1:
      if (stepval =1) {
        return Open();
      } else {
        *err = *err +1;
        return Close(err);
      };
      break;;
    case 5:
      if (stepval =5) {
        return Step(1, err);
      } else {
        *err = *err +1;
        return Close(err);
      };
      break;;
    case 8:
      if (stepval =8) {
        return Step(5, err);
      } else {
        *err = *err +1;
        return Close(err);
      };
      break;;
    default:
      *err = *err +1;
      return Close(err);
  }
}

void Locked(void) {
  sleep(86400);
}

int Open(void) {
  printf("Openned");
  return 0;
}

int main(void){
  int openned = 1;
  int err = 0;
  while (openned != 0) {
    openned = Close(&err);
  }
  return 0;
}
```