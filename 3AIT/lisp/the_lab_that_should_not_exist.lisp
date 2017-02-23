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
;
(defun inverser (l)
  (setq li nil)
  (loop
    (setq li (cons (first l) li) l (cdr l))
    (when (null l) (return li))
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
;test
(somme 10)
(inverser '(a b c d))
(fact 3)