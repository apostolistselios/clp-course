/* ------------------------------------
Exercise 2 - missing_letter/3:
A Prolog Program that finds the missing letter from the words defined above .
1st argument: a list with the letters of the word
2nd argument: the missing letter
3rd argument: the correct word
--------------------------------------- */

%%% some words.
word([p, r, o, l, o, g]).
word([m, a, t, h, s]).
word([c, o, m, p, u, t, e, r]).
word([s, c, i, e, n, c, e]).
word([a, r, g, u, m, e, n, t]).
word([l, e, t, t, e, r]).


missing_letter(WrongWord, MissingLetter, Word) :- 
    word(Word),
    delete(MissingLetter, Word, WrongWord).

/* ----------------------------------------
Exercise 6 - common_suffix/4
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