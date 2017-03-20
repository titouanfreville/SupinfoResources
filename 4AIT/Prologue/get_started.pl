%% <><><><><><><><><><><><><><><><><><> COMMENT THIS PART WHEN USING CONSULT <><><><><><><><><><><><><><><><><><><><><><> %%
%% Bases
%% == operand. == state if right part is the same entity as left part. (Not an equality operator).
a==a. %% true
a\==a. %% false
a==b. %% false
a\==b. %% true
5==5. %% true
4+1==3+2. %% false
(4+1)==(3+2). %% false
%% +,*,-,mod,/ ne sont pas des opérateurs de calcul. Pour forcer un calcul, il faut utiliser IS
f(a,b)==f(a,b). %% true

X= +(3, 5). %% X = 3+5
Y= 4+1. %% Y = 4+1
V is 3 + 5. %% 8
W is 4 + 4. %% 8

%% Compare integers
5=:=5. %% true
5=\=5. %% false
5<5. %% false
5=<5. %% true
5>5. %% false
5>=5. %% true

4+1=:=3+2. %% true
4+1=\=3+2. %% false
4+1<3+2. %% false
4+1=<3+2. %% true
4+1>3+2. %% false
4+1>=3+2. %% true

3+2<9. %% true
2+2=:=3+1. %% true
5=<5. %% true
2=\=9. %% true
X= 5, X > 12. %% false
X > 6. %% error

A is pi. %% X = 3.141592653589793.
B is pi. %% Y = 2.718281828459045.

1 is mod(5,2). %% true
8 is 5+3. %% true
V is W. %%ERROR: Arguments are not sufficiently instantiated
        %% ERROR: In:
        %% ERROR:    [8] _4204 is _4206
        %% ERROR:    [7] <user>

%% random (v1,v2,var) affecte to var a value between v1 && v2
random(1,10,Res). %% Res = x (x in [1, 1O])
Res is sqrt(4). %% Res=2.0

%% var operator to check if entity is a variable
var(X). %% true
var(1). %% false

%% atomic operator to check if entity is a value
atomic(X). %% false
atomic(1). %% true
atomic(1+1). %% false

%% some calcs
X is abs(-7). %% X=7
X is round(8.3). %% X=8

%% :O Spaces are so important here ... 
X is 3+5*5-5. %% X=23
X is -4-6--10*1-1*-+5. %% Error cause -- is not -(-10), *-+ is not *(-(+5))
%% ERROR: Syntax error: Operator expected
%% ERROR: X is -4-
%% ERROR: ** here **
%% ERROR: 6--10*1-1*-+5 . 
X is -4-6-(-10)*1-1*(-5). %% X=5
X is -4-6- -10*1-1* - 5. %% X=5
X is -4-6- -10*1-1* - +5. %% X=5
X is 4-6--6*7-7*-3. %% error
X= 4-6--6*7-7*-3. %% error
X is 4-6- -6*7-7* -3. %% X=61
X= 4-6- -6*7-7* -3. %% X=4-6- -6*7-7* -3

%% Type and range
integer(5). %% true
integer(4.5). %% false
float(4). %% false
float(6.5). %% true
between(2,5,6). %% false
between(2,5,4). %% true
%% <><><><><><><><><><><><><><><><><><> <><><><><><><><><><><><><><><><><><> <><><><><><><><><><><><><><><><><><><><><><> %%
%% <><><><><><><><><><><><><><><><><><><><><> USE THIS PART WITH CONSULT <><><><><><><><><><><><><><><><><><><><><><><><> %%
%% Foncteur
multiplier(X,Y):- Y is X*10.
soustraire(X,Y):- Y is X-10.

%% <><><><><><><><><><><><><><><><><><> <><><><><><><><><><><><><><><><><><> <><><><><><><><><><><><><><><><><><><><><><> %%