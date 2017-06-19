/* Question 2.1 */
sommetPile(j).
sommetPile(h).
sommetPile(c).
sommetPile(n).
basPile(i).
basPile(d).
basPile(a).
basPile(k).
sur(j,i).
sur(h,g).
sur(g,f).
sur(f,e).
sur(e,d).
sur(c,b).
sur(b,a).
sur(n,m).
sur(m,l).
sur(l,k).

/* Question 2.2 */
compteCubeDessus(C,0):-not(sur(_,C)),!.
compteCubeDessus(C,R):-sur(C1,C), compteCubeDessus(C1,NewR), R is NewR +1.

/* Question 2.3 */
% nouveauSommetPile(C):-sur(C1,C), assertz(basPile(C1)), assertz(sommetPile(C)), retract(sur(C1,C)).
% nouveauBasPile(C):-sur(C,C1), assertz(basPile(C)), assertz(sommetPile(C1)), retract(sur(C,C1)).
nouveauSommetPile(C):-sur(C,_),not(sur(_,C)).
nouveauBasPile(C):-sur(_,C),not(sur(C,_)).

/* Question 2.4 */
writeListe([T|[]]):- writef('%w.', [T]).
writeListe([T|Q]):- writef('%w, ', [T]), writeListe(Q), !.

sommet():-findall(X,nouveauSommetPile(X),L), writeListe(L).
bas():-findall(X,nouveauBasPile(X),L), writeListe(L).

/* Question 2.5 */
compteCubeDessous(C,R):-nouveauBasPile(C), R is 0,!.
compteCubeDessous(C,R):-sur(C,C1), compteCubeDessous(C1,NR), R is NR + 1.