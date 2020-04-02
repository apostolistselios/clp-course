/* ----------------------------------
map/3
map(Operation, List, Result):
A Prolog Program that implements the map function. Given an Operation
implements the Operation on every element of the given List.
1st argument/Operation: The operation to implement.
2nd argument/List: A given list to implement the operation.
3rd argument/Result: A list that has the result.
------------------------------------- */

%%% some operations
double(X, R) :- R is 2 * X.
square(X, R) :- R is X * X.

map(_, [], []).

map(Operation, [X|Tail], [R|ResTail]) :-  
    Predicate =.. [Operation, X, R],
    call(Predicate),
    map(Operation, Tail, ResTail).