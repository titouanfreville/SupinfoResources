; ###############################################################
; ############ AUTHOR FREVILLE TITOUAN - ID 217821 ##############
; #### Feel free to use this to improve, but don't copy them ####
; ###############################################################


; || -> ou alors (ou paresseux)
; :: -> concaténation sur les listes :)
; Set labyrinthe
(setq lab '(
    ($ $ $ $ $ $ $ $ $ $ $ $)
    (- - - - $ $ - - - - - $)
    ($ $ $ - - - - $ - $ - $)
    ($ - - - - $ $ - - $ - $)
    ($ - $ $ - $ $ $ $ $ $ $)
    ($ - - - $ $ $ - - - $ $)
    ($ - $ - - - - - $ - - fin)
    ($ $ $ $ $ $ $ $ $ $ $ $)
  )
)
(setq lab1 '(
    ($ $ $ $ )
    (- - - - )
    ($ - $ fin)
    ($ - - $ )
  )
)
;
;@in
;@PARAMETERS element, list
;@RETURN true si element in list, false sinon
(defun in (a l)
  (cond
    ((null l) nil)
    ((eq a 0) (cond
                ((eq (first l) '-))
                ((eq (first l) 'fin))
              ))
    (t (in (- a 1) (cdr l)))
  )
)
;test
(setq tl '($ - fin))
(in 0 tl)
(in 1 tl)
(in 2 tl)
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

(defun check_nth (labyrinthe point)
  (setq x (first point) y (second point))
  (setq val (nth y (nth x labyrinthe)))
  (cond
    ((eq val '-))
    ((eq val'fin))
  ))
)
;test
(check_nth lab '(0 1))
(check_nth lab '(1 1))
(check_nth lab '(3 1))
(check_nth lab '(6 11))

(check lab '(0 1))
(check lab '(1 1))
(check lab '(3 1))
(check lab '(6 11))
;@replace_list
;@PARAM list, n, val
;@RETURN list with nth elmnt replace by value
(defun replace_list (a l c)
  (cond
    ((null l) nil)
    ((eq a 0) (rplaca l c))
    (t (cons (first l) (replace_list (- a 1) (cdr l) c)))
  )
)
;test
(setq tl '($ - fin))
(replace_list 0 tl 'replaced)
(replace_list 1 tl 'replaced)
(replace_list 2 tl 'replaced)
;@replace
;@param labyrinthe, POINT (x,y), char
;@RETURN labyrinthe with POINT (x,y) = char.
(defun replace_lab (labyrinthe point c)
  (setq x (first point) y (second point))
  (cond
    ((< x 0) nil)
    ((null labyrinthe) nil)
    ((= x 0) (replace_list y (first labyrinthe) c))
    (t (replace_lab (cdr labyrinthe) (list (- x 1) y) c))
  )
)
;test
; (replace_lab lab '(0 1) 'REPLACED)
; (replace lab '(1 1))
; (replace lab '(3 1))
; (replace lab '(6 11))
(defun get_int (labyrinthe a b c d)
  (setq tmp 0)
  (if (check labyrinthe a) (setq tmp (+ tmp 1)))
  (if (check labyrinthe b) (setq tmp (+ tmp 2)))
  (if (check labyrinthe c) (setq tmp (+ tmp 4)))
  (if (check labyrinthe d) (setq tmp (+ tmp 8)))
  (setq tmp (+ tmp 0))
)
;test
(get_int lab '(0 1) '(1 1) '(4 1) '(5 1))
;@read_lab
;@PARAM labyrinthe comming with FIN, DEBUT(x,y) point to start on
;@RETURN all trees able to go from start to end
(defun read_lab (labyrinthe start)
  (setq h (list (+ (first start) 1) (second start))
        b (list (- (first start) 1) (second start))
        g (list (first start) (- (second start) 1))
        d (list (first start) (+ (second start) 1))
  )
  (replace_lab labyrinthe start '*)
  (setq val (get_int labyrinthe h b g d))
  (cond
    (
      (eq val 15)
      (list h (read_lab labyrinthe h) b (read_lab labyrinthe b)
           g (read_lab labyrinthe g) d (read_lab labyrinthe d)
      )
    )
    (
      (eq val 14)
      (lis b (read_lab labyrinthe b)
           g (read_lab labyrinthe g) d (read_lab labyrinthe d)
      )
    )
    (
      (eq val 13)
      (list h (read_lab labyrinthe h)
           g (read_lab labyrinthe g) d (read_lab labyrinthe d)
      )
    )
    (
      (eq val 12)
      (list g (read_lab labyrinthe g) d (read_lab labyrinthe d)
      )
    )
    (
      (eq val 11)
      (list h (read_lab labyrinthe h) b (read_lab labyrinthe b)
            d (read_lab labyrinthe d)
      )
    )
    (
      (eq val 10)
      (list b (read_lab labyrinthe b) d (read_lab labyrinthe d)
      )
    )
    (
      (eq val 9)
      (list h (read_lab labyrinthe h) d (read_lab labyrinthe d)
      )
    )
    (
      (eq val 8)
      (list  d (read_lab labyrinthe d)
      )
    )
    (
      (eq val 7)
      (list h (read_lab labyrinthe h) b (read_lab labyrinthe b)
           g (read_lab labyrinthe g)
      )
    )
    (
      (eq val 6)
      (list b (read_lab labyrinthe b)
            g (read_lab labyrinthe g)
      )
    )
    (
      (eq val 5)
      (list h (read_lab labyrinthe h)
           g (read_lab labyrinthe g)
      )
    )
    (
      (eq val 4)
      (list g (read_lab labyrinthe g)
      )
    )
    (
      (eq val 3)
      (list h (read_lab labyrinthe h) b (read_lab labyrinthe b)
      )
    )
    (
      (eq val 2)
      (list b (read_lab labyrinthe b)
      )
    )
    (
      (eq val 1)
      (list h (read_lab labyrinthe h))
    )
    (t nil)
  )
)
; ;test
; (trace read_lab)
(read_lab lab1 '(1 0))