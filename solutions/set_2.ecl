
%%% Exercise 7: sumn/2
%%% computes the sum of the first n natural numbers recursively.
sumn(1, 1).

sumn(N, X) :- 
    NN is N - 1,
    sumn(NN, XX),
    X is XX + N.