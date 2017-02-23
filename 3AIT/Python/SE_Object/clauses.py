#! /usr/bin/env python
# -*- coding: utf-8 -*-

from fait import Fait

'''
Chaque clause est unique. Une clause est formé d'un Fait et d'une ou plusieurs
règles dans une liste. L'objet Clause implémente la fonction evaluer qui
effectue le traitement: parcours en profondeur de l'arbre ou bien
interrogation de l'utilisateur. Pour valider une clause il faut qu'une de ses
règles soit vrai.
'''
class Clause(object):
  _instances = {}
  fait=""
  axiomes=[]
  def __new__(cls, *args, **kwargs):
    key = args[0]
    instances_classe = cls._instances.get(cls, None)
    if not instances_classe:
      instances_classe = cls._instances[cls] = {}
    clause = instances_classe.get(key, None)
    if not clause:
      clause = super(Clause, cls).__new__(cls)
      # XXX
      instances_classe[key] = clause
    return clause

  def instances_type(type):
    return Clause._instances[type]
  # @__init__
  # @PARAM self, fait (Fait), axiomes (list of string)
  def __init__(self, fait, axiomes):
    fait=fait
    axiomes=axiomes

  # XXX

class Animal(Clause):
  pass

class Est(Clause):
  pass

class Oui(Clause):
  # XXX

class Non(Clause):
  # XXX