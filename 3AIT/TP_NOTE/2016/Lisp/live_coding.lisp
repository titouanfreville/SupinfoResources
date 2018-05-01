; (setq Ville1 '(0 0))
; (setq Ville2 '(10 0))
; (setq Ville3 '(1 5))
; (setq Ville4 '(4 8))
; (setq Ville5 '(7 3))
; (setq Ville6 '(2 2))
; (setq Ville7 '(10 9))
; ; Vérifications
; Ville1
; Ville2
; Ville3
; Ville4
; Ville5
; Ville6
; Ville7

; ;;;;;;;;;
; (defun carre(x)
; 	(* x x)
; )

; (defun Distance (v1 v2)
;   (sqrt (+ (carre (- (car v1) (car v2))) 
;            (carre (- (car (cdr v1)) (car (cdr v2))))))
; )

; (Distance Ville1 Ville4)
; ;;;;;;;
; (defun ajoute (ville donne)
;   (cond 
;     ((null ville)(list donne))
;     ((null (cdr ville))(cons (car ville) (ajoute (cdr ville) donne )))
;     (T (cons (car ville) (ajoute (cdr ville) donne)))
;   )
; )
; ; tests
; (setq Ville1 (ajoute Ville1 '10100))
; (setq Ville2 (ajoute Ville2 '700))
; (setq Ville3 (ajoute Ville3 '1903))
; (setq Ville4 (ajoute Ville4 '797))
; (setq Ville5 (ajoute Ville5 '100234))
; (setq Ville6 (ajoute Ville6 '6252))
; (setq Ville6 (ajoute Ville7 '345))
; ;;;;;
; (setq Dico2 (cons 'Ville2 Ville2))
; (setq Dico3 (cons 'Ville3 Ville3))
; (setq Dico4 (cons 'Ville4 Ville4))
; (setq Dico5 (cons 'Ville5 Ville5))
; (setq Dico6 (cons 'Ville6 Ville6))
; (setq Dico7 (cons 'Ville7 Ville7))
; (setq EnsemblesVilles ())
; (setq EnsemblesVilles (ajoute EnsemblesVilles Dico1))
; (setq EnsemblesVilles (ajoute EnsemblesVilles Dico2))
; (setq EnsemblesVilles (ajoute EnsemblesVilles Dico3))
; (setq EnsemblesVilles (ajoute EnsemblesVilles Dico4))
; (setq EnsemblesVilles (ajoute EnsemblesVilles Dico5))
; (setq EnsemblesVilles (ajoute EnsemblesVilles Dico6))
; ;;;;;
; (defun AfficheVille (ville)
;   (cond
;     ((null ville))
;     ((null (cdr ville))(format t "Population --> ~W" (car ville)))
;     ((null (cdr (cdr (cdr ville))))(progn
;                                      (format t "Coordonées --> ~W,~W    " (car ville) (car (cdr ville)))
;                                      (AfficheVille (cdr (cdr ville)))
;                                     ))
;     ((null (cdr (cdr ville))))
;     (T (progn
;          (format t "Nom --> ~W    " (car ville))
;          (AfficheVille (cdr ville))
;        ))
;   )
; )
; (AfficheVille Dico5)
;;;;;

(defun Sigma(g n p)
	(cond
		((eq n p) (funcall g p))
		(T (+ (Sigma g (+ n 1) p) (funcall g n))
	)
)







(defun det(l)
	(let x (car l) y (cadr l))
	(- (* (car x) (cadr y)) (* (cadr x) (car y)))
)


