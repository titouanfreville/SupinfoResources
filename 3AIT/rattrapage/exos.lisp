; Done in 30-40 mins
; 1.1 ---------------------------------------------------------------
; @UneListe
; Function to transform an atom or a complex list in a simple list of atom.
; @param List of int, int or ()
; @return list with only atoms
(defun UneListe(a)
  (cond 
    ((null a)())
    ((atom a) a)
    ((atom (car a)) (cons (car a) (UneListe (cdr a))))
    (T (append (UneListe (car a)) (UneListe (cdr a))))
  )
)
(setq TEST_DEFINITION 'TEST_DEFINITION)
(setq ltest '(a (b (g h) t y ((y)))))
(setq atest 'x)
(setq vtest '())
(setq TESTING 'TESTING)
(UneListe ltest)
(UneListe atest)
(UneListe vtest)
; -------------------------------------------------------------------
; 1.2 ---------------------------------------------------------------
(setq itest '(7 (3 10 (6 (5 7) (11 5)))))
; Somme
; Go into evry part of an INT list list to make a sum
; @param list of int list
; @return somme of all ints in the list
(defun Somme(l)
  (cond 
    ((null l) 0)
    ((atom l) l)
    (T (+ (Somme (car l)) (Somme (cdr l))))
  )
)
(Somme itest)
; 1.3
; Nombre
; Go through the list to find the number of atoms
; @param list of list
; @return number of atom in the list
(defun Nombre(l)
  (cond 
    ((null l) 0)
    ((atom l) 1)
    (T (+ (Nombre (car l)) (Nombre (cdr l))))
  )
)
(Nombre itest)
; -------------------------------------------------------------------
; 1.4 ---------------------------------------------------------------
; Pow 
; a^n
; @param a int, n int
; @return a^n
(defun pow (a n)
  (cond
    ((eq n 0) 1)
    (T (* a (pow a (- n 1))))
  )
)
; Sommepi
; Make the sum Z from 0 to n of i number
; @param i int, n int
; @return i^0 + i^1 +i^2 + .... + i^n
(defun Sommepi(i n)
  (cond
    ((eq n 0) 1)
    (T (+ (pow i n) (Sommepi i (- n 1))))
  )
)
(Sommepi 16 3)
(Sommepi (Somme '(5 (3 7 (1 (6))))) (Nombre '(5 (3 7 (1 (6))))))
; -------------------------------------------------------------------
