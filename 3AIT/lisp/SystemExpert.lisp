;REDEFINITION DE LA FONCTION MEMBER
(defun member2 (x liste)
  (cond
    ((null liste) ())
    ((equal (car liste) x) liste)
    (t (member2 x (cdr liste)))
  )
)
; fonction Depart
(defun depart ()
  (defparameter possibles diagnostics)
  (defparameter dejadem ())
  (defparameter faits ())
  (setq reglutilisees ())
  (prog ()
    boucle
    (cond
      ((null possibles)
        (print "Aucun diagnostic ne peut etre obtenu")
        (return 'echec)
      )
      ((justifie (car possibles))
        (print "Conclusion : donc ")
        (prin1 (car possibles))
        (return 'succes)
      )
    )
    (setq possibles (cdr possibles))
    (go boucle)
  )
)
; fonction justifie
(defun justifie (fait)
  (prog (aux1 aux2)
    (cond
      ((acquis? fait) (return T))
    )
    (setq aux1 (dansalors fait nil) aux2 aux1)
    (cond
      (
        (null aux1)
        (cond
          ((member2 fait dejadem) (return nil))
          (
            (and
              (print "Est-il vrai que ")
              (prin1 fait)
              (prin1 " ?")
              (cond ((equal (read) 'oui)))
            )
            (memoriser fait)
            (return T)
          )
          (
            (setq dejadem (cons fait dejadem))
            (return nil)
          )
        )
      )
    )
    boucle1
    (cond
      ((essayeregle (car aux1)) (return T))
      )
    (setq aux1 (cdr aux1))
    (cond
      ((not (null aux1)) (go boucle1))
    )
    boucle2
    (cond
      ((null aux2) (return nil))
      ((essayereglechain (car aux2)) (return T))
    )
    (setq aux2 (cdr aux2))
    (go boucle2)
  )
)
; fonction acquis
(defun acquis? (fait)
  (member2 fait faits)
)
; fonction dans alors
(defun dansalors (fait aux)
  (mapcar
    (lambda (X) (setq aux (append aux X)))
    (mapcar
      (lambda (R)
        (cond
          ((alors? fait R) (list R))
        )
      )
      regles
    )
  )
  aux
)
; fonction alors?
(defun alors? (fait regle)
  (equal fait (caddr regle))
)
; fonction memoriser
(defun memoriser (fait)
  (defparameter faits (cons fait faits))
  )
; fonction essayeregle
(defun essayeregle (regle)
  (cond
    (
      (and (premisse regle) (conclusion regle ()))
      (listreg regle)
    )
  )
)
; fonction premisse
(defun premisse (regle)
  (prog (aux)
    (setq aux (cadr regle))
    hello
    (cond
      ((null aux) (return T))
      ((acquis? (car aux)) (setq aux (cdr aux)) (go hello))
    )
  )
)
; fonction conclusion
(defun conclusion (regle aux)
  (cond
    ((acquis? (setq aux (caddr regle))) nil)
    (
      (memoriser aux)
      (print "Regle ")
      (prin1 (car regle))
      (prin1 " deduit que ")
      (prin1 aux)
      T
    )
  )
)
; fonction listreg
(defun listreg (regle)
  (setq reglutilisees (cons (car regle) reglutilisees))
)
; fonction essayereglechain
(defun essayereglechain (regle)
  (cond
    (
      (and
        (premissechain regle)
        (conclusion regle ())
        )
      (listreg regle)
    )
  )
)
; fonction premissechain
(defun premissechain (regle)
  (prog (aux)
    (setq aux (cadr regle))
    hello
    (cond
      ((null aux) (return T))
      ((justifie (car aux)) (setq aux (cdr aux)) (go hello))
    )
  )
)
; fonction faits?
(defun faits? ()
  (printjoli faits)
  T
)
; fonction printjoli
(defun printjoli (L)
  (mapcar (lambda (X) (print X)) L)
)
; fonction utilisee?
(defun utilisee? (regle)
  member2(cond
    ((member2 regle reglutilisees) 'Oui)
    (t 'Non)
  )
)
; fonction reglutilisee?
(defun reglutilisees? ()
  (reverse reglutilisees)
)
; fonction comment?
(defun comment? (fait)
  (prog (aux)
    (cond
      (
        (not (acquis? fait))
        (print fait)
        (prin1 " n'est pas etabli")
        (return T)
      )
    )
    (setq aux reglutilisees)
    boucle
    (cond
      ((null aux) (print fait) (prin1 " etait donne") (return T))
      (
        (alors? fait (reg (car aux)))
        (print fait)
        (prin1 " est deduit de ")
        (printjoli (cadr (reg (car aux))))
        (return T)
      )
    )
    (setq aux (cdr aux))
    (go boucle)
  )
)
; fonction reg
(defun reg (nom)
  (prog (aux)
    (setq aux regles)
    hello
    (cond
      ((null aux) (print nom) (prin1 " - nom de regle errone") (return T))
      ((equal nom (caar aux)) (return (car aux)))
      (t (setq aux (cdr aux)) (go hello))
    )
  )
)
; fonction pourquoi?
(defun pourquoi? (fait)
  (prog (aux padansi)
    (cond
      (
        (not (acquis? fait))
        (print fait)
        (prin1 " n'est pas etabli")
        (return T)
      )
      (
        (member2 fait diagnostics)
        (print fait)
        (prin1 " etait un diagnostic possible")
        (return T)
      )
    )
    (setq aux reglutilisees)
    (setq padansi T)
    boucle
    (cond
      (
        (and (null aux) padansi)
        (print fait)
        (prin1 " etait fait initial")
        (return T)
        )
      ((null aux) (return T))
      (
        (si? fait (reg (car aux)))
        (setq padansi nil)
        (print fait)
        (prin1 " est necessaire pour prouver: ")
        (print (caddr (reg (car aux))))
      )
    )
    (setq aux (cdr aux))
    (go boucle)
  )
)
; fonction si?
(defun si? (fait regle)
  (member2 fait (cadr regle))
  )
; function deductible?
(defun deductible? (fait)
  (cond
    (
      (mapcar (lambda (X) (car X)) (dansalors fait nil))
      )
    ('non)
  )
)
; fonction peutservir?
(defun peutservir? (fait)
  (setq aux nil)
  (mapcar
    (lambda (X) (setq aux (append aux X)))
    (mapcar
      (lambda (R)
        (cond
          (
            (si? fait R)
            (list R)
          )
        )
      )
      regles
    )
  )
  (cond (aux) ('non))
)
; fonction regles?
(defun regles? (noms)
  (mapcar
    (lambda (R)
      (print (reg R))
    )
    noms
  )
T
)

; Test
(setq regles '(
    (R1 ((joue avec deux mains séparées)(independance de chaque doigt)(dur de modifier le son basique de l instrument))(joueur de clavier))
    (R2 ((joueur de clavier)(corde frape))(pianiste))
    (R2 ((joueur de clavier)(corde pincee))(clavesciniste))
    (R3 ((joueur de clavier)(souflerie))(organiste))
    (R4 ((joue avec deux mains unies)(difference entre les mains)(main directrice)(main rythmique))(guitariste))
    (R5 ((joue avec deux mains unies)(soufle)(possede une hanche))(joueur de bois))
    (R6 ((joue avec deux mains unies)(soufle)(corps en cuivre)(ne possede pas de hanche))(joueur de cuivre))
 )
)
(setq diagnostics '(
    (pianiste)(clavesciniste)(organiste)(guitariste)(joueur de cuivre)(joueur de bois)
  )
)
(depart)
