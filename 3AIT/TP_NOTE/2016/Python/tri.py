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

# Probleme Python ######################################################################################
# Question 2.2
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

# tri_croiss
# @param List
# @return Liste trié dans l'ordre croissant
def tri_croiss(l):
  return tri(l,inf)

# tri_decroiss
# @param List
# @return Liste trié dans l'ordre décroissant
def tri_decroiss(l):
  return tri(l,sup)

def main():
  lmonaie=[1,2,3,4,5,6,7,8,9,10,20,50]
  print "Liste trier en ordre croissant"
  l1= tri(lmonaie, inf)
  print l1
  print "Liste trier en ordre décroissant"
  l2= tri(lmonaie, sup)
  print l2
  print "Liste renvoyer comme tuple (lCroissant, lDécroissant,)"
  return (l1,l2,)