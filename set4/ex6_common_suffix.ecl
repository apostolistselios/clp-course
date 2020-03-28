/* ----------------------------------------
common_suffix/4
common_suffix(List1, List2, Suffix, Pos):
A Prolog program that finds the common suffix of List1 and List2 and the 
starting position of the suffix counting from the end of the List.
1st argument/List1: A given list.
2nd argument/List2: A given list.
3rd argument/Suffix: The common suffix of the two given lists.
4th argument/Pos: The starting position of the suffix from the end.
-------------------------------------------- */

common_suffix(List1, List2, Suffix, Pos) :-
    append(_, Suffix, List1), 
    append(_, Suffix, List2),
    length(Suffix, Pos).
