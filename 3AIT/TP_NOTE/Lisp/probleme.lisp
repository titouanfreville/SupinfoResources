; Problème Lisp #######################################################################################
; Question 1. -----------------------------------------------------------------------------------------
; Chaque ville sera représenté par une liste de deux éléments
; telle que : VilleX == list (x y)
(setq Ville1 '(0 0))
(setq Ville2 '(10 0))
(setq Ville3 '(1 5))
(setq Ville4 '(4 8))
(setq Ville5 '(7 3))
(setq Ville6 '(2 2))
(setq Ville7 '(10 9))
; Vérifications
Ville1
Ville2
Ville3
Ville4
Ville5
Ville6
Ville7
; -----------------------------------------------------------------------------------------------------
; Question 1.2 ----------------------------------------------------------------------------------------
; carre
; @param i
; @return i*i
(defun carre (i)
  (* i i)
)
; Distance
; @param Ville1, Ville2
; @return Distance séparant Ville1 && Ville2
(defun Distance (v1 v2)
  (sqrt (+ (carre (abs (- (car v1) (car v2)))) 
           (carre (abs (- (car (cdr v1)) (car (cdr v2)))))))
)

; Test entre Ville 1 && Ville 4
(Distance Ville1 Ville4)
; -----------------------------------------------------------------------------------------------------
; Question 1.3 ----------------------------------------------------------------------------------------
; Les villes seront désormais représentées par une liste de 3 éléments (x,y,nombre d'habitans)
; ajoute
; @param Ville, donnée
; @return Ville intégrant la donné plassé en paramètre dans sa définition
(defun ajoute (ville donne)
  (cond 
    ((null ville)(list donne))
    ((null (cdr ville))(cons (car ville) (ajoute (cdr ville) donne )))
    (T (cons (car ville) (ajoute (cdr ville) donne)))
  )
)
; tests
(setq Ville1 (ajoute Ville1 '10100))
(setq Ville2 (ajoute Ville2 '700))
(setq Ville3 (ajoute Ville3 '1903))
(setq Ville4 (ajoute Ville4 '797))
(setq Ville5 (ajoute Ville5 '100234))
(setq Ville6 (ajoute Ville6 '6252))
(setq Ville6 (ajoute Ville7 '345))
; Vérifications
Ville1
Ville2
Ville3
Ville4
Ville5
Ville6
; -----------------------------------------------------------------------------------------------------
; Question 1.4 ----------------------------------------------------------------------------------------
; On représente le dictionnaire par une liste contennant les listes représentant les villes
; On peut réutiliser la fonction ajoute précédemment définies pour les ville,
; celle ci permettant simplement d'ajouter un élément en queu de liste.
; On a donc : 
(setq Dico1 (cons 'Ville1 Ville1))
(setq Dico2 (cons 'Ville2 Ville2))
(setq Dico3 (cons 'Ville3 Ville3))
(setq Dico4 (cons 'Ville4 Ville4))
(setq Dico5 (cons 'Ville5 Ville5))
(setq Dico6 (cons 'Ville6 Ville6))
(setq Dico7 (cons 'Ville6 Ville7))
(setq EnsemblesVilles ())
(setq EnsemblesVilles (ajoute EnsemblesVilles Dico1))
(setq EnsemblesVilles (ajoute EnsemblesVilles Dico2))
(setq EnsemblesVilles (ajoute EnsemblesVilles Dico3))
(setq EnsemblesVilles (ajoute EnsemblesVilles Dico4))
(setq EnsemblesVilles (ajoute EnsemblesVilles Dico5))
(setq EnsemblesVilles (ajoute EnsemblesVilles Dico6))
; -----------------------------------------------------------------------------------------------------
; Queston 1.5 -----------------------------------------------------------------------------------------
; afficheville
; Sous Fonction pour AfficheVilles
; @param Ville dico format (Nom x y Pop)
; @print Ville selon le format N -> N, Co -> Co, Pop -> Pop
(defun AfficheVille (ville)
  (cond
    ((null ville))
    ((null (cdr ville))(format t "Population --> ~W" (car ville)))
    ((null (cdr (cdr (cdr ville))))(progn
                                     (format t "Coordonées --> ~W,~W    " (car ville) (car (cdr ville)))
                                     (AfficheVille (cdr (cdr ville)))
                                    ))
    ((null (cdr (cdr ville))))
    (T (progn
         (format t "Nom --> ~W    " (car ville))
         (AfficheVille (cdr ville))
       ))
  )
)
(AfficheVille Dico5)
; AfficheVilles 
; @param Dictonnaire de Ville
; @print Pour chaque ville de le dictionnaire : Nom --> Nom Coordonées --> Coo Population --> Pop
(defun AfficheVilles (dico) 
  (cond
    ((null dico))
    (T (progn
         (AfficheVille (car dico))
         (format t "~%")
         (AfficheVilles (cdr dico))
        ))
  )
)
(AfficheVilles EnsemblesVilles)
; -----------------------------------------------------------------------------------------------------
; Question 1.6 ----------------------------------------------------------------------------------------
; lol
; @param List
; @return valeur du dernier élement de la liste
(defun lol (l)
  (cond
    ((null l) l)
    ((null (cdr l)) (first l))
    (t (lol (cdr l)))
  )
)
(lol Dico1)
; Peuple
; @param Dico de ville, tmpV stockant le nom actuelle de la ville la moins peuplée,
;        tmpS stockant la taille de la plus petite ville actuelle.
;         tmpS doit être initialisé à une valeur négative pour une recheche
;         sans connaissance de la taille minimale cherchée.
; @return tmpV (= Nom de la première ville la moins peuplé trouvée.)
(defun Peuple (dico tmpV tmpS)
  (cond 
    ((null dico) tmpV)
    ((< tmpS 0)(Peuple (cdr dico) (car (car dico)) (lol (car dico))))
    ((< (lol (car dico)) tmpS) ( Peuple (cdr dico) (car (car dico)) (lol (car dico))))
    (T (Peuple (cdr dico) tmpV tmpS))
  )
)
; Vérification
(Peuple EnsemblesVilles 'NoVille -1)
; -----------------------------------------------------------------------------------------------------
; Question 1.7 ----------------------------------------------------------------------------------------
; Somme Habitants
; @param dico
; @return Somme des habitants de la commune (dans le dico donc :p))
(defun SommeHabitants (dico)
  (cond 
    ((null dico) 0)
    (T (+ (lol (car dico)) (SommeHabitants (cdr dico))))
  )
)
(SommeHabitants EnsemblesVilles)
; -----------------------------------------------------------------------------------------------------