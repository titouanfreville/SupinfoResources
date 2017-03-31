% <><><><><><><><><><><><><><><><> 5.1 CUBES  <><><><><><><><><><><><><><><><> %
% Make base existant for program.
initEnv():- asserta(link(vide,base)).
% Add assertion
addRule(Predicate, X, Y) :-
    Fact =.. [Predicate, X, Y],
    assertz(Fact).
% User input
/**
    @descr Init Cube is here to initialise the program. It will ask the user to setup the cubes he want. 
    @form initCube()
*/
initCube() :- writef('Veuillez entrez une disposition initiale de cubes : \n'), writef('Cubes liés ? [0,1]'), read(L), nl, addCubes(L), writef('Entrez de nouveaux cubes ? [0,1]'), read(E), E =:= 0, initCube().
addCubes(L):- L =:= 0, writef('Entrez les cubes liés (C1 -> C2 // C2 sur C1): \nCube 1: '), read(C1), writef('Cube 2: '), read(C2), addRule(link,C1,C2).
addCubes(L):- L=\=0, writef('Entrez le cube: '), read(C), addRule(link,base, C).
% Output
printCubes():- writef('Current cube state: \n'), link(base, X), writef('base '), printCubeList(X).
printCubeList(X):- not(link(X,_)), writef('-> %w -> vide\n', [X]).
printCubeList(X):- link(X,Val), writef('-> %w ', [X]), printCubeList(Val).
% Clean all
resetCubeEnv():- retractall(link(_,_)), initEnv().
% Move cube
move(_,base,_).
move(C,B,base):- not(link(C,_)), link(B,C),retract(link(B,C)), addRule(link,base,C).
move(C,B1,B2):- not(link(C,_)), link(B1,C), link(_,B2), not(link(B2,_)), retract(link(B1,C)), addRule(link,B2,C).
% Solve problem
placeCube(A,B):- link(B,A), writef('Cube %w is already over cube %w \n', [A,B]), printCubes(), !.
placeCube(A,B):- link(Base, A), move(A, Base, B), printCubes(), !.
placeCube(A,B):- link(A,E), move(E,A,base), placeCube(A,B).
placeCube(A,B):- link(B,E), move(E,B,base), placeCube(A,B).
% <><><><><><><><><><><><><><><><> <><><><> <><><><><><><><><><><><><><><><><> %
% <><><><><><><><><><><><><><><><> 5.2 QUEENS <><><><><><><><><><><><><><><><> %
removeDuplicates([], []).
removeDuplicates([T|Q], NewList):- member(T,Q), removeDuplicates(Q, NewList).
removeDuplicates([T|Q], [T|List]):- not(member(T, Q)), removeDuplicates(Q, List).
%initBases() :- assert(chessLink(0,1)), assert(group(-1,[])), assert(groupLink(0,1,[])).
%add Case link to chessBoard
addChessLink(X,Y):- assertz(chessLink(X,Y)), assertz(chessLink(Y,X)).
%Init chess board (no functor yet).
initChess():- assert(chessLink(0,1)), assert(chessLink(1,0)), addChessLink(1,2),
addChessLink(0,3), addChessLink(0,4), addChessLink(1,3), addChessLink(1,4), addChessLink(1,5), addChessLink(2,4), addChessLink(2,5),
addChessLink(3,4), addChessLink(4,5),
addChessLink(3,6), addChessLink(3,7), addChessLink(4,6), addChessLink(4,7), addChessLink(4,8), addChessLink(5,7), addChessLink(5,8),
addChessLink(6,7), addChessLink(7,8).
% Regroup reacheable states into sommit
newGroup(Key,List):- assertz(group(Key,List)). 
newLinkGroup(Key1, Key2, List):- assertz(groupLink(Key1,Key2, List)).
concatList(L1,[],L1).
concatList(L1,[T|Q],[T|List]):- concatList(L1, Q, List), !.

regroup():-bagof(X, chessLink(X,_), List), newGroup(X,List).
linkGroup():-group(X,List1), link(X,Y), group(Y,List2), concat(List1, List2, L), removeDuplicates(L, List), newLinkGroup(X,Y, List).
% <><><><><><><><><><><><><><><><> <><><><> <><><><><><><><><><><><><><><><><> %