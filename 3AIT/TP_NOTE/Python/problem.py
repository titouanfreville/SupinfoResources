#! /usr/bin/env python
# -*- coding: utf-8 -*-

# LIST FUNCTIONS ----------------------------------------------------------------------
# FUNCTION ON LISTS WITHOUT DELETE Lsp Likes
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

# Probleme Python #####################################################################
# Question 2.1 
# Les valeurs proposables sont les valeurs entière entre 1 et 10 n'existant pas déjà,
# par conséquents, les valeurs proposables sont : 3, 4, 6, 7, 8 et 9
# -------------------------------------------------------------------------------------
# Question 2.2 ---- tester (programme dans tri.py) ------------------------------------
ltest=[2,1,6,5,3,4]
ltest1s=[7,3,1]
ltest2s=[5,4,2]
ltest1i=[1,3,7]
ltest2i=[2,4,5]
# Split
# @param list
# @return (l1,l2) tel que l1+L2 = list && 0 < size (l1) - size (l2) < 2
def split (l):
  if l==[]:
    return ([],[],)
  elif cdr (l)==[]:
    return ([car (l)],[])
  else:
    dl = split (cdr (cdr (l)))
    return ([car (l)]+dl[0],[car (cdr (l))]+dl[1])

# print split (ltest)

sup = lambda a , b: a > b
inf = lambda a , b: a < b
# Fusion
# @param  l1, l2 toutes deux triées, f_comp la fonction de comparaison à utiliser
# @return l triées comportants les éléments de l1 && l2
def fusion (l1,l2,f_comp):
  if (l1 == []):
    return l2
  elif (l2 == []):
    return l1
  elif f_comp (car (l1), car (l2)):
    return ([car (l1)]+fusion (cdr (l1),l2,f_comp))
  else:
    return ([car (l2)]+fusion (l1,cdr (l2),f_comp))

# print fusion (ltest1s,ltest2s,sup)
# print fusion (ltest1i,ltest2i,inf)

# Tri
# @param l, f_comp
# @return l  triée selon f_comp
def tri (l,f_comp):
  if (l == []):
    return l
  elif (cdr (l) == []):
    return l
  else:
    dl = split (l)
    return fusion (tri (dl[0],f_comp), tri (dl[1],f_comp), f_comp)

# print tri (ltest,sup)
# print tri (ltest,inf)
# -------------------------------------------------------------------------------------
# Question 2.3 ------------------------------------------------------------------------
# rec_plus_grande_monnaie
# Sous fonciton récursive de plus_grande_monnaie
# @param l, somme
# @return plus grande monaie plus proche de somme, None if not found
def rec_plus_grande_monnaie(l,somme):
  if l==[]:
    return None
  elif (last (l) <= somme):
    return last (l)
  else:
    return rec_plus_grande_monnaie(butlast (l),somme)


# rec_plus_grande_monnaie
# @param l, somme
# @return plus grande monaie plus proche de somme, None if not found
def plus_grande_monnaie(l,somme):
  l_in=tri(l,inf)
  return rec_plus_grande_monnaie(l,somme)

lmonnaie = [1,2,5,10,20,50]
# print plus_grande_monnaie(lmonnaie,99)

# somme
# @param liste de mannaie, valeur
# @return Plus petit ensemble de monnaie à utiliser pour faire val
def somme(l, val):
  pgm=plus_grande_monnaie(l, val)
  if ( 0 == val):
    return []
  else:
    return [pgm] + somme(l, val-pgm)

# print somme(lmonnaie,99)
# -------------------------------------------------------------------------------------
# Question 2.5 ------------------------------------------------------------------------
# seize_liste
# @param l
# @return taille de l
def seize_liste(l):
  if l==[]:
    return 0
  else:
    return 1+seize_liste(cdr (l))

# rec_max_valeur
# Sous foncitons pour max_valeur
# @param liste monnaie, tempon domme, tempon max liste somme
# @return liste du plus grand ensemble de pièce nécessaire pour faire tt les sommes possibles
def rec_max_valeur(l,stmp, max_tmp):
  if (stmp == 0):
    return max_tmp
  else:
    n_tmp=somme(l,stmp)
    if (seize_liste(n_tmp) > seize_liste (max_tmp)):
      return rec_max_valeur(l, stmp-1,n_tmp)
    else:
      return rec_max_valeur(l,stmp-1,max_tmp)

# rec_max_valeur
# @param liste monnaie
# @return liste du plus grand ensemble de pièce nécessaire pour faire tt les sommes possibles
def max_valeur(l):
  return rec_max_valeur(l,99,[])

# print max_valeur(lmonnaie)
# -------------------------------------------------------------------------------------
# QUESTION 2.6 && 2.7 -----------------------------------------------------------------
# Les foncitons définis en 2.4 && 2.5 vérifie déjà les propriétées demandé
# Preuves :
# SI m appartient à lm alors max(liste_valeur_inf_m) == m 
# Sinon, SOMME(max(liste_valeur_inf_m)) étant == m est forcément la plus petite 
# car pour mettre des valeurs autre dans la parite max, il faut ajouter plus 
# d'éléments (car 50=20+20+10) donc 3 éléments au lieu de 5
# On peut donc dire : 

Somme_2 = lambda x,y : somme(x,y)
max_valeur_2 = lambda x : max_valeur (x)


# # print Somme_2 (lmonnaie,50)
# # print Somme_2 (lmonnaie,59)
# # print max_valeur_2 (lmonnaie)
