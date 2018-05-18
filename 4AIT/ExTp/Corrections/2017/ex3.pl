/* Question 3.1 */
in(E,[E|_]).
in(E,[_|Q]):-in(E,Q).

sommeList([],0).
sommeList([T|Q],R):- sommeList(Q,Nr), R is Nr + T.

tousDifferents([]).
tousDifferents([T|Q]):- not(in(T,Q)), tousDifferents(Q).

verifier(L):-writef('Premier nombre: \n'), read(FirstNumber),
    writef('Deuxième Nombre: \n'), read(SecondNumber),
    proceedVer(L,FirstNumber, SecondNumber).

proceedVer(L,F,S):- L=[F, S, Third, Fourth, Fifth],
             in(Fifth, [1,2,3,4,5,6,7]), in(Third, [1,2,3,4,5]), 
             in(Fourth, [1,2,3,4,5,6]), 
             sommeList(L,16).

/* Question 3.2 */
combinaison(L):-writef('Premier nombre: \n'), read(FirstNumber),
    writef('Deuxième Nombre: \n'), read(SecondNumber),
    proceedVerComb(L,FirstNumber, SecondNumber).

proceedVerComb(L,F,S):- L=[F, S, Third, Fourth, Fifth],
             in(Fifth, [1,2,3,4,5,6,7]), 
             in(Third, [1,2,3,4,5]), in(Fourth, [1,2,3,4,5,6]),
             tousDifferents(L),
             sommeList(L,16).

/* Question 3.4 */
combinaison2(L,S):-writef('Premier nombre: \n'), read(FirstNumber),
            writef('Deuxième Nombre: \n'), read(SecondNumber),
            proceedVerComb(L,S,FirstNumber, SecondNumber).

proceedVerComb(L,Sum,F,S):- L=[F, S, Third, Fourth, Fifth],
             in(Fifth, [1,2,3,4,5,6,7]), in(Third, [1,2,3,4,5]),
             in(Fourth, [1,2,3,4,5,6]),
             tousDifferents(L),
             sommeList(L,Sum).