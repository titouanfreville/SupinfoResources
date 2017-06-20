# Grammaire

*Temps total corecteur: 1h avec la déco. 30min fonctionelle et résolue.*

```OCaml
logicExprs = LogicExpr LogicExpres | LogicExpr
logicExpr = operationsBinaire '='
operationsBinaire = operationBinaire operationsBinaire | operationBinaire val
operationBinaire = val op
op = and | or | & | '|' | = | '(' | ')'
val = 0 | 1
```