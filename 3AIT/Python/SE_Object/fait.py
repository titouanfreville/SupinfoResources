import sys
class Fait:
  # string
  fact=""
  # string
  question=""
  # Boolean
  answer=None
  # Dict_Path_To_Solve
  solve={}
  # @__init__
  # @PARAM self, fact (string), question (string), answer(bool)
  def __init__(self,fact,question,answer=None):
    self.fact=fact
    self.question=question
    self.answer=answer
  # @__new__
  # @PARAM self, fact(Fait)
  def __new__(self,fact,cond):
    self.solve[fact]=cond
  # @result
  # @PARAM self
  def result(self):
    return self.answer
  # @demander
  # @PARAM self
  def demander(self):
    print self.question+" "+self.fact+" ?"
    valid = {"yes": True, "y": True, "ye": True, "no": False, "n": False}
    choice = raw_input().lower()
    if choice in valid:
      self.answer=valid[choice]
      return valid[choice]
    else:
      print "Reponse not valid, please answer with yes/y/ye or no/n."
      return self.demander(self)

# TESTS
# test=Fait('voler','peut-il')
# print test
# print test.result()
# test.demander()
# print test.result()
