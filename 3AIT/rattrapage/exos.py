#! /usr/bin/env python
# -*- coding: utf-8 -*-
# Rattrapage 3AIT python -- 2016
# Done in 30-40 mins.
# 2.1 ----------------------------------------------------------------------------------
# GetText
# Fonction récupérant le texte saisie par un utilisateur
# @return text saisie par l'utilisateur
def getText():
  print "Please enter a text"
  return raw_input()

print "Testing getText"
print getText()
# --------------------------------------------------------------------------------------
# 2.2 ----------------------------------------------------------------------------------
# CptChar
# Fonction contant le nombre de caractère d'un texte
# @param text in a string
# @return string lengh
def cptChar(text):
  return len(text)

print "Testing cptChar"
print cptChar("Je suis pas Doué en Python !")
# --------------------------------------------------------------------------------------
# 2.3 ----------------------------------------------------------------------------------
# CptLetterOcc
# Fonction contant le nombre d'occurence de la première lettre du texte.
# @param text in a string
# @return nb of occurence of the first lettre
def cptOcc(text):
  tmp=0
  letter=text[0]
  for letters in text:
    if letters == letter:
      tmp += 1
  return tmp
print "Testing cptOcc"
print cptOcc("Je suis pas Doué en Python !")
print cptOcc("Je devrais avoir deux fois la lettre J")
print cptOcc("A b A c A d A")
# --------------------------------------------------------------------------------------
# 2.4 ----------------------------------------------------------------------------------
# Menu
# Let the user chose between the 3 options. by default, string is : You have to enter a text :)
def Menu():
  operation = "Please enter a text"
  while 1:
    print "Welcomme to the runner of this test :) Please chose what you want to do (1 to enter a text/ 2 to get the number of char from a previously entered text/ 3 to get the number of occurence of the first char from a previously entered text/ 4 to exit"
    valid = {"1": 1, "2": cptChar, "3": cptOcc, "4": 4}
    choice = raw_input().lower()
    if choice in valid:
      if valid[choice] == 1:
        operation=getText()
        print 'You entered '+ operation
      elif valid[choice] == 4:
        break;
      else:
        print valid[choice](operation)
    else:
      print "Reponse not valid, please answer with '1, 2 or 3."
      return Menu ()
Menu()
# --------------------------------------------------------------------------------------
