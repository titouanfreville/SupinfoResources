(setq l1 '(1 3 2 4 6 9 7 2) l2 '(1 2 3 4 5))
(defun split (l a1 a2)
	(cond 
		((null l) (a1 a2))
		((null (cdr l)) (
			(cons (cons (car l) a1) ()) a2 ()))
		(t (split (cddr l) 
			(cons (car l) a1) (cons (cadr l) a2)))
	)
)
(split l1 () ())
(split l2 () ())