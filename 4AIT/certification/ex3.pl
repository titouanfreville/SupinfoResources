up(A,B):- A > B.

% curlist take the initial list and the pivot argument e. If the list to cut is empty, we associate it with too empty list
% represnting the smaller part and the large part. Then for each step, if the head is greater than the pivot, we associate it to the
% Large part acquired by the recursive call of cutlist association, else we add it to the small part.
cutlist([], _, [], []):-!.
cutlist([A|Q], E, Small, [A|Large]):- up(A,E), cutlist(Q, E, Small, Large).
cutlist([A|Q], E, [A|Small], Large):- not(up(A,E)), cutlist(Q, E, Small, Large).

% The cut operator ! allow us to force prolog to stop trying to associate things. It is usefull to force the return at some points of the program.
% Usage exemple: having a unique return to the call max(A,B,R) alloing to associate the max of A and B in R:
max(A,B,A) :- A > B,!.
max(A,B,B) :- A =< B.

% Old style multiplication
oldMult(0, _, 0):-!.
oldMult(_, 0, 0):-!.
oldMult(A, B, R) :- up(A,0), NewA is A - 1, oldMult(NewA, B, OldR), R is OldR + B.
oldMult(A, B, R) :- not(up(A,0)), NewA is A + 1, oldMult(NewA, B, OldR), R is OldR - B.