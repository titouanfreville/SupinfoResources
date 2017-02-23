###############################################################
############ AUTHOR FREVILLE TITOUAN - ID 217821 ##############
#### Feel free to use this to improve, but don't copy them ####
###############################################################
# Python tested using python 2 on Ubuntu ;)
# IMPORTS -----------------------------------------------------------------------------
import sys
# -------------------------------------------------------------------------------------
# LIST FUNCTIONS ----------------------------------------------------------------------
# FUNCTION ON LISTS WITHOUT DELETE
# @car
# @PARAM list
# @RETURN first element
def car (l):
  return l[0]
# @cdr
# @PARAM list
# @RETURN list without head
def cdr (l):
  return l[1:]
# @last
# @PARAM list
# @RETURN value of the last element in list
def last (l):
  return l[-1]
# @butlast
# @PARAM list
# @RETURN list without last element
def butlast (l):
  return l[:-1]
# -------------------------------------------------------------------------------------
# Labs --------------------------------------------------------------------------------
# TP 9 - 2 - A PARTIR DES ELEMENTS VUS EN COURS REALISER UN SYSTEME EXPERT (2 to 3hrs)
# Il est dit d utiliser des TUPLES et non des LISTES pour les axiomes du systemes expert.
# Apres discussion avec le professeur, le systeme liste est plus pertinant
# car ne necessite pas de connaitre le nb d'axiomes.
# Une regles est donc un tuples d'une liste et d'un string. :)
# ########## DEFINITIONS DES REGLES ########## #
regles = [
(['animal a des plumes','animal a des ailes'],'animal est oiseau',),
(['animal alaite'],'animal est mamifere',),
(['animal est invertebre'],'animal est arachnide',),
(['animal est oiseau','animal vole bien','animal marche mal'],'albatros',),
(['animal est oiseau','animal vole mal','animal nage bien'],'manchot',),
(['animal est oiseau','animal vole bien','animal nage bien','annimal vit au pole sud'],'pinguoin',),
(['animal est mamifere','animal vit dans l eau'],'cetace',),
(['animal est arachnide','animal est velue'],'areignee',),
(['animal est arachnide','animal est venimeux'],'scorpion',)
];
# ########## ########## ########## #
# ########## INIT FACTS ########## #
faitsinitiaux = {
}
# ########## ERRORS ########## #
# @ERROR : ElementUnkow
# Error to be return when element searched is not in list
class ElementUnkow(Exception):
  def __init__(self, value):
    self.value = value
  def __str__(self):
    return repr(self.value)
# ########## ########## ########## #
# ########## FONCTIONS ########## #
# @dansalors
# @PARMATER fact (string), rules
# @RETURN Fact's axioms (string list)
# @THROW ElementUnknow if element don't exist
def dansalors(fact, rules):
  if rules==[] :
    raise ElementUnkow('Fact '+str(fact)+' was not known.')
  elif car(rules)[1] == fact :
    return car(rules)[0]
  else:
    return dansalors(fact,cdr(rules))
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
# @memorise
# @PARAM fact, val (bool), memory
# @RETURN memory with fact
def memorise(fact, val, memory):
  memory[fact]=val
  return memory
# @demander
# @PARAM fact, question
# @RETURN user answer
def demander(fact, question):
  print question+" "+fact+" ?"
  valid = {"yes": True, "y": True, "ye": True, "no": False, "n": False}
  choice = raw_input().lower()
  if choice in valid:
    return valid[choice]
  else:
    print "Reponse not valid, please answer with 'yes/y/ye or no/n."
    return demander (fact, question)
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
# @justifie
# @PARAM fait, regles, memoire, init_fact
# @RETURN Tue if fact can be justify False else, None if fact can't be justifie (no false value, but not all complete)
def justifie(fait, regles, memoire, init_fact):
  l=list(dansalors(fait, regles))
  if l==[]:
    raise ElementUnkow('Fact '+str(fait)+' was not define.')
  else:
    return verifie(l,init_fact,memoire)
# @depart
# @PARAM diagnositics list, rules, init_fact, memory
# @RETURN True if a diagnostic was confirmed, false else
def depart(diagnostics, rules, init_fact,memory):
  l=list(diagnostics)
  if l==[]:
    print "You are searching for something that is out of my knowledge."
    return False
  else:
    val=car(l)
    test=justifie (val, rules, memory, init_fact)
    if test==None:
      ax=list(dansalors(car(l), regles))
      stop=False
      while(stop==False and len(ax)>0):
        know=connais(car(ax),init_fact,memory)
        if know is not None:
          if know:
            ax=cdr(ax)
          else:
            stop=True
            value=None
        else:
          stop=True
          value=car(ax)
          ans=demander(value,'Est il vrai que : ')
      if value is not None:
        if ans:
          memory=memorise(value,ans,memory)
          return depart(diagnostics,rules,init_fact,memory)
        else:
          memory=memorise(value,ans,memory)
          return depart(cdr(diagnostics),rules,init_fact,memory)
      else:
        return depart(cdr(diagnostics),rules,init_fact,memory)
    elif test:
      print "You were searching for "+str(val)+", weren't you ?"
      return True
    else:
      print "You are searching for something that is out of my knowledge."
      return False      
# ########## ########## ########## #
# ########## MAIN - TESTS ########## #
# @main
# @PARAM rules
# @RETURN True if something was determined, false else
def main(rules):
  print rules
  diagnostics=['albatros','scorpion','manchot','pinguoin','cetace','areignee']
  print diagnostics
  return depart(diagnostics, rules, faitsinitiaux, {})
# Test :)
main(regles)
# ########## ########## ########## #
