%%% some words.
word([p, r, o, l, o, g]).
word([m, a, t, h, s]).
word([c, o, m, p, u, t, e, r]).
word([s, c, i, e, n, c, e]).
word([a, r, g, u, m, e, n, t]).
word([l, e, t, t, e, r]).

/* ------------------------------------
missing_letter/3:
A Prolog Program that finds the missing letter from the words defined above .
1st argument: a list with the letters of the word
2nd argument: the missing letter
3rd argument: the correct word
--------------------------------------- */

missing_letter(WrongWord, MissingLetter, Word) :- 
    word(Word),
    delete(MissingLetter, Word, WrongWord).