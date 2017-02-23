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
(* Generate random lists for test *)
let rec gen_list_float n = match f with
  | 0 -> [Random.float 100.]
  | _ -> Random.float 100. :: gen_list_float (f -. 1);;
let rec gen_list_int n = match n with
  | 0 -> [Random.int 100]
  | _ -> Random.int 100 :: gen_list_int (n - 1);;


(* TP 1 - La Programmation Fonctionnelle (done with a langage :O) *)
(* TP 1 - 1 - APPARTENANCE *)
(* Let rec name p1 p2 etc define a RECURSIVE function of name "name"
  using p1 p2 etc as parameters
*)
let rec find_red l_color =
  (* match X with tell to match X with values (if X == Values then do ->
    match case are introduce with |
    _ is the undefined case
  *)
  match l_color with
  (*
    l color is a string list ('a list is a basic type of OCAML)
    [] is the empty list
    t::q represent a list who have at least one element
    t is the head of the list
    q the queue :p
    you can't acces other elements than head of list (you don't have
    direct to nth elements of list in CAML)
  *)
  | [] -> false
  | t::q -> t = "red" || find_red q;;
let rec find_color l_color c =
  match l_color with
  | [] -> false
  | t::q -> t = c || find_color q c;;
(* Test the function *)
#trace find_red;;
let rest_red_1 = ["green";"green";"red"; "red"];;
let rest_red_2 = ["green";"green";"green";"blue"];;
find_red rest_red_1;;
find_red rest_red_2;;
find_color rest_red_1;;
find_color rest_red_1;;
(* TP 1 - 2 - AUTANT DE 1 QUE DE 0 *)
(* (X,Y,Z,...) is a tuple of X, Y, Z, etc ...
   access must be done by matching : (let (x,y,z,...)=tuple)
*)
let rec asmuch_naive_rec list n1 n0 =
  match list with
  | [] -> (n1,n0)
  | t::q -> if (t = 1)
              then asmuch_naive_rec q (n1+1) n0
              else asmuch_naive_rec q n1 (n0+1);;
let asmuch_naive list =
  let (a,b) = asmuch_naive_rec list 0 0 in a = b;;

let rec asmuch_naive_less_variable_rec list n =
  match list with
  | [] -> n = 0
  | t::q -> if (t = 1)
              then asmuch_naive_less_variable_rec q (n+1)
              else asmuch_naive_less_variable_rec q (n-1)
;;
let asmuch_naive_less_variable list =
  asmuch_naive_less_variable_rec list 0;;
(* Those 2 are the easiest && fastet way to solve the pb in caml
   As we can't have a quick access to the end of the list ;)
   if we want to adapt the subject to CAML :
   we have say that bits are done by having as much as possible
   1 between 0 && 0 between 1 if format like this
*)
let rec asmuch_camlformat list =
  match list with
  | [] -> true
  | t::[] -> false
  | a::b::q -> a != b && asmuch_camlformat q;;

(* TP 1 - 3 - AUTANT DE 1 QUE DE 0 *)
let rec more_naive_rec list n1 n0 =
  match list with
  | [] -> (n1,n0)
  | t::q -> if (t = 1)
              then more_naive_rec q (n1+1) n0
              else more_naive_rec q n1 (n0+1);;
let more_naive list =
  let (a,b) = more_naive_rec list 0 0 in a != b;;

let rec more_naive_less_variable_rec list n =
  match list with
  | [] -> n != 0
  | t::q -> if (t = 1)
              then more_naive_less_variable_rec q (n+1)
              else more_naive_less_variable_rec q (n-1)
;;
let more_naive_less_variable list =
  more_naive_less_variable_rec list 0;;
(* Those 2 are the easiest && fastet way to solve the pb in caml
   As we can't have a quick access to the end of the list ;)
   if we want to adapt the subject to CAML :
   we have say that bits are done by having as much as possible
   1 between 0 && 0 between 1 if format like this
*)
let rec more_camlformat list =
  match list with
  | [] -> false
  | t::[] -> true
  | a::b::q -> a = b || more_camlformat q;;

(* all the function can work with the format we described for caml
so the test case wil be like this :) *)
let test_bits_eq = [1;0;1;0;1;0];;
let test_bits_1 = [1;0;1;0;1;0;1;1;1;1];;
let test_bits_0 = [0;1;0;1;0;1;0;0];;
(* #trace more_naive;;
#trace more_naive_less_variable;;
#trace more_camlformat;; *)
asmuch_naive test_bits_eq;;
asmuch_naive test_bits_1;;
asmuch_naive test_bits_0;;
asmuch_naive_less_variable test_bits_eq;;
asmuch_naive_less_variable test_bits_1;;
asmuch_naive_less_variable test_bits_0;;
asmuch_camlformat test_bits_eq;;
asmuch_camlformat test_bits_1;;
asmuch_camlformat test_bits_0;;
(**)
more_naive test_bits_eq;;
more_naive test_bits_1;;
more_naive test_bits_0;;
more_naive_less_variable test_bits_eq;;
more_naive_less_variable test_bits_1;;
more_naive_less_variable test_bits_0;;
more_camlformat test_bits_eq;;
more_camlformat test_bits_1;;
more_camlformat test_bits_0;;
(* -------------------------------------------------------------------------------------------- *)
(* TP 2 - 3 *)
(* Return value from a list *)
(* @RetourneValeur *)
(* @PARAMETERS 'a list, 'a el *)
(* @RETURN True if el in list, false else *)
let rec RetourneValeur list e = match list with
  | [] -> false
  | t::q -> t==e || RetourneValeur q;;
(* Here a good point of Functionnal langage in most of case : the functions have the lowest level of type possible,
if you don't use specifics operators, it will have a neutral type like here. Function search_color from TP 1 &&
this one are exactly the same and will work with any type of data, as long as it is a list of simple type format.
Will not work if your list is of an own define type, make sure to improve Pervasive library so it will still work ;) *)

(* Carre *)
(* I don't like this implementation of Carre (useless :p) *)
(* @Carre *)
(* @PARAMETERS float i *)
(* @RETURN i*i *)
let carre f = match f with
  | 0. -> 0.
  | _ -> f*.f;;
(*Here is a typed function. *. is a specific operator for float. The carre function will reject any parameter witch
is not a float. *)

(* Cube *)
(* @Cube *)
(* @PARAMETERS float i *)
(* @RETURN i*i*i *)
let cube f = match f with
  | 0. -> 0.
  | _ -> carre f *. f;;

(* A true recursive power function *)
(* @Power *)
(* @PARAMETERS float i, int n *)
(* @RETURN i^n *)
let rec pow f n = match n with
  | 0 -> 1.
  | _ -> pow f (n-1) *. f;;
(*  This one will work for any n given but will be stopped by your computer limits
If you want to get ride of this, we have to use TERMINAL RECURSIVES function. This mean
that when you call the recersive function, you are not allowed to make any operation on it.
It have to be auto suffisent. For pow, it will give *)
(* @pow_term*)
(* @PARAMETERS float i, int n, float res *)
(* @RETURN i^n *)
let rec pow_term f n res = match n with
  | 0 -> res
  | _ -> pow_term f (n-1) (res*.f);;
(* To ease use of this function, let's make a caller for it *)
(* @use_pow_term *)
(* @PARAMETERS float i, int n *)
(* @RETURN i^n *)
let use_pow_term f n =
  pow_term f n 1.;;
(* TEST :) *)
let f1 = 0.;;
let f2 = 2.;;
let f3 = 0.5;;
let f4 = 10.;;
let n1 = 2;;
let n2 = 3;;
let n3 = 10;;
let n4 = 100000000;;
(* Carre && Cube*)va
carre f1;;
cube f1;;
carre f2;;
cube f2;;
carre f3;;
cube f3;;
carre f4;;
cube f4;;
(* Rec POW *)
pow f4 n1;;
use_pow_term f4 n1;;
pow f4 n2;;
use_pow_term f4 n2;;
pow f4 n3;;
use_pow_term f4 n3;;
(*This one will provoke a stack overflow for pow && not for use_pow_term *)
pow f4 n4;;
use_pow_term f4 n4;;
(* Multi : the aim of multi in LISP is to create a NAME function within a function so we can use it after.
We can't do this in FUNCTIONNAL caml as we can't manipulate the pointers. (not really true, but some one
will kill kittie if you do so :p But we can do something funnier... We can define a function that return ....
A function :O As function are objects from the langage, we can use it in parameters or as return values ^^ *)
let multi n =
  (function m -> n *. m);;
(* Let's use this to interprete the return values of CAML ;)
As you pb so, caml return's value when defining a function are quite long ...
It provide you the information about what types of arguments are expected, and the type of the
object that will be returned by the function
here, the retrun is something like :
 val multi : float -> float -> float
val multi say that we defined an object Multi. We know that multi expect 1 parameter. It is the one at the top left of
the return, and here, is a float. Then we have a -> that give the next argument (if your function
expect multiple arguments), or what is return. Here, we can have no more arguments to define so it's the return
of the function ... The return is always one object (you can't make a function return multiple objects ;) )
but we have float -> float ... wich mean that the object returned is a Function of Float which will return
a float :) *)
(* Proof *)
let multiply = multi 4.;;
multiply 2.;;
(* Funny, isn't it ? :p *)
(* Also, if you want to call a known function, just call it with the good arguments ... But if you want to call
an unknow function, use (function (parmeters) -> (operations) as in multi *)
(* -------------------------------------------------------------------------------------------- *)
(* TP 3 - La programmation Fonctionnelle && CAML *)
(* include
Au sens des sélecteurs
Soit include la fonction -> Boolean
F(L1,L2): selon L1
   Vide (L1) : true
   non Vide(L2): i = Premier(L1);
                DEBUT appartient
                Soit appartient la fonction -> >Boolean
                F(i,L2)
                  selon L2
                      Vide (L2) : false
                      non Vide(L2) : Premier(L2) == i ou alors appartient (i, Fin L2)
               FIN APPARTIENT
               et include (FIN L1, L2)$ *)
(* @l_in *)
(* @PARAMETERS element, list *)
(* @RETURN true si element in list, false sinon *)
(* Oops, again ... we already done it twice don't you think so ? *)
let rec l_in e list= match list with
  | [] -> false
  | t::q -> t==e || l_in e q;;
(* This one is a natural terminal function ... Cause t==e is tested before calling the rec.
You can make the recursive call before, and then, it will not be terminal any more and will overflow quite easily ~~ *)

(* @inclus *)
(* @PARAMETERS list1, list2 *)
(* @RETURN true if list1 include in l2, false else *)
let rec inclus l1 l2 = match l1 with
  | [] -> true
  | t::q -> l_in t l2 && inclus q l2;;
(* All the 2* operators (|| et &&) in CAML are lazy ;) *)
(* You can use the singles ones | ou & if you need both to be evaluate what ever happen (not used in most of cases) *)
(* Test *)
let l1 = gen_list_int 10;;
let l2 = gen_list_int 20;;
let l3 = gen_list_int 20;;
let l4 = gen_list_int 10;;
(**)
inclus l1 l2;;
inclus l1 l4;;
inclus l3 l4;;
inclus l1 l3;;
(* compare
Au Sens des Constructeurs :
Soit compare la fonction -> Boolean
F(e,_) = "Arguments n'est pas une liste :" e
F(_,e) = "Arguments n'est pas une liste :" e
F([],[]) = true
F([],l) = false
F(l,[]) = false
F([],l2) = true
F(e°l1,l2) = DEBUT REMOVE
            Soit remove la fonction -> list
             F(e,[]) = []
             F(e, le°l) = if (e==le) then l else le&(remove e l)
            FIN REMOVE
            compare l1 (remove e l2) *)
(* @remove_first *)
(* @PARAMETERS element, list l, list acc*)
(* @RETURN l without the first occurence of element *)
let rec term_remove_first e list acc = match list with
  | [] -> acc
  | t::q -> if (e==t) then q@acc else term_remove_first e q (t::acc);;
let remove_first e l =
  term_remove_first e l [];;
(* @compare *)
(* @PARAMETER list1, list2f *)
(* @RETURN true if list1 <=> list2, false sinon *)
let rec m_compare l1 l2 = match l1,l2 with
  | ([],[]) -> true
  | ([],_) -> false
  | (_,[]) -> false
  | (t::q,_) -> m_compare q (remove_first t l2);;
(* test *)
m_compare l1 l2;;
m_compare l1 l4;;
m_compare l3 l4;;
m_compare l1 l3;;
(* unique *)
(* Au sens des constructuer : *)
(* Soit unique -> list *)
(* f([]) -> [] *)
(* f(e°l) -> if (e in l) then unique l else e&(unique l) *)
(* @term_unique *)
(* @PARAM sorted list, acc *)
(* @RETURN list without duplicates elements *)
let rec term_unique l acc = match l with
  | [] -> acc
  | t::[] -> t::acc
  | t::e::q -> if (t==e) then term_unique (e::q) acc else term_unique (e::q) (t::acc);;
(* Quick sort : fusion *)
(* @split *)
(* @PARAM list acc1 acc2 *)
(* @RETURN acc1,acc2 (list splitted) *)
let rec split l a1 a2 = match l with
  | [] -> (a1,a2)
  | t::[] -> (t::a1,a2)
  | t::e::q -> split q (t::a1) (e::a2);;
(* @fusion *)
(* @PARAM sorted l1 sorted l2 acc *)
(* @RETURN list containing l1 && l2 sorted *)
let rec fusion_hard l1 l2 a = match l1,l2 with
  | ([],[]) -> a
  | ([],_) -> a@l2
  | (_,[]) -> a@l1
  | (t1::q1,t2::q2) -> if (t1 < t2) then fusion_hard q1 l2 (a@[t1]) else fusion_hard l1 q2 (a@[t2]);;
let rec fusion l1 l2 = match l1,l2 with
  | ([],[]) -> []
  | ([],_) -> l2
  | (_,[]) -> l1
  | (t1::q1,t2::q2) -> if (t1 < t2) then t1::fusion q1 l2 else t2::fusion l1 q2;;
(* @quick_sort *)
(* @PARAM list *)
(* @RETURN sorted list *)
let rec quick_sort l = match l with
  | [] -> []
  | t::[] -> [t]
  | _ -> let (l1,l2) = split l [] [] in fusion (quick_sort l1) (quick_sort l2);;
let unique l =
  term_unique (quick_sort l) [];;
(*test *)
quick_sort l1;;
quick_sort l2;;
quick_sort l3;;
quick_sort l4;;
let l_uni = [1;2;3;6;3;2;4;1;9;10;11;10;2;3;5;99];;
unique l1;;
unique l2;;
unique l3;;
unique l4;;
unique l_uni;;
(*  reunion
 Au sens des constructuer :
 Soit reunion -> list
 f([],E) -> E
 f(e°l, E) -> if (e in E) then reunion l E else e&(reunion l E) *)
(* @reunion_rec *)
(* @PARAM l list, e ensemble *)
(* @RETURN E(lUe) *)
let rec reunion_rec l e = match l with
  | [] -> e
  | t::q -> if (l_in t e) then reunion_rec q e else reunion_rec q (t::e);;
(* @reunion *)
(* @PARAM l1 l2 *)
(* @RETURN E(l1Ul2) *)
let reunion l1 l2 =
  reunion_rec l1 (unique l2);;
(**)
(* inter *)
(* Au sens des constructuer : *)
(* Soit inter -> list *)
(* f([],l2) -> [] *)
(* f(e°l, l2) -> if ((e in l) ou alors not (e in l2) then reunion l E else e&(reunion l E) *)
(* @inter_rec *)
(* @PARAM list1,list2,list3 *)
(* @RETURN list3 (= list1^list2) *)
let rec inter_rec l1 l2 acc = match l1 with
  | [] -> acc
  | t::q -> if (l_in t l2) then inter_rec q l2 (t::acc) else inter_rec q l2 acc;;

let inter l1 l2 =
  inter_rec l1 l2 [];;
(*Test*)
reunion l1 l2;;
reunion l2 l3;;
reunion l1 l4;;
inter l1 l2;;
inter l2 l3;;
inter l1 l4;;
