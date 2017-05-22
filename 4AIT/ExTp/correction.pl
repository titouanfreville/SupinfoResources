% Prédicat estPresent:
estPresent(A,[A|_]):- !.
estPresent(A,[_|X]):- estPresent(A,X).

% Prédicat tousDifferents
tousDifferents([]).
tousDifferents([T|Q]):- not(estPresent(T,Q)), tousDifferents(Q).

% Prédicat tailleList
tailleList([],0).
tailleList([_|Q], R):- tailleList(Q,OldR), R is OldR + 1.

% Prédicat tailleOk
tailleOk(List, WantedSize):- tailleList(List,R), R == WantedSize.

%% ~ 15 mins to get here. 

% Prédicat afficheMatrice
%% Solution simple:
%% 30s
% afficheMatrice(L, _, _):- writef('%w %w %w\n%w %w %w\n%w %w %w\n', L).

%% ~ 10 min
%% Solution Adaptable: affiche nimporte qu'elle liste sous forme matricielle.
afficheMatrice([],_,_).
afficheMatrice([T|Q], I, J):- I == J, NewI is 1, writef('%w\n', [T]), afficheMatrice(Q, NewI, J).
afficheMatrice([T|Q], I, J):- not(I == J), NewI is I+1, writef('%w ', [T]), afficheMatrice(Q, NewI, J), !.

% Prédicat carreMagique
% sommeList([],0).
% sommeList([X|Q], R):- tailleList(Q,OldR), R is OldR + X.


% ligneMatrice([],_,_,List):- List is [].
% ligneMatrice([_|Q], I, J, IInd, List):- not(I == J), NewI is I+1, not(I == IInd), ligneMatrice(Q, NewI, J, IInd, List),!.
% ligneMatrice([_|Q], I, J, IInd, List):- I == J, NewI is 1, not(I == IInd), ligneMatrice(Q, NewI, J, IInd, List),!.
% ligneMatrice([T|Q], I, J, IInd, NewList):- not(I == J), NewI is I+1, I == IInd, ligneMatrice(Q, NewI, J, IInd, List),  NewList is [T|List],!.
% ligneMatrice([T|Q], I, J, IInd, NewList):- I == J, NewI is 1, I == IInd, ligneMatrice(Q, NewI, J, IInd, List), NewList is [T|List],!.

% Module for fun with ensemble.
:-use_module(library(clpfd)).

carreMagique(Matrice, R):-  Matrice=[A0,A1,A2,B0,B1,B2,C0,C1,C2],
                            Matrice ins 1..9,
                            A0+A1+A2#=R, B0+B1+B2#=R , C0+C1+C2#=R, A0+B1+C2#=R, A2+B1+C0#=R,
                            A0+B0+C0#=R, A1+B1+C1#=R, A2+B2+C2#=R,
                            labeling([], Matrice),
                            tousDifferents(Matrice),
                            afficheMatrice(Matrice,1,3).

% all solutions: 
% Res = [2, 7, 6, 9, 5, 1, 4, 3, 8] ;
% Res = [2, 9, 4, 7, 5, 3, 6, 1, 8] ;
% Res = [4, 3, 8, 9, 5, 1, 2, 7, 6] ;
% Res = [4, 9, 2, 3, 5, 7, 8, 1, 6] ;
% Res = [6, 1, 8, 7, 5, 3, 2, 9, 4] ;
% Res = [6, 7, 2, 1, 5, 9, 8, 3, 4] ;
% Res = [8, 1, 6, 3, 5, 7, 4, 9, 2] ;
% Res = [8, 3, 4, 1, 5, 9, 6, 7, 2] ;
