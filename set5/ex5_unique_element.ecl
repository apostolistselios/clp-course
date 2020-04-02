/* ----------------------------------
unique_element/2
unique_element(X, List):
A Prolog program that succeeds when X is a unique element in List.
1st argument/X: A given element.
2nd argument/List: A given list.
------------------------------------- */

unique_element(X, List) :- 
    delete(X, List, LRemoved),
    not(member(X, LRemoved)).