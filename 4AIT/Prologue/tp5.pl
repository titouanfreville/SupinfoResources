% <><><><><><><><><><><><><><><><> 5.1 CUBES <><><><><><><><><><><><><><><><> %
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
initCube() :- writef('Veuillez entrez une disposition initiale de cubes : \n'), 
writef('Cubes liés ? [0,1]'), read(L), nl, addCubes(L), writef('Entrez de nouveaux cubes ? [0,1]'), read(E), E =:= 0, initCube().
addCubes(L):- L =:= 0, writef('Entrez les cubes liés (C1 -> C2 // C2 sur C1): \nCube 1: '), read(C1), writef('Cube 2: '), read(C2), addRule(link,C1,C2).
addCubes(L):- L=\=0, writef('Entrez le cube: '), read(C), addRule(link,base, C).
% Output
printCubes():- writef('Current cube state: \n'), link(base, X), writef('base '), printCubeList(X).
printCubeList(X):-not(link(X,_)), writef('-> %w -> vide\n', [X]).
printCubeList(X):-link(X,Val), writef('-> %w ', [X]), printCubeList(Val).
% Clean all
resetCubeEnv():- retractall(link(_,_)), initEnv().
% Move cube
move(_,base,_).
move(C,B,base):- not(link(C,_)), link(B,C),retract(link(B,C)), addRule(link,base,C).
move(C,B1,B2):- not(link(C,_)), link(B1,C), link(_,B2), not(link(B2,_)), retract(link(B1,C)), addRule(link,B2,C).
% Solve problem
placeCube(A,B):- link(B,A), printCubes().
placeCube(A,B):- link(Base, A), move(A, Base, B), printCubes().
placeCube(A,B):- link(A,E), move(E,A,base), placeCube(A,B).
placeCube(A,B):- link(B,E), move(E,B,base), placeCube(A,B).
% <><><><><><><><><><><><><><><><> <><><><> <><><><><><><><><><><><><><><><> %