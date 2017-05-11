(defun NumberOfLetterInUniqueList (l letter)
  (cond
    ((null l) 0)
    ((eq (first l) letter)(+ 1 (NumberOfLetterInUniqueList (cdr l) letter)))
    (t (NumberOfLetterInUniqueList (cdr l) letter))
  )
)

(defun NumberOfLetter (l letter)
  (cond
    ((null l)())
    (t (cons (NumberOfLetterInUniqueList (car l) letter) (NumberOfLetter (cdr l) letter)))
  )
)

(setq l1 '((I n) (t h i s) (t h e r e) (a r e) (m a y) (b e) (t h e) (e)))

(NumberOfLetter l1 'e)
