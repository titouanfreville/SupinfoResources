%%%%% RESOLUTION OF PROBLEMS FROM http://www.ic.unicamp.br/~meidanis/courses/mc336/2009s2/prolog/problemas/ %%%%

% P03 -> Find the Nth element of a list (logical list so indexation start from 1 (you can change the base index to 0))
nthList(-1, [], _):-!.
nthList(T, [T|_], 1):-!.
nthList(Res, [_|Q], N):- NewN is N - 1, nthList(Res, Q, NewN).
:-nthList(R, [1,2,3,4,5], 3), write(R), nl.
:-nthList(R, [1,2,3,4,5], 10), write(R), nl.

% P05 -> Reverse a list
addToEnd(L, E, R) :- append(L, [E], R).

reverse([], []):-!.
reverse(L, [T|Q]):- reverse(NL, Q), addToEnd(NL,T,L).
:-reverse(R, [1,2,3,4,5]), write(R), nl.

% P07 -> Flatten a nested list
flatten([], []):-!.
flatten([T|Q], R):- is_list(T), flatten(T, R1), flatten(Q, NR), append(R1, NR, R), !.
flatten([T|Q], R):- flatten(Q, NR), append([T], NR, R).
:-flatten([a,[b,[c,d],e],f,g,[h,i]], R), write(R), nl.

% P08 -> Eliminate consecutive duplicate in list
killDuplicate([], []):-!.
killDuplicate([E1|[]], [E1]):-!.
killDuplicate([E1,E2|Q], R):- E1 == E2, killDuplicate([E2|Q], R), !.
killDuplicate([E1,E2|Q], [E1|R]):- killDuplicate([E2|Q], R).
:-killDuplicate([a,a,a,a,b,b,a,a,b,c,d,d,d,d,d,d,d,e,e,a], R), write(R), nl.

% P09 -> Pack consecutive duplicate in list into sublists
pack([], []):-!.
pack([E1|[]], [[E1]]):-!.
pack([E1,E2|Q], [NT|NQ]):- E1 == E2, pack([E2|Q], [T|NQ]), append([E1], T, NT),!.
pack([E1,E2|Q], [[E1]|R]):- pack([E2|Q], R).
:-pack([a,a,a,a,b,b,a,a,b,c,d,d,d,d,d,d,d,e,e,a], R), write(R), nl.

% P10 -> Lenght encode list. Pack duplicates from the list using the element and how many consecutive time he is present
badEncode([], []):-!.
badEncode([E1|[]], [[1, E1]]):-!.
badEncode([E1,E2|Q], [[NewNB, T]|NQ]):- E1 == E2, badEncode([E2|Q], [[NB, T]|NQ]), NewNB is NB + 1,!.
badEncode([E1,E2|Q], [[1, E1]|R]):- badEncode([E2|Q], R).
:-badEncode([a,a,a,a,b,b,a,a,b,c,d,d,d,d,d,d,d,e,e,a], R), write(R), nl.

% P11 -> Lenght encode list. Pack duplicates from the list using the element and how many consecutive time he is present
encode([], []):-!.
encode([E1|[]], [E1]):-!.
encode([E1,E2|Q], [[NewNB, NT]|NQ]):- E1 == E2, encode([E2|Q], [T|NQ]), is_list(T), [NB, NT] = T, NewNB is NB + 1,!.
encode([E1,E2|Q], [[2, T]|NQ]):- E1 == E2, encode([E2|Q], [T|NQ]), not(is_list(T)),!.
encode([E1,E2|Q], [E1|R]):- encode([E2|Q], R).
:-encode([a,a,a,a,b,b,a,a,b,c,d,d,d,d,d,d,d,e,e,a], R), write(R), nl.


%%%%% ARTIHMETICS
% P32 -> Greater commond divisor
gcd(A,0,A):- !.
gcd(A,B,R):- NR is mod(A,B), gcd(B, NR, R).
:-gcd(36,63,R), write(R), nl.
:-gcd(63,36,R), write(R), nl.

% P33 -> Coprime?
is_coprime_print(A,B):- gcd(A,B, R), R == 1, writef('%w is coprime with %w', [A, B]), !.
is_coprime_print(A,B):- gcd(A,B, R), writef('%w is not coprime with %w. Their gcd is %w.', [A, B, R]).
:-is_coprime_print(63,36),  nl.
:-is_coprime_print(35,39), nl.

% P34 -> Get euleur coeficient

is_coprime(A,B):- gcd(A,B, R), R == 1, !.

%Gen list from 1 to N-1
gen_list(1,[]):-!.
gen_list(N,[NewN|Q]) :- NewN is N-1, gen_list(NewN, Q).
:-gen_list(10, L), write(L), nl.

phi_rec(_, [], 0):-!.
phi_rec(N, [T|Q], R):- phi_rec(N,Q,NewR), is_coprime(T,N), R is NewR + 1, !.
phi_rec(N, [_|Q], R):- phi_rec(N,Q,R).

phi(1,1):-!.
phi(N,R):-gen_list(N, List), phi_rec(N, List, R).
:-phi(10, R), write(R), nl.