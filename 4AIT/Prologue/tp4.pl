%datas:
%%  asserta(ferrari:-italienne)
%%  asserta(lamborgini:-italienne)
%%  asserta(ford:- americaine)
%%  asserta(peugo:- francaise)
%%  asserta(talbot:- francaise)
%%  asserta(chrysler:- americaine)
%%  asserta(italienne:- red, prix(10000, 20000))
%%  asserta(francaise:- bleu, prix(5000, 15000))
%%  asserta(americaine:- blanche, prix(10000, 15000))
%clauses:
  ferrari(ferrari).
  lamborgini(lamborgini).
  ford(ford).
  peugo(peugo).
  talbot(talbot).
  chrysler(chrysler).
  price1(10000, 20000).
  price2(5000, 15000).
  price3(7500, 12500).
%foncteur:
  %% LOGIC
  isIt(X):- ferrari(X); lamborgini(X).
  isUs(X):- ford(X); chrysler(X).
  isFr(X):- peugo(X); talbot(X).
  isRed(X):- isIt(X); isPrice1(X).
  isBlue(X):- isFr(X); isPrice2(X).
  isWhite(X):- isUs(X); isPrice3(X).
  isPrice1(X):- isIt(X); isRed(X).
  isPrice2(X):- isFr(X); isBlue(X).
  isPrice3(X):- isUs(X); isWhite(X).
  %% GETTERS
  whatPrice(X, Y, Z):- (isPrice1(X), price1(Y, Z)); (isPrice2(X), price2(Y, Z)); (isPrice3(X) , price3(Y, Z)).
  %% MATHS
  cheapCars(X):- isPrice2(X); isPrice3(X).
  expensiveCars(X):- isPrice1(X); isPrice2(X); isPrice3(X).
  medCar(X):- isPrice1(X); isPrice2(X); isPrice3(X).