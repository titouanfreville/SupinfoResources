; ###############################################################
; ############ AUTHOR FREVILLE TITOUAN - ID 217821 ##############
; #### Feel free to use this to improve, but don't copy them ####
; ###############################################################


; || -> ou alors (ou paresseux)
; :: -> concaténation sur les listes :)

; Les syntaxes ne sont plus que pb pas correct.
;En commentaire : une description écrite du fonctionnement (non correspondant àla façon définie dans le cours ~~)
; Ceci est du LISP ;)
; Il doit être exécutable ~~ 
; coder sous linux via SUBLIME TEXT 3 + Sublime REPL + CLISP

; ; ---- TP 1 --------------------------------------------------------------------
; ; --------- 1 ------------------------------------------------------------------
; ; Au Sens des Constructeurs :
; ; Soit red_in la fonction -> Boolean
; ;  F([]) = false
; ;  F(e°F) = e == "red" || red_in (F)
; ;
; ; Au sens des sélecteurs
; ; Soit red_in la fonction -> Boolean
; ; F(E): selon E
; ;    Vide (E) : false
; ;    non Vide(E): Premier(E) == "red" || red_in (Fin(E))
; (defun red_in (L)
;   (cond
;     ((null L) nil))
;     ((eq (car L) "red"))
;     ((red_in (cdr L)))
;   )
; )

; ; Au Sens des Constructeurs :
; ; Soit color_in la fonction -> Boolean
; ;  F([],color) = false
; ;  F(e°E,color) = e == color || red_in (E)
; ;
; ; Au sens des sélecteurs
; ; Soit red_in la fonction -> Boolean
; ; F(E,color): selon E
; ;    Vide (E) : false
; ;    non Vide(E): Premier(E) == color || red_in (Fin(E,color))
; (defun color_in (color L)
;   (cond
;     ((null L) nil)
;     ((eq (car L) color))
;     ((red_in (cdr L)))
;   )
; )
; ; ------------------------------------------------------------------------------
; ; --------- 2 ------------------------------------------------------------------
; ; Naïve
; ;
; ; Au Sens des Constructeurs :
; ; Soit O_1_eq_imp1 la fonction -> Boolean
; ;  F([],n1,n0) = n1==n0
; ;  F(e°E,n1,n0) = Si e == 1 alors O_1_eq_imp1 E n1+1 n0,
; ;                           sinon O_1_eq_imp1 E n1 n0+1
; ;
; ; Au sens des sélecteurs
; ; Soit O_1_eq_imp1 la fonction -> Boolean
; ; F(E,n1,n0): selon E
; ;  Vide (E) : n1==n0
; ;  non Vide(E): Premier(E) == 1 && O_1_eq_imp1 (Fin E) n1+1 n0 || O_1_eq_imp1 (Fin E) n1 n0+1
; (defun O_1_eq_imp1 (L acc1 acc2)
;   (cond
;     ((null L) (eq acc1 acc2))
;     ((eq (car L) 1) O_1_eq_imp1 (cdr L) (acc1+1) acc2)
;     (T (car L) 1) O_1_eq_imp1 (cdr L) acc1 (acc2+1))
;   )
; )

; ;Funny
; ; Au Sens des Constructeurs :
; ; Soit 0_1_eq_imp2 la fonction -> Boolean
; ;  F([]) = true
; ;  F(e°[]) = false
; ;  F(p°L°d) = Si p == d alors false,
; ;                       sinon 0_1_eq_imp2 L
; ;
; ; Au sens des sélecteurs
; ; Soit 0_1_eq_imp2 la fonction -> Boolean
; ; F(E): selon E
; ;  Vide (E) : true
; ;  Singleton (E) : false
; ;  non Vide(E): Premier(E) == Dernier(E) && false || 0_1_eq_imp2 Reste(E)
; (defun 0_1_eq_imp2 (L)
;   (cond
;     ((null L))
;     ((null (cdr L) nil))
;     ((eq (car L) (cdr (last L))) nil)
;     (T 0_1_eq_imp2 (cdr L))
;   )
; )

; ;Two parts :)
; ; 1 - Split the list in 2
; ; 2 - Compare last element of list 1 && first element of list 2
; ; SPLIT :
; ; Au Sens des Constructeurs :
; ; Soit split la fonction -> (l1,l2)
; ;  F([]) = (l1,l2)
; ;  F(p°[]) = (p::l1,l2)
; ;  F(p°L°d) = split L (p::l1) (d::l2)
; (defun split (L acc1 acc2)
;   (cond
;     ((null L) (cons acc1 acc2))
;     ((null (cdr L)) (cons (first L) acc1,acc2))
;     (T split (rest L) (cons (first L) acc1) (cons (last L) acc2))
;   )
; )

; ;test
; ;0_1_eq_imp3 L :
; ;(l1,l2) = split L, last (l1) != first (l2)
; (defun 0_1_eq_imp3 (L)
;   (L1,L2)=split L, last (L1) != first (L2)
; )
; ; ------------------------------------------------------------------------------
; ; --------- 3 ------------------------------------------------------------------
; ; Naïve
; ;
; ; Au Sens des Constructeurs :
; ; Soit O_1_eq_imp1 la fonction -> Boolean
; ;  F([],n1,n0) = if n1>n0 then 1 else if n0>n1 then 0
; ;  F(e°E,n1,n0) = Si e == 1 alors O_1_eq_imp1 E n1+1 n0,
; ;                           sinon O_1_eq_imp1 E n1 n0+1
; (defun O_1_eq_imp1 (L acc1 acc2)
;   (cond
;     ((null L) (cond (acc1>acc2 1) (acc2 > acc1 0))
;     ((eq (car L) 1) O_1_eq_imp1 (cdr L) (acc1+1) acc2)
;     (T (car L) 1) O_1_eq_imp1 (cdr L) acc1 (acc2+1))
;   )
; )

; ;Funny
; ; Au Sens des Constructeurs :
; ; Soit 0_1_eq_imp2 la fonction -> Boolean
; ;  F([]) = true
; ;  F(e°[]) = e
; ;  F(p°L°d) = Si p == d alors e,
; ;                       sinon 0_1_eq_imp2 L
; (defun 0_1_eq_imp2 (L)
;   (cond
;     ((null L) false)
;     ((null (cdr L) car L))
;     ((eq (car L) (cdr (last L))) car L)
;     (T 0_1_eq_imp2 (cdr L))
;   )
; )

; ;Two parts :)
; ; 1 - Split the list in 2
; ; 2 - Compare last element of list 1 && first element of list 2
; ; SPLIT :
; ; Au Sens des Constructeurs :
; ; Soit split la fonction -> (l1,l2)
; ;  F([]) = (l1,l2)
; ;  F(p°[]) = (p::l1,l2)
; ;  F(p°L°d) = split L (p::l1) (d::l2)
; (defun split (L acc1 acc2)
;   (cond
;     ((null L) (cons acc1 acc2))
;     ((null (cdr L)) (cons (first L) acc1,acc2))
;     (T split (rest L) (cons (first L) acc1) (cons (last L) acc2))
;   )
; )

; ;test
; ;0_1_eq_imp3 L :
; ;(l1,l2) = split L, last (l1) != first (l2)
; (defun 0_1_eq_imp3 (L)
;   (L1,L2)=split L, last (L1) == first (L2) && first (L1)
; )
; ------------------------------------------------------------------------------
; ---- TP 2 --------------------------------------------------------------------
(setq l '(1 2 ((3 (4) 5))))
; --------- 1 ------------------------------------------------------------------
(defun last_of_list (l)
  (cond
    ((null l) l)
    ((null (cdr l)) (first l))
    (t (last_of_list (cdr l)))
  )
)

(last_of_list l)

(defun last_elements_first_tree_in_list (l)
  (cond
    ((null l) l)
    ((listp (first l)) (last_elements_first_tree_in_list (first l)))
    ((null (cdr l)) (first l))
    (t (last_elements_first_tree_in_list (cdr l)))
  )
)

(last_elements_first_tree_in_list l)

(defun last_elements_first_list (l)
  (cond
    ((null l) l)
    ((listp (first l)) (last_of_list (last_of_list (first l))))
    ((null (cdr l)) (first l))
    (t (last_elements_first_list (cdr l)))
  )
)

(last_elements_first_list l)
; ------------------------------------------------------------------------------
; --------- 2 ------------------------------------------------------------------
;null
(setq l '(a b 1 2))
(setq l2 '())
(null l)
(null l2)
;
;eq
(eq 1 2)
(eq "a" "b")
;list
(setq l3 '(a b 1 2))
(setf l4 '(a b (1 2)))
(setq l5 '((a b) 1 2))
; etc ....
;
; define error list_to_small to use when list is too short for properties ~~
(define-condition list_to_small (error) nil)

;check_third_element
; @PARAM list
; @RETURN nill 3rd element isn't a list; true else
; @THROW list_to_small if list don't have 3 elements
(defun check_third_element (l)
  (cond
    ((null l) (error 'list_to_small))
    ((atom l) (error 'list_to_small))
    ((null (cdr (cdr l))) (error 'list_to_small))
    (T (listp (third l)))
  )
)
(setq l6 '(a c))

; (check_third_element l)
; (check_third_element l2)
; (check_third_element l4)
; (check_third_element l5)
; (check_third_element l6)
; ------------------------------------------------------------------------------
; --------- 3 ------------------------------------------------------------------
(setq l '((a b c) (b (bc)) (12 x) (42 vrai)))
;RetournerValeur
; @PARAM i index, l list
; @RETURN NIL if i don't exist in l; cdr i sinon
(defun RetournerValeur (i l)
  (cond
    ((null l) nil)
    ((eq (first (first l)) i) (cdr (first l)))
    (T (RetournerValeur i (cdr l)))
  )
)
;test
(RetournerValeur 'a l)
(RetournerValeur 'b l)
(RetournerValeur 12 l)
(RetournerValeur 666 l)
;
;
;Carre
; @PARAM i rationnel
; @RETURN i*i
(defun Carre (i)
  (cond
    ((eq i 0) 0)
    (T (* i i))
  )
)
;Cube
; @PARAM i rationnel
; @RETURN i^2*i
(defun Cube (i)
  (cond
    ((eq i 0) 0)
    (T (* i (Carre i)))
  )
)
;Afficher
; This function don't have parameter and don't return anything :p it just
; ask you to enter an INTEGER and print it's square && cube
(defun Afficher ()
  (terpri)
  (princ "Enter an INTEGER to get Square and Cube of it : ")
  (defparameter i (read))
  (defparameter carre (Carre i))
  (defparameter cube (Cube i))
  (format t "Square: = ~W~% Cube = ~W" carre cube)
  (terpri)
)
;test
(Afficher)
;
;
(defun multi(n)
  (defun res_multi(arg)
    (* arg n)
  )
)

(funcall (multi 3) 2)
;
;
;f
(defun f (fun)
  (funcall fun 1)
)

(defun fct (i)
  (+ (* 5 i) 3)
)
;test
(f 'fct)
; ------------------------------------------------------------------------------
; ---- TP 3 --------------------------------------------------------------------
; include
; Au sens des sélecteurs
; Soit include la fonction -> Boolean
; F(L1,L2): selon L1
;    Vide (L1) : true
;    non Vide(L2): i = Premier(L1);
;                 DEBUT appartient
;                 Soit appartient la fonction -> >Boolean
;                 F(i,L2)
;                   selon L2
;                       Vide (L2) : false
;                       non Vide(L2) : Premier(L2) == i ou alors appartient (i, Fin L2)
;                FIN APPARTIENT
;                et include (FIN L1, L2)$
; @in
; @PARAMETERS element, list
; @RETURN true si element in list, false sinon
(defun in (a l)
  (cond
    ((null l) nil)
    ((eq (first l) a))
    (t (in a (cdr l)))
  )
)
;@inclus
;@PARAMETERS list1, list2
;@RETURN true if list1 include in l2, false else
(defun inclus (l1 l2)
  (cond
    ((null l1))
    ((eq (in (first l1) l2) nil) nil)
    (t (inclus (cdr l1) l2))
  )
)
;test
(setq l1 '(a b c d) l2 '(c a b f g e d) l3 '(c b d f g e i) l4 '(d a b c) ld '(a a b c d b e c f g g g))

(inclus l1 l2)
(inclus l1 l3)
(inclus l4 l2)
(inclus l4 l3)
;
; compare
; Au Sens des Constructeurs :
; Soit compare la fonction -> Boolean
;  F(e,_) = "Arguments n'est pas une liste :" e
;  F(_,e) = "Arguments n'est pas une liste :" e
;  F([],[]) = true
;  F([],l) = false
;  F(l,[]) = false
;  F([],l2) = true
;  F(e°l1,l2) = DEBUT REMOVE
;              Soit remove la fonction -> list
;               F(e,[]) = []
;               F(e, le°l) = if (e==le) then l else le&(remove e l)
;              FIN REMOVE
;              compare l1 (remove e l2)
;@remove_first
;@PARAMETERS element, list
;@RETURN list without the first occurence of element
(defun remove_first (e l)
  (cond
    ((null l) nil)
    ((eq (first l) e) (cdr l))
    (t (cons (first l) (remove_first e (cdr l))))
  )
)
;@show_notlist
;@PARAMETER element
(defun show_notlist (e)
  (princ "Arguments n'est pas une liste: ")
  (princ e)
)
;@compare
;@PARAMETER list1, list2f
;@RETURN true if list1 <=> list2, false sinon
(defun compare (l1 l2)
  (cond
    ((not (listp l1)) show_notlist(l1))
    ((not (listp l2)) show_notlist(l2))
    ((and (null l1) (null l2)) t)
    ((and (null l1) (listp l1)) nil)
    ((and (listp l1) (null l1)) nil)
    (t (compare (cdr l1) (remove_first (first l1) l2)))
  )
)
;test
(compare l1 l4)
(compare l4 l1)
(compare l1 l3)
(compare l3 l1)
;
; unique
; Au sens des constructuer :
; Soit unique -> list
; f([]) -> []
; f(e°l) -> if (e in l) then unique l else e&(unique l)
; rec non terminal
;@unique_nonterm
;@PARAM list
;@RETURN list without duplicates elements
(defun unique_nonterm (l)
  (cond
    ((null l) nil)
    ((in (first l) (cdr l)) (unique_nonterm (cdr l)))
    (t (cons (first l) (unique_nonterm (cdr l))))
  )
)
; rec terminal
;@uniqe
;@PARAM list1, list2
;@RETURN not duplicates elements of list1 concat to list2
(defun unique (l acc)
  (cond
    ((null l) acc)
    ((in (first l) acc) (unique (cdr l) acc))
    (t (unique (cdr l) (cons (first l) acc)))
  )
)
;test
; Show the lists
(unique_nonterm l1)
(unique_nonterm l2)
(unique l1 nil)
(unique l2 nil)
; Prove that both term && not term solve the pb :p
(setq r1_nt (unique_nonterm l1) r2_nt (unique_nonterm ld) r1_t (unique l1 nil) r2_t (unique ld nil))
(compare r1_nt r1_t)
(compare r2_nt r2_t)
;
; reunion
; Au sens des constructuer :
; Soit reunion -> list
; f([],E) -> E
; f(e°l, E) -> if (e in E) then reunion l E else e&(reunion l E)
;@reunion_rec
;@PARAM list, ensemble
;@RETURN E(listUe)
(defun reunion_rec (l e)
  (cond
    ((null l) e)
    ((in (first l) e) (reunion_rec (cdr l) e))
    (t (reunion_rec (cdr l) (cons (first l) e)))
  )
)
;@reunion
;@PARAM list1, list2
;@RETURN Ensemble list1Ulist2
(defun reunion (l1 l2)
  (reunion_rec l1 (unique l2 nil))
)
;test
(defun __print_reunion (l1 l2)
  (princ "Réunion liste : ")
  (princ l1)
  (princ " et ")
  (princ l2)
)
; (__print_reunion l1 l2)
(reunion l1 l2)
; (__print_reunion l2 l3)
(reunion l2 l3)
; (__print_reunion l1 l1)
(reunion l1 l1)
;
; inter
; Au sens des constructuer :
; Soit inter -> list
; f([],l2) -> []
; f(e°l, l2) -> if ((e in l) ou alors not (e in l2) then reunion l E else e&(reunion l E)
;@inter_rec
;@PARAM list1,list2,list3
;@RETURN list3 (= list1^list2)
(defun inter_rec (l1 l2 acc)
  (cond
    ((null l1) acc)
    ((and (in (first l1) (cdr l1)) (in (first l1) acc)) (inter_rec (cdr l1) l2 acc))
    ((in (first l1) l2) (inter_rec (cdr l1) l2 (cons (first l1) acc)))
    (t (inter_rec (cdr l1) l2 acc))
  )
)
;@inter
;@PARAM list1, list2
;@RETURN list1^list2
(defun inter (l1 l2)
  (inter_rec l1 l2 nil)
)
;test
(defun __print_inter (l1 l2)
  (princ "Intersection liste : ")
  (princ l1)
  (princ " et ")
  (princ l2)
)
; (__print_inter l1 l2)
(inter l1 l2)
; (__print_inter l2 l3)
(inter l2 l3)
; (__print_inter l1 l1)
(inter l1 l1)
; ------------------------------------------------------------------------------
; ---- TP 5 --------------------------------------------------------------------
; SET TREE
(setq tree
            '(+
              (*
                (4)
                (3)
              )
              (*
                (5)
                (2)
              )
            )
)
;@inordre
;@PARAM function, arbre binaire (1 racine a 2 branches MAXIMUM)
;@RETURN fun(el a) in ordre (FG-R-FD)
(defun inordre (fun tree)
  (cond
    ((null tree))
    ((null (cdr tree)) (progn
                          (funcall fun (first tree))
                          (princ " ")
                        ))
    (t (progn
         (inordre fun (second tree))
         (funcall fun (first tree))
         (princ " ")
         (inordre fun (second (cdr tree)))
        ))
  )
)
;test
(inordre 'princ tree)
(terpri)
;
;@postordre
;@PARAM function, arbre binaire (1 racine a 2 branches MAXIMUM)
;@RETURN fun(el a) in ordre (FG-FD-R)
(defun postordre (fun tree)
  (cond
    ((null tree)(fun " "))
    ((null (cdr tree)) (progn 
                         (funcall fun (first tree))
                         (princ " ")
                        ))
    (t (progn
         (postordre fun (second tree))
         (postordre fun (second (cdr tree)))                  
         (funcall fun (first tree))
         (princ " ")
        ))
  )
)
;test
(postordre 'princ tree)
(terpri)
;
;@largeur
;@PARAM function, arbre binaire (1 racine a 2 branches MAXIMUM)
;@RETURN fun(el a) in ordre (h0,h1,...,hn)
(setq tree
            '(+
              (*
                (4)
                (3)
              )
              (*
                (5)
                (2)
              )
            )
)
(defun largeur (fun tree)
  (cond
    ((null tree))
    ((listp (first tree))(progn
                            (funcall fun (first (first tree)))
                            (princ " ")
                            (largeur fun (cdr tree))
                            (largeur fun (cdr (first tree)))
                         ))
    (t (progn                  
         (funcall fun (first tree))
         (princ " ")
         (largeur fun (cdr tree))
        ))
  )
)
;test
(largeur 'princ tree)
; ------------------------------------------------------------------------------