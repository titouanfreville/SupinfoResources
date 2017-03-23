%% %% <><><><><><><><><><><><><><><><><><> COMMENT THIS PART WHEN USING CONSULT <><><><><><><><><><><><><><><><><><><><><><> %%
%% %% Bases
%% %% == operand. == state if right part is the same entity as left part. (Not an equality operator).
%% a==a. %% true
%% a\==a. %% false
%% a==b. %% false
%% a\==b. %% true
%% 5==5. %% true
%% 4+1==3+2. %% false
%% (4+1)==(3+2). %% false
%% %% +,*,-,mod,/ ne sont pas des opérateurs de calcul. Pour forcer un calcul, il faut utiliser IS
%% f(a,b)==f(a,b). %% true
%% 
%% X= +(3, 5). %% X = 3+5
%% Y= 4+1. %% Y = 4+1
%% V is 3 + 5. %% 8
%% W is 4 + 4. %% 8
%% 
%% %% Compare integers
%% 5=:=5. %% true
%% 5=\=5. %% false
%% 5<5. %% false
%% 5=<5. %% true
%% 5>5. %% false
%% 5>=5. %% true
%% 
%% 4+1=:=3+2. %% true
%% 4+1=\=3+2. %% false
%% 4+1<3+2. %% false
%% 4+1=<3+2. %% true
%% 4+1>3+2. %% false
%% 4+1>=3+2. %% true
%% 
%% 3+2<9. %% true
%% 2+2=:=3+1. %% true
%% 5=<5. %% true
%% 2=\=9. %% true
%% X= 5, X > 12. %% false
%% X > 6. %% error
%% 
%% A is pi. %% X = 3.141592653589793.
%% B is pi. %% Y = 2.718281828459045.
%% 
%% 1 is mod(5,2). %% true
%% 8 is 5+3. %% true
%% V is W. %%ERROR: Arguments are not sufficiently instantiated
%%         %% ERROR: In:
%%         %% ERROR:    [8] _4204 is _4206
%%         %% ERROR:    [7] <user>
%% 
%% %% random (v1,v2,var) affecte to var a value between v1 && v2
%% random(1,10,Res). %% Res = x (x in [1, 1O])
%% Res is sqrt(4). %% Res=2.0
%% 
%% %% var operator to check if entity is a variable
%% var(X). %% true
%% var(1). %% false
%% 
%% %% atomic operator to check if entity is a value
%% atomic(X). %% false
%% atomic(1). %% true
%% atomic(1+1). %% false
%% 
%% %% some calcs
%% X is abs(-7). %% X=7
%% X is round(8.3). %% X=8
%% 
%% %% :O Spaces are so important here ... 
%% X is 3+5*5-5. %% X=23
%% X is -4-6--10*1-1*-+5. %% Error cause -- is not -(-10), *-+ is not *(-(+5))
%% %% ERROR: Syntax error: Operator expected
%% %% ERROR: X is -4-
%% %% ERROR: ** here **
%% %% ERROR: 6--10*1-1*-+5 . 
%% X is -4-6-(-10)*1-1*(-5). %% X=5
%% X is -4-6- -10*1-1* - 5. %% X=5
%% X is -4-6- -10*1-1* - +5. %% X=5
%% X is 4-6--6*7-7*-3. %% error
%% X= 4-6--6*7-7*-3. %% error
%% X is 4-6- -6*7-7* -3. %% X=61
%% X= 4-6- -6*7-7* -3. %% X=4-6- -6*7-7* -3
%% 
%% %% Type and range
%% integer(5). %% true
%% integer(4.5). %% false
%% float(4). %% false
%% float(6.5). %% true
%% between(2,5,6). %% false
%% between(2,5,4). %% true
%% 
%% %% Unification
%% =(a, a). %% true
%% a = a. %% true
%% 5 = 5. %% true
%% %% String 5 is not associable with int 5.
%% '5'= 5. %% false
%% %% String TOM can be associate with string value tom.
%% 'tom' = tom. %% true
%% X = Y. %% X = Y
%% X = 5. %% X = 5 -> instansiate X with 5
%% f(m(g), Z) = f(Y,s(m)). %%  Z = s(m), Y = m(g).

%% %% Manipulation BDD
%% %% Add assertion
%% assert(pere(a, b)). %% true
%% assert(pere(b,c)). %% true
%% listing. %% :- dynamic pere/2.
%%          %% pere(a, b).
%%          %% pere(b, c).
%% 
%% asserta((pere(a,b) :- fils(b,a))). %% true
%% listing. %% :- dynamic pere/2.
%%          %%pere(a, b) :-
%% 	 %%              fils(b, a).
%%          %% pere(a, b).
%%          %% pere(b, c).
%% 
%% %% remove assertion
%% %% Remove one
%% retract(pere(a,b)). %% true
%% %% Retract all
%% assert(pere(a, b)). %% true
%% retract(pere(X,Y)). %% X = b, Y = c; X = b, Y = c; ...... use `;` to continue
%% assert(pere(a, b)). %% true
%% assert(pere(b,c)). %% true
%% retractall(pere(_,_)). %% true

%% % EXERCICE --- Explain recursive shemes : 
%% % apply is an instruction to apply provided fonction to first element of %% provided list and put the result into the second element of the list. 
%% apply(plus(1), [10,X]). %% plus(1), [10|X] -> plus(1,10), [X|[]] -> plus(1,10,X)%% , true 
%% apply(compare(>), [2,3]). %% compare(>), [2|3] -> compare(>,2), [3] -> compare%% (>, 2, 3), true
%% apply(membre, [d, [a,d,e,f]]). %% membre(), [2|3] -> membre(d), [[a,d,e,f]] -> %% membre(d, [a,d,e,f]), true
%% apply(longuer,[[2,3,4,e,r],Res]).
%% <><><><><><><><><><><><><><><><><><> <><><><><><><><><><><><><><><><><><> <><><><><><><><><><><><><><><><><><><><><><> %%
%% <><><><><><><><><><><><><><><><><><><><><> USE THIS PART WITH CONSULT <><><><><><><><><><><><><><><><><><><><><><><><> %%

%% Foncteur
multiplier(X,Y):- Y is X*10.
soustraire(X,Y):- Y is X-10.

%% Play with values.
%clauses - To import with consult
  blanche(maison).
  aime(jean, prolog).
  voiture(ford, rouge, 3, 5.000).
  gagne(jean, loterie).
  achete(jean, voiture):- gagne(jean, loterie).
%% Friends
  ami(jacques, yves).
  ami(jean, yves).
  ami(pierre, luc).
  ami(pierre, tom).
  ami(pierre, yves).
  ami(jean, tom).
  ami(jean, serge).
%% Family
  pere(jean, yves).
  pere(jules, marie).
  pere(jules, eve).
  tous_presents:- pere(X, Y), writef('%w est le père de %w', [X, Y]).
%but - To run in REPL
  % aime(jean, prolog). %% true
  % blanche(maison). %% true
  % blanche(voiture). %% false
  % achete(jean, voiture). %% true
% %% Friends
% ami(jean, X), ami(pierre, X). %% X = yves ; X = tom ; false.
% %% Family
% tous_presents. %% jean est le père de yves true ; jules est le père de marie true ; jules est le père de eve true.

%% CUTTTTTTTT - To import with consult
%clauses
  b(1).
  b(2).
  c(3).
  e(4).
%functors  
  %% Without cut
  a(X,Y) :- b(X), e(Y).
  a(X,Y) :- c(X), e(Y).
  %% With cut
  v(X,Y) :- b(X), !, e(Y).
  v(X,Y) :- c(X), e(Y).
  w(X,Y) :- !, b(X), e(Y).
  w(X,Y) :- c(X), e(Y).
% %% Response  - To run in REPL
% a(1,4) %% true; false
% a(2,4) %% true; false
% a(3,4) %% true
% v(1,4) %% true
% v(2,4) %% true
% v(3,4) %% true
% w(1,4) %% true
% w(2,4) %% true
% w(3,4) %% false

% %% Negation
%clauses: 
  courageux(jean).
  courageux(pierre).
  chetif(pierre).
%foncteurs:
  explorateur(X):- courageux(X), not(chetif(X)).
%but
% explorateur(X). %% jean

% %% Manipulation BDD
% %% Store results
%functors:
calculer(X,Y,Res):- stocker(X,Y,Res), !.
calculer(X,Y,Res):- Res is (X + 2)*Y, assert(stocker(X,Y,Res)).

%but:
% calculer(3,4,X). %% 20

% %% Find All. Bagof
%clauses
  qui('Jean Dupond', '23, rue de Sèvre', 34).
  qui('Anne Vigier', '7, Bd. Davout', 20).
  qui('Spirou', '1, rue de Franquin', 25).
  qui('Tintin', 'Chateau de Moulinsart', 25).
  qui('Tintin', 'Chateau de Moulinsart', 27).
%but
% findall(_,_,Age), Liste). %% Liste[34,20,25,25,27]
% bagof(Age, qui(_,_,Age), Liste). %% Liste = [20] ; Liste = [34] ; Liste = [25] ; Liste = [25, 27]

% %% Recursivite
% assertion
  rpere(jean, pierre).
  rpere(pierre, jules).
  rpere(jules, gaspard).
  rpere(gaspard, leon).
% functors
  ancetre(X,Y):- rpere(X,Y). %% cas simple
  ancetre(X,Y):- rpere(X,Z), ancetre(Z,Y). %% appel recursif
% but
% ancetre(X,Y). %% X = jean,
                %% Y = pierre ;
                %% X = pierre,
                %% Y = jules ;
                %% X = jules,
                %% Y = gaspard ;
                %% X = gaspard,
                %% Y = leon ;
                %% X = jean,
                %% Y = jules ;
                %% X = jean,
                %% Y = gaspard ;
                %% X = jean,
                %% Y = leon ;
                %% X = pierre,
                %% Y = gaspard ;
                %% X = pierre,
                %% Y = leon ;
                %% X = jules,
                %% Y = leon ;
                %% false.
% findall(X, ancetre(jean, X), Z). %% Z = [pierre, jules, gaspard, leon].

%% EXERCICE --- FACTORIELLE 
factorielle(0, 1).
factorielle(X, Res):- X > 0, NewX is X-1, factorielle(NewX, OldRes), Res is X * OldRes.
%% Basic case is for X == 0. Value is 1 then.
%% Recursif call : check if X is greater than 0. Store X-1 into NewX. Get recursive value of fact(X-1), Use it to get 
%% step res.

%%  EXERCICE --- LISTE PAIRE
isPair(X):- 0 =:= X mod 2.

member(X,[X|_]).
member(X,[_|Y]):- member(X,Y).

elementPair(X,List):- member(X,List), isPair(X).

%elementPair([],[]).
%elementPair([X|Q], Res):- isPair(X,2), elementPair(Q, OldRes), Res is [X|OldRes].
%elementPair([_|Q], Res):- elementPair(Q, Res).

%% EXERCICE --- Compt liste element

compt([], 0).
compt([_|Y], Res):- compt(Y, OldRes), Res is OldRes + 1.
%% <><><><><><><><><><><><><><><><><><> <><><><><><><><><><><><><><><><><><> <><><><><><><><><><><><><><><><><><><><><><><><>