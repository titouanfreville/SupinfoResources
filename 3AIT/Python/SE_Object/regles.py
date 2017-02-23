class Regles:
  conclusion=""
  axiome=[]
  # @__init__
  # @PARAM self, conclusion (string), axiomes (list of string)
  def __init__(self,conclusion,axiomes):
    self.conclusion=conclusion
    self.axiomes=axiomes
  # @map_premise
  # @PARAM self, function
  # @RETURN function apply to all element of axiom
  def map_premise(self, function):
    map(function,self.axiomes)
  # @get_current_axiome
  # @PARAM : self
  # @RETURN : current HEAD of Axiome
  def get_current_axiome(self):
    if self.axiomes==[]:
      return None
    else:
      return self.axiomes[0]
  # @go_next_axiome
  # @COND : go to next ONLY IF previous call was true.
  # @PARAM self
  def go_next_axiome(self):
    self.axiomes.pop(0)

# Test
# test=Regles('albatros',['vole bien','marche mal'])
# def affiche(e):
#   print e
# print test
# test.map_premise(affiche)
# print test.get_current_axiome()
# test.go_next_axiome()
# print test.axiomes
