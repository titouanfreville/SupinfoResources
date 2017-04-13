# Grammar for artihmetics with weight management

```Ocaml
Exprs = Expr
Expr = Exnum "="
Exnum = Fact
Exnum = Exnum "+" Fact
Exnum = Exnum "-" Fact
Fact = Term
Fact = Fact "*" Term
Fact = Fact "/" Term
Term = "nb"
Term = "(" Exnum ")"
```

(Same as the one in the lesson :O)