(defun F()
    (lambda(x)
        (cond
            ((< x 20) (expt x 10))
            (T (and (print "Confirmez-moi le résultat obtenu ?") (format () "Oui il s'agit : ~A " x)))
        )
    )
)

(defun expt2 (a b)
    (cond
        ((eq b 0) 1)
        (T (* (expt2 a (- b 1))))
    )
)