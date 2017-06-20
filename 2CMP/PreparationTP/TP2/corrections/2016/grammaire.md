# Grammaire EBNF

```OCaml
G= (
  {"0", ..., "9", "a", ... "z", "(", ")", " "} (* terminaux*),
  {<S>, <atome>, <liste>, <nombre>,<lettre>, <séparateur> } (* non-terminaux *),
  { (* production *)
    <S> ::= <atome> | <liste>
    <liste> ::= {"("S")"}
    <atome> ::= <nombre> | <lettre> | <séparateur>
    <nombre> ::= "0" .. "9"
    <lettre> ::= "a" .. "z"
    <séparateur> ::= " "
  },
  { <S> } (*axiome*)
)
```