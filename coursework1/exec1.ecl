/* ----------------------------------
Exercise 1 - List Processing

exclude_range/4
exclude_range(Low, High, List, NewList)

A Prolog program that succeeds when NewList contains the elements of List
that don't belong in the closed interval [Low, High].
------------------------------------- */

%%% worst case N^2 comparisons

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

%%% square/2
square(X,Y):- Y is X * X.

%%% math_match/3
math_match([_X], _C, []).

math_match([X, Y|Rest], C, [(X,Y)|Solution]) :-
    Predicate =.. [C, X, Y],
    call(Predicate),
    math_match([Y|Rest], C, Solution), !.

math_match([_X, Y|Rest], C, Solution) :-
    math_match([Y|Rest], C, Solution).

%%% sublist/2
sublist(L1, L2):-
	append(S1, _, L2),
	append(_, L1, S1).

%%% math_match_alt/3
math_match_alt(List, C, Solution) :- 
    Predicate =.. [C, X, Y],
    findall((X,Y), sublist([X,Y],List), Tuples),
    findall((X,Y), (member((X,Y), Tuples),call(Predicate)), Solution).

/* ----------------------------------
Exercise 3 - State of Blocks 

stack_blocks/3
stack_blocks(StackA, StackB, Height)

A Prolog program that builds two stacks of 3 blocks in way that when a
block is places on top of another is has the same of less width. Each block
has to be used once. The height of the two stacks has to be the same.

find_lowest_stack/4
find_lowest_stack(StackA, StackB, Height, Solutions)

A Prolog program that finds the lowest Stacks (with the smallest Height), 
and how many alternative solutions where computed in order to find it.
------------------------------------- */

%%% a_block/3
a_block(b1,2,4).
a_block(b2,1,3).
a_block(b3,3,3).
a_block(b4,1,2).
a_block(b5,4,1).
a_block(b6,2,1).
a_block(b7,5,3).
a_block(b8,5,2).
a_block(b9,4,4).
a_block(b10,2,3).

%%% all_different/1
all_different([]).  

all_different([_, []]).

all_different([Element|Tail]) :- 
    not(member(Element, Tail)), 
    all_different(Tail).

%%% width_constraint/3
width_constraint(Width1, Width2, Width3) :-
    Width1 >= Width2,
    Width2 >= Width3.

%%% compute_height/2.
compute_height([], 0).

compute_height([Height|RestHeights], HeightSum) :- 
    compute_height(RestHeights, RestHeightSum), 
    HeightSum is RestHeightSum + Height.

%%% stack_blocks/3
stack_blocks([B_A1, B_A2, B_A3], [B_B1, B_B2, B_B3], Height) :- 
    % Get the information about the blocks.
    % Stack A Blocks
    a_block(B_A1, Height_A1, Width_A1),
    a_block(B_A2, Height_A2, Width_A2),
    a_block(B_A3, Height_A3, Width_A3),
    % Stack B Blocks
    a_block(B_B1, Height_B1, Width_B1),
    a_block(B_B2, Height_B2, Width_B2),
    a_block(B_B3, Height_B3, Width_B3),
    % Check if all the elements are different.
    append([B_A1, B_A2, B_A3], [B_B1, B_B2, B_B3], Stacks),
    all_different(Stacks),
    % Check the constraint about the width.
    width_constraint(Width_A1, Width_A2, Width_A3), 
    width_constraint(Width_B1, Width_B2, Width_B3), 
    % Check if the height of stacks is the same.
    HeightsA = [Height_A1, Height_A2, Height_A3],
    HeightsB = [Height_B1, Height_B2, Height_B3],
    compute_height(HeightsA, Height),
    compute_height(HeightsB, Height).


%%% alternative_solutions/3
alternative_solutions([Solution|_Tail], Solution, 0).

alternative_solutions([_Solution|Tail], Solution, AlternativeSolutions) :-
    alternative_solutions(Tail, Solution, TailAlternativeSols),
    AlternativeSolutions is TailAlternativeSols + 1.

%%% find_lowest_stack/4
find_lowest_stack(StackA, StackB, Height, Solutions) :- 
    findall((H, StackA, StackB), stack_blocks(StackA, StackB, H), SolutionList),
    setof(H, member(H, SolutionList), [(Height, StackA, StackB)|_]),
    Solutions is length(SolutionList) - 1.
    % alternative_solutions(SolutionList, (Height, StackA, StackB), Solutions).    
