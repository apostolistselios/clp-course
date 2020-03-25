/* ----------------------------------------------
sum_even/2:
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