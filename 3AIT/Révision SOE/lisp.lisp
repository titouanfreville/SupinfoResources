;; Que font les fonctions suivantes ?

(defun in (a l)
  (cond
    ((null l) nil)
    (
      (eq a 0) (cond
                ((eq (first l) '-))
                ((eq (first l) 'fin))
               )
    )
    (t (in (- a 1) (cdr l)))
  )
)

;@check
;@param labyrinthe, POINT (x,y)
;@RETURN true if POINT is a path (-), false else ($).
(defun check (labyrinthe point)
  (setq x (first point) y (second point))
  (cond
    ((< x 0) nil)
    ((null labyrinthe) nil)
    ((= x 0) (in y (first labyrinthe)))
    (t (check (cdr labyrinthe) (list (- x 1) y)))
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

; Implémenter la fonction membre

(defun membre (list arg)
  (cond
    ((null list) Nil)
    ((eq (first (list)) arg) t)
    (t (membre (cdr list) arg))
  )
)

(defun tribulle_forme1 (l)
  (cond
    ((null l) ())
    ((null (cdr l)) l)
      ((< (car l) (car (tribulle_forme1 (cdr l)))) (cons (car l) (tribulle_forme1 (cdr l))))
      (T (cons (car (tribulle_forme1 (cdr l))) (tribulle_forme1 (cons (car l) (cdr (tribulle_forme1 (cdr l)))))))
    )
  )
)

(defun tribulle_forme2 (l, acc)
  (cond
    ((null l) acc)
    ((null (cdr l)) (cons l acc)
      ((< (car l) (car (tribulle_forme2 (cdr l) acc ))) (tribulle_forme2 (cdr l) (cons (car l) acc)))
      (T (tribulle_forme1 (cons (car l) (cdr (tribulle_forme2 (cdr l) acc ))) (cons (tribulle_forme2 (cdr l) acc ) acc)))
    )
  )
)

(setq ltest '(1 5 4 2 3 9))
(tribulle_forme1 ltest)
(tribulle_forme2 ltest ())
