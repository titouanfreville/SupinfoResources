pere(jean, pierre).
pere(pierre,jules).
pere(jules,gaspard).

ancetre(X,Y):-pere(X,Y).
ancetre(X,Y):-pere(X,U), ancetre(U,Y).

%%
factoriel(1,1):-!.
factoriel(N,Res):- NewN is N - 1,
    factoriel(NewN, Res1), Res is N*Res1.

%%
arc(a,b).
arc(b,c).
arc(c,d).
arc(c,e).
arc(a,e).

chemin(X,Y):-arc(X,Y).
chemin(X,Y):-arc(X,Z), chemin(Z,Y).

length_chemin(X,X,0):-!.
length_chemin(X,Y,V):-arc(X,Z), length_chemin(Z,Y,NV), V is NV + 1.

%% Pair
pair([], []):-!.
pair([X|Q],Res):- 0 is X mod 2, pair(Q, NR), Res = [X|NR], !.
pair([_|Q],Res):- pair(Q, Res).

%% Longueur liste
length_list([],0):-!.
length_list([_|Q], R) :- length_list(Q,NR), R is NR + 1.