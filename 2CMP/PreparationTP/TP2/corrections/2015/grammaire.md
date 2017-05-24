# Grammaire EBNF

```OCaml
G= (
  {0,...9, a, ... z, A, ...Z, =, +, >, <, TANTQUE, FAIRE, FINTANTQUE, ET, "{", "}"} (* terminaux*),
  {<Expr>, <Cond>, <Actions>, <A1>, <A2>, <var>, <nb>, <Comp>, <Lettre>, <Chiffre>} (* terminaux *),
  { (* production *)
    <Expr>::= TANTQUE <Cond> [ET <Cond>] FAIRE <Actions> FINTANTQUE
    <Cond>::= "{" <var> <Comp> <nb> "}"
    <Actions>::="{"<A1>;<A2>;"}"
    <A1>::= <var> = <nb>
    <A2>::= <Lettre>++
    <var>::= {<Lettre>}
    <nb>::={<Chiffre>}
    <Lettre>::=a|b|...|z|A|...|Z
    <Chiffre>::=0|...|9
    <Comp>::= < | >
  },
  { <Expr> } (*axiome*)
)
```

Cette grammaire peut être annalysez aussi bien en LR que en LL. (To CHECK)