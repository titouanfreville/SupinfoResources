Random.self_init ();;

let rec getRandomID lID n iList=
	match (lID, n) with
	| (t::_, 0) -> t
	| (t::[], 1) -> t
	| ([], n) -> getRandomID iList (n-1) iList
	| (t::q, n) -> getRandomID q (n-1) iList

let getRandom l =
	let r = Random.int((List.length(l)+30)*Random.int(10)+Random.int(50)) in
	getRandomID l r l

let rec removeE e l =
	match l with
	| [] -> []
	| t::q -> if t = e then q else t::removeE e q

let rec init n =
	match n with
	| 0 -> []
	| n -> n::init (n-1)

let rec getSubject l =
	match l with
	| [] -> print_string "no more subject\n"; exit 0;
	| l -> let id = getRandom l in print_int id; let _ = read_line () in getSubject (removeE id l)

let main () =
	let l = init 45 in
	getSubject l;;

main ()