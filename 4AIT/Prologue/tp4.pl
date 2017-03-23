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
  pere(X, Pere):- parent(X, Pere), homme(Pere).
  allpere(Peres):- findall(Pere, pere(_,Pere), Peres).
  mere(X, Mere):- parent(X, Mere), femme(Mere).
  allmere(Meres):- findall(Mere, mere(_,Mere), Meres).
  grandparent(X,GrandParent):- parent(X,Y), parent(Y,GrandParent).
  childrens(Childs):- findall(Child, parent(Child,_), Childs).
  cousin(X, Cousin):- grandparent(X, Z), grandparent(Cousin, Z).
  allcousin(Cousins):- findall(Cousin, cousin(_,Cousin),Cousins).
% %but
%   pere(nicolas, Pere).
%   allpere(Pere).
%   allmere(Meres).
%   childrens(Chils).
%   allcousin(Cousins).
% <><><><><><><><><><><><><><><><> <><><><> <><><><><><><><><><><><><><><><> %
% <><><><><><><><><><><><><><><><> 4.3 PLAY <><><><><><><><><><><><><><><><> %

% <><><><><><><><><><><><><><><><> <><><><> <><><><><><><><><><><><><><><><> %