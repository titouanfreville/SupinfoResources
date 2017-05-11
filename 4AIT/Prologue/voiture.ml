type voiture = {
  model: string;
  couleur: string;
  marque: string;
  prix: int;
};;

let rec listRed lVoiture = 
  match lVoiture with
  | [] -> []
  | t::q -> if t.couleur = "red" then  t::listRed q else listRed q;;

let rec listFord lVoiture = 
  match lVoiture with
  | [] -> []
  | t::q -> if t.marque="ford" then t::listFord q else listFord q;;

let rec cheaperThan lVoiture price = 
  match lVoiture with
  | [] -> []
  | t::q -> if t.prix < price then t::cheaperThan q price else cheaperThan q price;;

let rec between lVoiture p1 p2 = 
  match lVoiture with
  | [] -> []
  | t::q -> if (p1 < t.prix && t.prix < p2) then t::between q p1 p2 else between q p1 p2;;

let rec greaterThan lVoiture price = 
  match lVoiture with
  | [] -> []
  | t::q -> if t.prix > price then t::greaterThan q price else greaterThan q price;; 

let lvoiture = [
  {model= ""; couleur= "red"; marque= "ferrari"; prix= 10000};
  {model= ""; couleur= "red"; marque= "lamborghini"; prix= 20000};
  {model= ""; couleur= "blanc"; marque= "ford"; prix= 7500};
  {model= ""; couleur= "blanc"; marque= "chrysler"; prix= 12500};
  {model= ""; couleur= "bleu"; marque= "peugeot"; prix= 15000};
  {model= ""; couleur= "bleu"; marque= "talbot"; prix= 5000}
];;

listRed lvoiture;;
listFord lvoiture;;
cheaperThan lvoiture 10000;;
greaterThan lvoiture 10500;;
between lvoiture 10000 20000;;