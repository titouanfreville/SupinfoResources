% <><><><><><><><><><><><><><><><> 4.1 CARS <><><><><><><><><><><><><><><><> %
%clauses:
  % Ferraris models
  ferrari(f12).
  ferrari(488).
  ferrari(california).
  % Lamborgini models
  lamborgini(aventador).
  lamborgini(huracan).
  lamborgini(aventador).
  % Ford models
  ford(fiesta).
  ford(focus).
  ford(mustang).
  ford(mondeo).
  ford(ecosport).
  % Peugo models
  peugo(405).
  peugo(408).
  peugo(407).
  % Talbot models
  talbot(simca).
  talbot(horizon).
  talbot(samba).
  talbot(tagora).
  % Chyrsler models
  chrysler(airflow).
  chrysler(alpine).
  chrysler(avenger).
  % Price range
  priceRange1(10000).
  priceRange1(20000).
  priceRange2(5000).
  priceRange2(15000).
  priceRange3(7500).
  priceRange3(12500).

%foncteurs:
  % Nat. 
  it(X):-ferrari(X).
  it(X):-lamborgini(X).
  us(X):-ford(X).
  us(X):-chrysler(X).
  fr(X):-peugo(X).
  fr(X):-talbot(X).
  % Couleur
  red(X):-it(X).
  blue(X):-fr(X).
  white(X):-us(X).
  % Car prices
  % I used the top logical condition to check price range. 
  price(X,Res, List):-red(X), findall(Res, priceRange1(Res), List).
  price(X,Res, List):-blue(X), findall(Res, priceRange2(Res), List).
  price(X,Res, List):-white(X), findall(Res, priceRange1(Res), List).
  % Get car into some price range (let increment prices by 500 each time for this exemple.
  %% Overs solution will come ... 
  cheapcars(X,Res):-price(X,Res,[5000|_]).
  cheapcars(X,Res):-price(X,Res,[7500|_]).
  medcars(X,Res):-price(X,Res,[10000|_]).
  medcars(X,Res):-price(X,Res,[_,12500]).
  bigcars(X,Res):-price(X,Res,[_,20000]).
  bigcars(X,Res):-price(X,Res,[_,15000]).
  bigcars(X,Res):-price(X,Res,[_,12500]).
% Exec in REPL.
% %but
%   red(X).
%   ford(X).
%   cheapcars(X,Res).
%   bigcars(X,Res).
%   medcars(X,Res).
% <><><><><><><><><><><><><><><><> <><><><> <><><><><><><><><><><><><><><><> %
% <><><><><><><><><><><><><><><><> 4.2 TREE <><><><><><><><><><><><><><><><> %
%clauses
  homme(jean).
  homme(richard).
  homme(nicolas).
  homme(francois).
  homme(bernard).
  homme(paul).
  homme(thomas).
  homme(christophe).
  homme(hugo).
  femme(anna).
  femme(helene).
  femme(marthe).
  femme(annette).
  femme(clara).
  femme(lise).
  femme(nicole).
  femme(eve).
  femme(ema).
  femme(marie).
  parent(annette,anna).
  parent(richard,jean).
  parent(richard,helene).
  parent(nicole,helene).
  parent(nicole,jean).
  parent(francoise,paul).
  parent(francois,marthe).
  parent(bernard,paul).
  parent(bernard,marthe).
  parent(clara,richard).
  parent(clara,annette).
  parent(nicolas,richard).
  parent(nicolas,annette).
  parent(thomas,nicolas).
  parent(thomas,francois).
  parent(christophe,nicole).
  parent(christophe,francois).
  parent(eve,nicole).
  parent(eve,francois).
  parent(lise,nicolas).
  parent(marie,nicolas).
  parent(ema,thomas).
  parent(hugo,thomas).

%foncteurs
  % Remove duplicate from List
  removeDuplicates([], []).
  removeDuplicates([T|Q], NewList):- member(T,Q), removeDuplicates(Q, NewList).
  removeDuplicates([T|Q], [T|List]):- not(member(T, Q)), removeDuplicates(Q, List).
  pere(X, Pere):- parent(X, Pere), homme(Pere).
  allpere(Peres):- findall(Pere, pere(_,Pere), List), removeDuplicates(List, Peres).
  mere(X, Mere):- parent(X, Mere), femme(Mere).
  allmere(Meres):- findall(Mere, mere(_,Mere), List), removeDuplicates(List, Meres).
  grandparent(X,GrandParent):- parent(X,Y), parent(Y,GrandParent).
  allgrandparent(GrandParents):- findall(GP, grandparent(_,GP), List), removeDuplicates(List, GrandParents).
  childrens(Childs):- findall(Child, parent(Child,_), List), removeDuplicates(List, Childs).
  cousins(X, Cousins):- grandparent(X, Z), grandparent(Cousins, Z).
  cousin(X,Cousin):- homme(Cousin), cousins(X, Cousin).
  cousine(X, Cousine):- femme(Cousine), cousins(X, Cousine).
  allcousins(Cousins):- findall(Cousin, cousins(_,Cousin),List), removeDuplicates(List, Cousins).
  allcousin(Cousins):- findall(Cousin, cousin(_,Cousin),List), removeDuplicates(List, Cousins).
  allcousine(Cousines):- findall(Cousine, cousine(_,Cousine),List), removeDuplicates(List, Cousines).
% %but
%   pere(nicolas, Pere).
%   allpere(Pere).
%   allmere(Meres).
%   childrens(Chils).
%   allcousin(Cousins).
% <><><><><><><><><><><><><><><><> <><><><> <><><><><><><><><><><><><><><><> %
% <><><><><><><><><><><><><><><><> 4.3 PLAY <><><><><><><><><><><><><><><><> %
% min 
min(X,Y,Min):- X < Y, Min is X, !.
min(X,Y,Min):- X > Y, Min is Y.
% test
%  min(1,2, Min) %% Min=1. 
%  min(2,1, Min) %% Min=1.

%membre
member(X,[X|_]).
member(X,[_|Y]):-member(X,Y).
%test
%  member(2,[1,2,3]) %% true
%  member(2,[1,4,3]) %% false

% haveImpaire
isImp(X):- mod(X,2) =\= 0.
haveImpaire([E|[]]):- isImp(E).
haveImpaire([E|Q]):- isImp(E), !; haveimpaire(Q).
%test
%  member(2,[1,2,3]) %% true
%  member(2,[2,4,6]) %% false

% sommeList
sommeList([],0).
sommeList([X|Q],Res):- sommeList(Q,OldRes), Res is OldRes + X.
%test
%  somme([1,2,3], Res) %% Res = 6
% <><><><><><><><><><><><><><><><> <><><><> <><><><><><><><><><><><><><><><> %
% <><><><><><><><><><><><> 4.4 ANALYSEUR SYNTAXIQUE <><><><><><><><><><><><> %
%clauses
  sujet(le,chat).
  sujet(le,chien).
  objet(la,chaise).
  objet(la,table).
  verbe(dort).
  relation(sur).
  relation(sous).
%foncteurs
  phrase([Article1, Sujet, Verbe, Relation, Article2, Complement]):- sujet(Article1, Sujet), verbe(Verbe), relation(Relation), objet(Article2,Complement), !.
%but
%  phrase([le, chat, dort, sous, la, table]). %% true
%  phrase([]) %% false
%  phrase([quelque, chose, random]) %% false
% <><><><><><><><><><><><><><><><> <><><><> <><><><><><><><><><><><><><><><> %
% ><><><><><><><><><><> 4.5 RECHERCHE? LECTURE, ECRITURE <><><><><><><><><>< %
% write from 1 to n
de1aN(1):- write(1).
de1aN(N):- NewN is N - 1, de1aN(NewN), nl, write(N).
% write from n to 1
deNa1(1):- write(1).
deNa1(N):-   NewN is N - 1, write(N) , nl, deNa1(NewN).
% Que fait : 
a(X,Y):- b(X),c(Y). % Verifie que les valeurs du couple de a sont une valeur de b a droite et une valeur de c a gauche. 
a(X,Y):- d(X,Y). % Verifie que le couple de valeur a est le même que celui de d. 
b(X) :- e(X),!. % Verifie si l'élément de b est un élément de e, empêche l'exécution suivante si vrai.
b(X) :- f(X). % Associe b(X) a f(X) si b(X) n'était pas associer a e(X).
c(10).
c(20).
d(5,15).
d(25,35).
e(1).
e(2).
f(100).
% estUneListe
estUneListe([]).
estUneListe([_|_]).
testListe() :- writef('Entrez quelque chose. Validez votre entrée avec <.>.'), read(List), estUneListe(List).
% Puissance
puissance1(_,0,1).
puissance1(A,N,Res):- NewN is N - 1, puissance1(A,NewN,OldRes), Res is A * OldRes, !.
puissance2(A,N,Res):- Res is A**N.
puissanceTerminal(A,N,Res):- puissanceRec(A,N,1,Res), !.
puissanceRec(_,0,Acc,Res):-Res is Acc.
puissanceRec(A,N,Acc,Res):- NewAcc is A * Acc, NewN is N - 1, puissanceRec(A,NewN, NewAcc, Res).
execPuissance(X, Res):- X =:= 1, writef('Calculer A puissance N - Recursive.(Tappez . a la fin de l entrée afin de validée) \nEntrez A : '), read(A), writef('\nEntrez N : '), read(N), puissance1(A,N,Res).
execPuissance(X, Res):- X =:= 2, writef('Calculer A puissance N - Using ** operateor.(Tappez . a la fin de l entrée afin de validée) \nEntrez A : '), read(A), writef('\nEntrez N : '), read(N), puissance2(A,N,Res).
execPuissance(X, Res):- X =:= 3, writef('Calculer A puissance N - Rec Term.(Tappez . a la fin de l entrée afin de validée) \nEntrez A : '), read(A), writef('\nEntrez N : '), read(N), puissanceTerminal(A,N,Res).
% Write pere, mere, enfant, etc ... 
writeListe([T|[]]):- writef('%w.', [T]).
writeListe([T|Q]):- writef('%w, ', [T]), writeListe(Q), !.
affichePere():- writef('Pere : '), allpere(X), writeListe(X), nl.
afficheMere():- writef('Mere : '), allmere(X), writeListe(X), nl.
afficheEnfant():- writef('Enfants : '), childrens(X), writeListe(X), nl.
afficheCousin():- writef('Cousin : '), allcousin(X), writeListe(X), nl.
afficheCousine():- writef('Cousine : '), allcousine(X), writeListe(X), nl.
affiche():- writef('Affiche famille :\n'), affichePere(), afficheMere(), afficheEnfant(), afficheCousin(), afficheCousine(), !.
% Tri List (Tri fusion pour plus de puissance).
split([],[], []).
split([T|[]], [T], []).
split([T,T2|Q], [T|List], [T2|List2]):-split(Q,List, List2),!. 

merge([], [], []).
merge(List, [], List).
merge([], List, List).
merge([T1|Q1],[T2|Q2],[T1|List]):-T1<T2, merge(Q1, [T2|Q2], List).
merge([T1|Q1],[T2|Q2],[T2|List]):-not(T1<T2), merge([T1|Q1], Q2, List).

tri([], []).
tri([T|[]], [T]).
tri([], []).
tri([T|[]], [T]).
tri(List, Res):- split(List, L1, L2), tri(L1, Res1), tri(L2, Res2), merge(Res1, Res2, Res), !.
% ><><><><><><><><><><><><><><><> <><><><><> <><><><><><><><><><><><><><><>< %