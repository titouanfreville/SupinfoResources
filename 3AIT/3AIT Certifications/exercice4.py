def Ask(res):
  print " Hy, Could you enter the list of note you want to play with ?"
  choice = raw_input().lower()
  if choice in ['do', 're', 'mi', 'fa','sol','la' ,'si']:
    return Ask([choice] + res)
  else:
    return res

def CountTheLa_rec(notes):
  if notes == []:
    return 0
  elif notes[0] == 'la':
    res = 1 + CountTheLa_rec(notes[1:])
    return res
  else:
    return CountTheLa_rec(notes[1:])

def CountTheLa():
  notes = Ask([])
  return CountTheLa_rec(notes)

print CountTheLaDirect()