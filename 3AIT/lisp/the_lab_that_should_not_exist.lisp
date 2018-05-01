; ###############################################################
; ############ AUTHOR FREVILLE TITOUAN - ID 217821 ##############
; #### Feel free to use this to improve, but don't copy them ####
; ###############################################################


; || -> ou alors (ou paresseux)
; :: -> concaténation sur les listes :)

; Les syntaxes ne sont plus que pb pas correct.
;En commentaire : une description écrite du fonctionnement (non correspondant àla façon définie dans le cours ~~)
; Ceci est du LISP ;)
; coder sous linux via SUBLIME TEXT 3 + Sublime REPL + CLISP

; ---- TP 5 --------------------------------------------------------------------

; ------------------------------------------------------------------------------
(defun somme (n)
  (setq a 0)
  (loop
    (setq a (+ a n) n (- n 1))
    (when (< n 1) (return a))
  )
)

(defun recsomme (n)
  (cond 
    ((eq n 0) 0)
    (t (+ n recsomme (- n 1)))
  )
)
;
(defun inverser (l)
  (setq li nil)
  (loop
    (setq li (cons (first l) li) l (cdr l))
    (when (null l) (return li))
  )
)

(defun recinverser (l acc)
  (cond
    ((null l) acc)
    (t (recinverser (cdr l) (cons (car l) acc)))
  )
)
;
(defun fact (n)
  (setq a 0)
  (loop
    (setq a (+ a n) n (- n 1))
    (when (< n 1) (return a))
  )
)

(defun recfact (n)
  (cond
    ((eq n 0) 1)
    (t (* n recfact (- n 1)))
  )
)
;test
(somme 10)
(recsomme 10)
(inverser '(a b c d))
(recinverser '(a b c d))
(fact 3)
(recfact 3)