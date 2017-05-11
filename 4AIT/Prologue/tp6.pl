% ###### USEFULL FUNCTORS #### %
% Tri List (Tri fusion pour plus de puissance).
split([],[], []).
split([T|[]], [T], []).
split([T,T2|Q], [T|List], [T2|List2]):-split(Q,List, List2),!. 

merge([], [], []).
merge(List, [], List).
merge([], List, List).
merge([T1|Q1],[T2|Q2],[T1|List]):-T1<T2, merge(Q1, [T2|Q2], List).
merge([T1|Q1],[T2|Q2],[T2|List]):-not(T1<T2), merge([T1|Q1], Q2, List).

quicksort([], []).
quicksort([T|[]], [T]).
quicksort([], []).
quicksort([T|[]], [T]).
quicksort(List, Res):- split(List, L1, L2), tri(L1, Res1), tri(L2, Res2), merge(Res1, Res2, Res), !.

conc(L1,[],L1).
conc([],L2,L2).
conc([X|Q],L2,[X|L]):- conc(Q,L2,L).

member(X,[X|_]):-!.
member(X,[_|Y]):-member(X,Y).

writeListe([T|[]]):- writef('%w.', [T]).
writeListe([T|Q]):- writef('%w, ', [T]), writeListe(Q), !.

lastOfList([T|[]], T):-!.
lastOfList([_|Q],T):-lastOfList(Q,T).

getfirst([T|_],T).
% <><><><><><><><><><><><><><><><><> 6.1 GPS  <><><><><><><><><><><><><><><><><> %
% facts
:- dynamic relie/3.
relie(a,f,5).
relie(a,c,4).
relie(a,b,7).
relie(a,g,3).
relie(b,e,2).
relie(b,c,5).
relie(c,b,3).
relie(c,a,8).
relie(c,d,2).
relie(c,h,8).
relie(d,e,4).
relie(d,h,4).
relie(e,h,7).
relie(e,f,4).
relie(f,g,9).
relie(g,h,11).
relie(h,a,10).
% foncteurs
route_rec(X,Y,L,List):-relie(X,Y,L), List=[X,Y].
route_rec(X,Y,L,List):-relie(X,Z,L1), route_rec(Z,Y,L2,Li), L is L1+L2, List=[X|Li].

route_exlude_rec(X,Y,_,L,List):-relie(X,Y,L),List=[X,Y].
route_exlude_rec(X,Y,I,L,List):-relie(X,Z,L1), route_exlude_rec(Z,Y,I,L2,Li), not(Z=I), L is L1+L2, List=[X|Li].

checkLoop(X,X,L):-route_rec(X,X,_,L),!.

route(X,Y,L,List):- checkLoop(X,X,LNotAllowed), getfirst(LNotAllowed,Exlude),
                    retract(relie(X,Exlude,Le)), route_rec(X,Y,L,List), assertz(relie(X,Exclude,Le)).
                    
route(X,Y,L,List):- not(route(X,X,_,_)), route_rec(X,Y,L,List).

route_using(X,Y,P,L,List):-route(X,P,L1,List1), route(P,Y,L2,List2),
                           L is L1+L2, conc(List1,List2,Li), cleanDup(Li,List).

dup([]):- false.
dup([X|Q]):- member(X,Q);dup(Q).

cleanDup([],[]).
cleanDup([X|[]],[X]).
cleanDup([X,X|Q],[X|L]):-cleanDup(Q,L),!.
cleanDup([X,Y|Q],[X|L]):-cleanDup([Y|Q],L),!.

% route_es(X,Y,I,L1,Liste):-route_exlude(X,Y,I,L,Liste), L=<L1.

list_route(X,Y,List):-bagof(L, route(X,Y,L,Li), List), quicksort(List).

shortest_route(X,Y,Res):-list_route(X,Y,List), getfirst(List,Res). 
% <><><><><><><><><><><><><><><><><> <><><><> <><><><><><><><><><><><><><><><><> %
