###############################################################
############ AUTHOR FREVILLE TITOUAN - ID 217821 ##############
#### Feel free to use this to improve, but don't copy them ####
###############################################################

# This is the reinterpretation of tp 1 to 3 for python
# Python tested using python 2 on Ubuntu ;)
# FUNCTION ON LISTS WITHOUT DELETE -----------------------------------------------------
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
# TP 1 -  La Programmation Fonctionnelle (done with a langage :O) ---------------------
# TP 1 - 1 : Appartenance
# Function ####################################################
# @find_red
# @PARAM list
# @RETURN True if red in list, False else
def find_red (l):
  if len(l) > 0 :
    if (car(l)=='red'):
      return True
    else:
      return find_red(cdr(l))
  else:
    return False

# @find_color
# @PARAM list, c of string
# @RETURN true if c in list, false else
def find_color (l,c):
  if len(l) > 0 :
    if (car(l)==c):
      return True
    else:
      return find_color(cdr(l),c)
  else:
    return False
# #############################################################
# Test ########################################################
l1=['green','red','green']
l2=['green','blue','green','blue','green','red','red','green']
l3=['green','green','blue','blue','green','blue']
print "Result of test for find red (l1 - l2 - l3)"
print l1
print find_red(l1)
print l2
print find_red(l2)
print l3
print find_red(l3)
print "Result of test for find color (l1 - l2 - l3)"
print l1
print find_color(l1,'blue')
print l2
print find_color(l2,'blue')
print l3
print find_color(l3,'blue')
# #############################################################
# TP 1 - 2 : Autant de 1 que de 0
# Function ####################################################
# As much as : naive
# @asmuch_naive
# @PARAM list compt
# @RETURN True if as much 0 as 1 , false else
def asmuch_naive (l,n):
  if len(l) > 0 :
    if (car(l)==1):
      return asmuch_naive (cdr(l),n+1)
    else:
      return asmuch_naive (cdr(l),n-1)
  else:
    return (n==0)
# As much : using last
# @asmuch_last
# @PARAM list
def asmuch_last (l):
  if len(l) > 1 :
    if (car(l)==last(l)):
      return False
    else:
      return asmuch_last (butlast(cdr(l)))
  else:
    if len(l) > 0 :
      return False
    else:
      return True
# #############################################################
# Test ########################################################
l4=[1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0]
l5=[1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0]
l6=[1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0]
print "Result as_much naive for list : "
print l4
print asmuch_naive(l4,0)
print l5
print asmuch_naive(l5,0)
print l6
print asmuch_naive(l6,0)
print "Result asmuch_last for list : "
print l4
print asmuch_last(l4)
print l5
print asmuch_last(l5)
print l6
print asmuch_last(l6)
# #############################################################
# #############################################################
# TP 1 - 3 : Plus de 1 ou de 0
# Function ####################################################
# As much as : naive
# @more_naive
# @PARAM list compt
# @RETURN True if more 0 or 1 , false else
def more_naive (l,n):
  if len(l) > 0 :
    if (car(l)==1):
      return more_naive (cdr(l),n+1)
    else:
      return more_naive (cdr(l),n-1)
  else:
    return (n!=0)
# As much : using last
# @more_last
# @PARAM list
def more_last (l):
  if len(l) > 1 :
    if (car(l)==last(l)):
      return True
    else:
      return more_last (butlast(cdr(l)))
  else:
    if len(l) > 0 :
      return True
    else:
      return False
# #############################################################
# Test ########################################################
l4=[1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0]
l5=[1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0]
l6=[1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0]
print "Result more_naive for list : "
print l4
print more_naive(l4,0)
print l5
print more_naive(l5,0)
print l6
print more_naive(l6,0)
print "Result more_last for list : "
print l4
print more_last(l4)
print l5
print more_last(l5)
print l6
print more_last(l6)
# #############################################################
# -------------------------------------------------------------------------------------
# TP 2 - Les fonctions Python ---------------------------------------------------------
# For part 1 and 2 of this TP, refer to Labs 9 (in lab9.py)
# Function ####################################################
# TP 2 - 3 : Les Fonctions
# @RetournerValeur
# @PARAM e of el, list (of el,xx)
# @RETURN xx if e in list False else (?)
def RetournerValeur (e,l):
  if len(l) > 1 :
    if (car(l)==e):
      return cdr(car(l))
    else:
      return RetournerValeur(e,cdr(l))
  else:
    if len(l) > 0 :
      return False
# #############################################################
# Test ########################################################
l_val=[[12,c],[54,g],[t,67],[v,(z,t)]]
