# Fonction carré en python LAMBDA VERSION ;)
carre = lambda n : n*n
# Fonction cube en python
cube = lambda n : carre(n) * n
# CAR en python
car = lambda l : l[0]
# CDR ?
cdr = lambda l : l[1:]
# last
last = lambda l : l[-1]
# but last
butlast = lambda l : l[:-1]


# Que font les fonctions suivante :
# retourne vrai si a dans l
magyk = lambda l,a : a in l

# si a dans l, affiche le nombre d'occurence de a dans l sinon affiche not found
def spell (l,a):
  if (magyk (l,a)):
    print (count(l,a))
  else:
    print "404"

# @connais
# @PARAM fact, initial_facts (map), memory (map)
# @RETURN Value (bool) of the fact if fact in initials or memory, None else
def connais(fact, initial_facts, memory):
  if (initial_facts.has_key(fact)):
    return initial_facts[fact]
  else:
    if (memory.has_key(fact)):
      return memory[fact]
    else:
      return None

# @verifie
# @PARAM list axiom, init_fact, memoire
# @RETURN true if axiom all true in init_fact && memoire, false else
def verifie(axioms, init_fact,memoire):
    if axioms==[]:
      return True
    else:
      val = car(axioms)
      if connais(val, init_fact, memoire) is not None:
        if (connais(val, init_fact, memoire)):
          return verifie(cdr(axioms),init_fact,memoire)
        else:
          return False
      else:
        return None

# Faire la fonction Membre qui renvoie le membre si elle le trouve None sinon
def membre(l,a):
  if l==[]:
    None
  else:
    if (car l == a):
      return a
    else:
      return membre(cdr l,a)

# Ecrire en python l'ensemble de fonctions : split (qui sépare en deux), fusion qui prend deux liste triés et en renvoie une seule triées contenant
# tous les éléments des 2 listes && tri_fusion qui trie une liste via split && fusion
# ex
# [ 3 1 2 5 ]
# => [ 1 3 ] [ 2 5 ]
# ==> [ 2 ] [ 1 ]
# ==> [ 1 3 ]
# ==> [ 1 5 ]
# ==> [ 2 5 ]
# ==> [ 1 2 3 5 ]
def split(l):
  if l==[]:
    ([],[])
  elif cdr l==[]:
    (car l,[])
  else:
    l1=split(cdr(cdr (l)))[0]
    l2=split(cdr(cdr (l)))[1]
    return ([car(l)]+l1,[car(cdr(l))]+l2)


def fusion(l1,l2):
  if (l1==[] and l2==[]):
    return []
  elif l1==[]:
    return l2
  elif l2==[]:
    return l1
  elif car l1 < car l2 :
    return [car l1]+fusion(cdr l1,l2)
  else:
    return [car l2]+fusion(l1,cdr l2)

def tri_fusion(l):
  if l==[]:
    return []
  elif cdr l ==[]:
    return l
  else:
    a=split(l)[0]
    b=split(l)[1]
    return fusion (tri_fusion a) (tri_fusion b)
