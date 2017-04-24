% fact: maison(nat, couleur, animal, boisson, metier)

%relation:
in(X,[X|_]).
in(X,[_|Q]):- in(X,Q).

first(X, [X|_]).

right(X,Y,[X,Y|_]).
right(X,Y,[_|Q]):-right(X,Y,Q).

voisin(X,Y,L):- right(X,Y,L).
voisin(X,Y,L):- right(Y,X,L).

middle(X,[_,_,X,_,_]).

solve(Res):- Res = [_,_,_,_,_],
             first(maison(norvegien, _, _, _, _), Res),
             middle(maison(_, _, _, lait, _), Res),
             right(maison(_, verte, _, _, _), maison(_, blanche, _, _, _), Res),
             voisin(maison(_, _, _, _, medecin), maison(_, _, renard, _, _), Res),
             voisin(maison(_, _, _, _, diplomate), maison(_, _, cheval, _, _), Res),
             voisin(maison(norvegien, _, _, _, _), maison(_, bleu, _, _, _), Res),
             in(maison(anglais,rouge,_,_,_), Res),
             in(maison(espagnol,_,chien,_,_), Res),
             in(maison(_, verte, _, cafe, _), Res),
             in(maison(ukrainien, _, _, the, _), Res),
             in(maison(_, _, escargot, _, sculpteur), Res),
             in(maison(_, jaune, _, _, diplomate), Res),
             in(maison(_, _, _, jus, violoniste), Res),
             in(maison(japonais, _, _, _, accrobate), Res),
             in(maison(_,_,zebre,_,_), Res),
             in(maison(_,_,_,eau,_), Res).

             %Solution: Zebre -> Japonais, Eau -> Norvegien