/* ----------------------------------
Exercise 1 - List Processing

exclude_range/4
exclude_range(Low, High, List, NewList)

A Prolog program that succeeds when NewList contains the elements of List
that don't belong in the closed interval [Low, High].
------------------------------------- */

%%%% worst case N^2 comparisons

exclude_range(_Low, _High, [], []).

exclude_range(Low, High, [Element|List], [Element|NewList]) :-
    Element < Low,
    !,
    exclude_range(Low, High, List, NewList).

exclude_range(Low, High, [Element|List], [Element|NewList]) :-
    Element > High,
    !,
    exclude_range(Low, High, List, NewList).

exclude_range(Low, High, [_Element|List], NewList) :-
    exclude_range(Low, High, List, NewList).

/* ----------------------------------
Exercise 2 - Matching Number Series

math_match/3
math_match(List, C, Solution)

A Prolog program that succeeds when Solution contains tuples of consecutive
elements of List that satisfy the predicate C/2.
------------------------------------- */

%%% double/2
double(X, Y):-Y is X * 2.

%%% inc/2
inc(X, Y):-Y is X + 1.

% %%% math_match/3
% math_match([_X], _C, []).

% math_match([X,Y|Rest], C, [(X,Y)|Solution]) :-
%     math_match(Rest, C, Solution).

% math_match([X, Y], C, [(X, Y)]) :-
%     Predicate =.. [C, X, Y],
%     call(Predicate).

% math_match([X,Y|Rest], C, [(X, Y)|Solution]) :- 
%     Predicate =.. [C, X, Y],
%     math_match([Y|Rest], C, Solution),
%     call(Predicate).

% math_match([_X,Y|Rest], C, Solution) :-
%     math_match([Y|Rest], C, Solution).