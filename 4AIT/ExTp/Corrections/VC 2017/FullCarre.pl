%% longueur(L,T) renvoie la taille (le nombre d’éléments) de la liste L dans la variable T.
%% somme(L,S) renvoie la somme des éléments de la liste L de nombres dans la variable S. 
%% element(X,L) renvoie true si l’élément X appartient à L. Ce prédicat marche aussi en génération, ie, qu’il peut renvoyer dans la variable X tous les éléments de la liste L.
%% concat(L1,L2,R) concatène les listes L1 et L2 dans la liste R.
%% Tout autre prédicat non défini devra être réécrit.

longueur(List,T):-length(List,T).
somme(List,S):-sum_list(List, S).
element(X,List):-member(X,List).
concat(L1,L2,R):-append(L1,L2,R).

%% dimension(Carre,Dim) renvoie la dimension du carré Carre dans la variable Dim.
dimension([T|_],Dim):-longueur(T,Dim).
dimension([],0).

%% element_n(N,L,X) renvoie le Nieme élément de la liste L dans la variable X
element_n(1,[T|_],X):-T = X.
element_n(N,[_|Q],X):-element_n(M,Q,X), N is M+1.


%% ligne_n(N,Carre,L) renvoie la Nieme ligne du carré Carre dans la variable L
ligne_n(N,Carre,List):-element_n(N,Carre,List).

%% colonne_n(N,Carre,C) renvoie une liste contient les nombres de la Nieme colonne du carré Carré dans la variable C.
colonne_n(_,[],[]).
colonne_n(N,[T|Q],[X|S]):-element_n(N,T,X),colonne_n(N,Q,S). 
%% on ajoute un élément X à concaténer avec le reste de la liste S via la notation [X|S] dans le prédicat

%% colonnes(Carre,Cs) renvoie toutes les colonnes mises sous forme de liste de nombres du carré Carre dans la variable Cs.
colonnes(1,Carre,CS):-colonne_n(1,Carre,CS).
colonnes(I,Carre,[ResT|ResQ]):-colonne_n(I,Carre,ResX),NewI is I+1,colonnes(NewI,Carre,ResQ).
colonnes(Carre,CS):-dimension(Carre,Dim),colonnes(Dim,Carre,CS).

%% diagonale1(Carre,D1)
%% diagonale2(Carre,D2) renvoient respectivement les diagonales 1 et 2 du carré Carre dans les variables D1 et D2.
diagonale1(Carre,D1):-diagonale1(1,Carre,D1).
diagonale1(_,[],[]).
diagonale1(I,[T|Q],[X|D1]):-element_n(I,T,X),NewI is I-1,diagonale1(NewI,Q,D1).

diagonale2(Carre,D2):-dimension(Carre,Dim),diagonale2(Dim,Carre,D2).
diagonale2(_,[],[]).
diagonale2(I,[T|Q],[X|D2]):-element_n(I,T,X),NewI is I-1,diagonale2(NewI,Q,D2).

%% composantes(Carre,Comp) qui renvoie les lignes, colonnes et diagonales (sous forme de liste de nombres) du carré Carre dans la variable liste Comp.
composantes(Carre,Comp):-colonnes(Carre,CS),diagonale1(Carre,D1),diagonale2(Carre,D2),concat([C,[D1,D2|CS],Comp).
%% Il faut bien mettre les [] autour de D1 et D2 afin de garder le même niveau dans la liste Comp.

%% magique(Carre) qui renvoie True si le carre Carre est magique.
%% un carré est magiques si la somme des nombres de chaque composante est toujours la même...
magique(Carre):-composantes(Carre,Comp),meme_somme(Comp,_).
meme_somme([T|Q],S):-somme(T,S),meme_somme(Q,S).
meme_somme([],_).
%% Va unifier _ avec S la première fois puis après à chaque appel il va falloir que S soit égal sinon cela échoue.


%% genere_liste(UB,L) qui génère la liste des nombres allant de 1 à UB dans la
%% variable L. L’ordre de ces nombres n’aura aucune importance.
genere_liste(1,[1]):-!.
genere_liste(NB,[NB|L]):-NewNB is NB-1,genere_liste(NewNB,L).

%% retire_el(List,X,NewList) qui retire la première occurrence de l’élément X trouvée dans la liste L et qui renvoie le résultat dans la variable NewListe. Si l’élément X n’appartient pas à L, alors NewListe=L
retire_el([],_,[]). %% cut inutile car quand on arrive à la liste vide, on ne peut plus rien faire.
retire_el([X|Q],X,Q):-!. %% cut non obligatoire, mais conseillé
retire_el([T|Q],X,[T|R]):-retire_el(Q,X,R).

%% genere_ligne(N,ListeNbs,L,NewListeNbs) capable de générer une liste de nombres de taille N à partir de la liste ListeNbs en renvoyant le résultat dans la variable L et la liste des nombres non utilisés dans NewListeNbs. Ce prédicat devra être capable de générer toutes les listes possibles si on demande plusieurs réponses.

genere_ligne(0,ListeNbs,[],ListeNbs):-!.
%% Cas où on prend l'élément
genere_ligne(N,ListeNbs,[X|R],NewListeNbs):-element(X,ListeNbs),retire_el(ListeNbs,X,ListeNbs2),M is N-1,genere_ligne(M,ListeNbs2,R,NewListeNbs).

%% genere_carre(N,Carre) qui génère un carré d’ordre N (pas forcément magique) dans la variable Carre. Ce prédicat devra être capable de générer tous les carrés d’ordre N possibles...
genere_carre([],_,[]).
%% on génère une liste de nombre contenant tous les nombres de N à N^2
genere_carre(N,Carre):-NB is N*N, genere_liste(NB,ListeNbs),genere_carre(ListeNbs,N,Carre).
% on génère une première ligne et on retire les nombres utilisés de la liste. A la fin on arrive à une NewListeNbs vide.
genere_carre(ListeNbs,N,[L|S]):-genere_ligne(N,L,NewListeNbs),genere_carre(NewListeNbs,N,S).

%% solve(N,Carre) qui renvoie un carré magique (si il en existe 1) d’ordre N dans la variable Carre. Ce prédicat devra être capable de générer tous les carrés magiques possibles d’ordre N.
solve(N,C):-genere_carre(N,C),magique(C).