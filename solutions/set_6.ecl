/* ----------------------------------
Exercise 1 - less_than_ten/1
less_than_ten(X):
A Prolog program that finds how many of the samples are less than ten.

X: the result.
------------------------------------- */

sample(2).
sample(5).
sample(14).
sample(7).
sample(8).
sample(26).

less_than_ten(X) :- 
    findall(Y, (sample(Y), Y < 10), List),
    X is length(List).

/* ----------------------------------
Exercise 2 - set_diff_f/3
set_diff_f(List1, List2, Diff):
A Prolog program that finds the relative complement of two given lists
using the built-in predicate findall/3.

1st argument/List1: a given list.
2nd argument/List2: a given list.
3rd argument/Diff: the difference bewteen the two lists.
------------------------------------- */

set_diff_f(List1, List2, Diff) :- 
    findall(X, (member(X, List1), not(member(X, List2))), Diff).

/* ----------------------------------
Exercise 3 - minlist/2
minlist(Min, List):
A Prolog program that finds the minimum element of a list using the 
built-in predicate setof/3.

1st argument/Min: the minimum element.
2nd argument/List: a given list.
------------------------------------- */

minlist(Min, List) :- 
    setof(X, member(X, List), [Min|_Tail]).

/* ----------------------------------
Exercise 4 - proper_set_s/1
proper_set_s(List):
A Prolog program that succeeds if the given list doesnt have duplicates
using the built-in predicate setof/3.

List: a given list.
------------------------------------- */

proper_set_s(List) :- 
    setof(X, member(X, List), Set),
    ListLen is length(List), 
    SetLen is length(Set),
    ListLen = SetLen.

/* ----------------------------------
Exercise 5 - map_f/3
map_f(Operation, List, Results):
A Prolog program that implements the map function using the built-in 
predicate findall/3.

1st argument/Operation: an operation that is going to be applied on the list elements.
2nd argument/List: a given list.
3rd argument/Results: the results of the map function.
------------------------------------- */

%%% some operations
double(X, R) :- R is 2 * X.
square(X, R) :- R is X * X.

map_f(Operation, List, Results) :-
    Predicate =.. [Operation, X, R],
    findall(R, (member(X, List), call(Predicate)), Results).

/* ----------------------------------
Exercise 6 - stack/1, push/1, pop/1
stack(List), push(X), pop(X):
A Prolog program that implements the functionality of a stack. stack/1 is a dynamic
predicate and push/1 and pop/1 are the operations that can modify the stack.

List: the current state of the stack.
X: the given item to be pushed or popped.
------------------------------------- */

:- dynamic stack/1.

stack([]).

push(X) :-
    retract(stack(List)),
    asserta(stack([X|List])).

pop(X) :-
    retract(stack([X|List])),
    asserta(stack(List)).

/* ----------------------------------
Exercise 7 - Practise defining operators
------------------------------------- */

%%% operator definitions
:- op(400, fy, --).
:- op(450, yfx, and).
:- op(450, yfx, nand).
:- op(500, yfx, or).
:- op(500, yfx, xor).
:- op(500, yfx, nor).
:- op(550, xfx, ==>).

%%% not operator definition/--.
--Arg :- not(Arg).

%%% and operator definition.
Arg1 and Arg2 :- Arg1, Arg2.

%%% nand operator definition.
Arg1 nand Arg2 :- --(Arg1 and Arg2).

%%% or operator definition.
Arg1 or _Arg2 :- Arg1.  
_Arg1 or Arg2 :- Arg2.

%%% xor operator definition.
Arg1 xor Arg2 :- Arg1, --Arg2.
Arg1 xor Arg2 :- --Arg1, Arg2.

%%% not operator definition.
Arg1 nor Arg2 :- --(Arg1 or Arg2).

%%% implied operator definition/==>.
Arg1 ==> Arg2 :- Arg1 or --Arg2.

%%% truth values
t.
f :- !, fail.

/* ----------------------------------
Exercise 8 - model/1, theory/1
model(Expr), theory(ExprList):
A Prolog program that accepts variables in expression of propositional 
logic (model/1) and calculates them (theory/1).

Expr: a propositional logic expression.
ListExpr: a list of propositional logic expressions.
------------------------------------- */

%%% assign/1
assign([]).

assign([Arg|Args]) :- 
    member(Arg, [t, f]), 
    assign(Args).

%%% model/1
model(Expression) :- 
    term_variables(Expression, Args),
    assign(Args),
    call(Expression).

%% theory/1
theory([]).

theory([Expression|Expressions]) :- 
    model(Expression),
    theory(Expressions).

% theory([Expression]) :- 
%     model(Expression).

% theory([E1, E2|Expressions]) :- 
%     Expression =.. [and, E1, E2],
%     theory([Expression|Expressions]).