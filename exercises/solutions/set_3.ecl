/* ----------------------------------------------
Exercise 6 - sum_even/2:
A Prolog Program that finds the sum of the even numbers in a list.
1st argument: List of integers.
2nd argument: The sum of the even integers in the list.
------------------------------------------------- */

sum_even([], 0).

sum_even([Head|Tail], Sum) :-
    0 is Head mod 2, % so it's even.
    sum_even(Tail, SumInTail),
    Sum is SumInTail + Head. 

sum_even([Head|Tail], Sum) :- 
    1 is Head mod 2, % so it's odd.
    sum_even(Tail, Sum).

/* -------------------------------------------
Exercise 7 - replace/4:
A Prolog Program that replaces replaces an element X with Y in a list.
1st argument: The new element that is going to replace the old one.
2st argument: The element tha is going to get replaced.
3rd argument: The given list.
4th argument: The result list.
---------------------------------------------- */

replace(X, Y, [X|Tail], [Y|Tail]).

replace(X, Y, [Head|Tail1], [Head|Tail2]) :-
    replace(X, Y, Tail1, Tail2).