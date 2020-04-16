/* ----------------------------------
Exercise 1 - less_than_ten/1
less_than_ten(X):
A Prolog program that finds how many of the samples are less than ten.
1st argument/X: the result.
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
1st argument/List: a given list.
------------------------------------- */

proper_set_s(List) :- 
    setof(X, member(X, List), Set),
    ListLen is length(List), 
    SetLen is length(Set),
    ListLen = SetLen.
