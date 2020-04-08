/* ----------------------------------
Exercise 2 - set_diff/3
set_diff(List1, List2, ResultList):
A Prolog program that finds the diff between two lists.
1st argument/List1: A given list.
2nd argument/List2: A given list.
3rd argument/ResultList: The result list.
-------------------------------------*/

set_diff([], _, []).

set_diff([X|Tail1], List, [X|Tail2]) :-
    not(member(X, List)), 
    !, 
    set_diff(Tail1, List, Tail2).

set_diff([_|Tail1], List, Tail2) :-
    set_diff(Tail1, List, Tail2).

/* ----------------------------------
Exercise 3 - lunion/3
lunion(List1, List2, List3):
A Prolog program that finds the union of List1 and List2.
1st argument/List1: A given list.
2nd argument/List2: A given list.
3rd argument/List3: The union of the two given lists.
------------------------------------- */

lunion([], Union, Union).

lunion([X|Tail], List, Union) :- 
    member(X, List), 
    !,
    lunion(Tail, List, Union).

lunion([X|Tail], List, [X|Union]) :-
    lunion(Tail, List, Union).

/* ----------------------------------
Exercise 4 - max_list/2
max_list(Max, List): 
A Prolog program that finds the max element in a List using not/1 and member/2.
1st argument/Max: The max element.
2nd arguemnt/List: A given list.
------------------------------------- */

max_list(Max, List) :- 
    member(Max, List),
    not((member(Y, List), Y > Max)).

/* ----------------------------------
Exercise 5 - unique_element/2
unique_element(X, List):
A Prolog program that succeeds when X is a unique element in List.
1st argument/X: A given element.
2nd argument/List: A given list.
------------------------------------- */

unique_element(X, List) :- 
    delete(X, List, LRemoved),
    not(member(X, LRemoved)).

/* ----------------------------------
Exercise 7 - map/3
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

map(_Operation, [], []).

map(Operation, [X|Tail], [R|ResTail]) :-  
    Predicate =.. [Operation, X, R],
    call(Predicate),
    map(Operation, Tail, ResTail).

/* ----------------------------------
Exercise 8 - reduce/3
reduce(Operation, List, Result):
A Prolog program that implements the reduce function. Given an Operation
implements the Operation on every element of the given list and stores the
result on Result.
1st argument/Operation: The operation to implement 
                        (max/3, min/3, plus/3, times/3 implemented by EcliPSe Prolog).
2nd argument/List: A given list of integers.
3rd argument/List: The result of the operation.
------------------------------------- */

reduce(_Operation, [Last|[]], Last).

reduce(Operation, [X|Tail], Result) :-
    reduce(Operation, Tail, Temp),
    Predicate =.. [Operation, X, Temp, Result],
    call(Predicate).