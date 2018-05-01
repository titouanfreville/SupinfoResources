:-use_module(library(clpfd)).

greater(X,Y,R):-X<Y, R is Y,!.
greater(X,Y,R):-X >= Y, R is X, !.

val(X, Y, Res, Rest) :- Res is mod(X+Y,10) , Rest = ((X+Y-Res)/10).
val(X, Y, PRest, Res, Rest) :- Res is mod(X+Y+PRest,10) , Rest = ((X+Y+PRest-Res)/10).
% Prédicat estPresent:
estPresent(A,[A|_]):- !.
estPresent(A,[_|X]):- estPresent(A,X).
% Prédicat tousDifferents
tousDifferents([]).
tousDifferents([T|Q]):- not(estPresent(T,Q)), tousDifferents(Q).

code(L) :- L = [A, B, C, D, E, F, G, H, I, J], 
    L ins 0..9,
    A #> 4, I #> A, F #< 5,
    val(E,C,J,R1), val(D,I,R1,C,R2), val(C,H,R2,D,R3), val(B,G,R3,H,R4), val(A,F,R4,I,0),
    tousDifferents(L).