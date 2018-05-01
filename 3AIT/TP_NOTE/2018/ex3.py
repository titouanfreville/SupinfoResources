car = lambda liste: liste[0]
cdr = lambda liste: liste[1:]
membre = lambda a, liste : a in liste

def EG(a, liste):
    if not membre(a, liste):
        return liste
    if car(liste) == a:
        return liste
    return EG(a, cdr(liste))

print(EG('a', ['d','c','b']))
print(EG('a', ['d','c','a','b']))
print(EG('1', ['d','a','b']))

def Product(list):
    if list == []:
        return 1
    return int(car(list))*Product(cdr(list))

def S(list):
	if list == []:
		return 1
	if int(list[-1])%2 == 0:
		return Product(list)
	return Product(list[0:-1])

print(S([]))
print(S(['1']))
print(S(['1', '2']))
print(S(['1', '2', '3', '4', '5', '6', '7', '8', '9', '10']))
print(S(['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13']))