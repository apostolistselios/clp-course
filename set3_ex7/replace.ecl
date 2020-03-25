/* -------------------------------------------
replace/4:
A Prolog Program that replaces replaces an element X with Y in a list.
1st argument: The new element that is going to replace the old one.
2st argument: The element tha is going to get replaced.
3rd argument: The given list.
4th argument: The result list.
---------------------------------------------- */

replace(X, Y, [X|Tail], [Y|Tail]).

replace(X, Y, [Head|Tail1], [Head|Tail2]) :-
    replace(X, Y, Tail1, Tail2).
        