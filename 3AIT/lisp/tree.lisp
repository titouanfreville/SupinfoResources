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
(defun inordre (affiche tree)
  (cond 
    ((null tree))
    ((and (null (cdr tree)) 
      (null (cddr tree))) (funcall affiche (car tree)))
    (t (progn
        (inordre affiche (cadr tree))
        (funcall affiche (car tree))
        (inordre affiche (caddr tree))
      ))
  )
)
(inordre 'prin1 tree)