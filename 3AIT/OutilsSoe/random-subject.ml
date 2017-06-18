let rec getRandomID lID n iList=
	match (lID, n) with
	| (t::_, 0) -> t
	| (t::[], 1) -> t
	| ([], n) -> getRandomID iList (n-1) iList
	| (t::q, n) -> getRandomID