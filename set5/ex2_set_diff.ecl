/* ----------------------------------
set_diff/3
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