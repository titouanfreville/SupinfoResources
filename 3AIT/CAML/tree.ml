(*
###############################################################
############ AUTHOR FREVILLE TITOUAN - ID 217821 ##############
#### Feel free to use this to improve, but don't copy them ####
###############################################################

This is NOT in the COURSES of supinfo. OCAML is a child of lisp develop by INRA (french ;))
Consult documentation for more information :) http://caml.inria.fr/
CAML is a HARD TYPED LANGAGE, type constructor help to create type so you can match more things ;)
   CAML will always take the SMALLEST RESTRICTION type when prototyping the function
ALl the function are tested with SUBLIME REPL on linux (ocaml package install)
*)

(* CAML is a strong typed language, wich mean that you can't manipulate trees as list unlike LISP
We need to create tree types (thought some types of tree are already include in CAML (search them on google ;) )
*)
(* Let's Define the binary tree type. Binary tree are tree who can only accept 2 child by nodes like the first
one presented*)
type 'a  tree = E | L of 'a | N of 'a tree * 'a * 'a tree;;
(* type : constructor for new type
 'a : mean an unkow type (but need to be fix in the tree created
 tree : name of the type
 | : separator for the different Value of a tree
 here : a 'a tree is a tree that is E (Empty) or L (Leaf) of 'a type, or N (Node) of 'a tree,'a,'a tree *)
(* To build the tree in the exemple, we'll need another type who can mix operators && numbers. Let's call it :
expression *)
type expression = O of (int -> int -> int) | I of int;;

let t_course = N(N(L(I(4)),O( * ),L(I(3))),O(+),N(L(I(5)),O( * ),L(I(2))));;
let t_course_printable = N(N(L("4"),"*",L("3")),"+",N(L("5"),"*",L("2")));;


(* Now, let's play with it :) *)
(* Let's build the tree using Graphicals ;*)
(* Add graphics :) *)
(* The following functions are helpfull when working on tree as you see quickly what is going wrong.
Need to be adapted to your structure but is a good basics. *)
#load "graphics.cma";;

open Graphics;;
let open_graph w h =
  let st = " "^w^"x"^h in
    open_graph st;;
let reset_graph =
  clear_graph;;
clear_graph;;
open_graph "1000" "600";;
(*Go draw those trees *)
(* @tree_drawing *)
(* @PARAM t: tree, x: absc start (int), y: ordon start (int), h height of step (int), w: width of step (int)
          f_print: 'a -> unit (print function) *)
(* @EFFECTS: draw the tree t from (x,y) point with first step h (steps height diveded by 2 each time) *)
(* This print function go throught the tree as the R - FG - FD *)
let rec tree_drawing t x y h w g_print =
  let hw = w / 2 and hh = h / 2 in
  match t with
  | L(l) -> moveto (x + hw) y; set_color green; g_print l; set_color black;
  | N(fg,r,fd) -> begin
                    moveto (x + hw) (y + 12); set_color cyan; lineto (x + hw / 2) (y + h - 5); moveto (x + hw) (y + 12); lineto (x+ hw + hw / 2) (y + h - 5);
                    set_color green; moveto (x + hw) y; g_print r; set_color black;
                    tree_drawing fg x (y+h) hh hw g_print;
                    tree_drawing fd (x+hw) (y+h) hh hw g_print;
                  end
  | _ -> ()
;;
let magic_drawing t g_print =
reset_graph();
tree_drawing t 0 0 100 900 g_print;;

magic_drawing t_course_printable draw_string;;

(* Let's go throug the tree as in the labs :) *)
(* First solution : FG - R - FD (native exploration *)

(* @inordre *)
(* @PARAM function, arbre binaire (1 racine a 2 branches MAXIMUM) *)
(* @RETURN fun(el a) in ordre (FG-R-FD) *)
let rec inordre g_print t =
  match t with
  | L(l) -> g_print l
  | N(fg,r,fd) -> inordre g_print fg;g_print " "; g_print r; g_print " "; inordre g_print fd;
  | _ -> ();;

(defun inordre (fun tree)
  (cond
    ((null tree))
    ((null (cdr tree)) (progn
                          (funcall fun (first tree))
                          (princ " ")
                        ))
    (t (progn
         (inordre fun (second tree))
         (funcall fun (first tree))
         (princ " ")
         (inordre fun (second (cdr tree)))
        ))
  )
)

inordre print_string t_course_printable;;

(* @postordre *)
(* @PARAM function, arbre binaire (1 racine a 2 branches MAXIMUM) *)
(* @RETURN fun(el a) in ordre (FG-FD-R) *)
let rec postordre g_print t =
  match t with
  | L(l) -> g_print l
  | N(fg,r,fd) -> postordre g_print fg; g_print " "; postordre g_print fd; g_print " "; g_print r;
  | _ -> ();;

postordre print_string t_course_printable;;
