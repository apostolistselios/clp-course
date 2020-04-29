%%% Exercise 5
%%% figure/2
figure(1, middle(triangle, square)). % triangle in the middle of a circle.
figure(2, middle(circle, triangle)). % circle in the middle of a triangle.
figure(3, middle(square, circle)). % square in the middle of a tringle.
figure(4, middle(square, square)). % square in the middle of a square.
figure(5, middle(square, triangle)). % square in the middle of a triangle.
figure(6, middle(triangle, circle)). % triangle in the middle of circle.
figure(7, middle(circle, square)). % circle in the middle of square.
figure(8, middle(triangle, triangle)). % triangle in the middle of a triangle.
figure(9, down_left(circle, circle)). % circle down and left in a circle.
figure(10, up_left(circle, circle)). % circle up and left in a circle.
figure(11, down_right(circle, circle)). % circle down and right in a circle.
figure(12, up_right(circle, circle)). % circle up and right in a circle.
figure(13, up_left(square, square)). % square down and left in a square.
figure(14, down_left(square, square)). % square up and left in a square.
figure(15, up_right(square, square)). % square up and right in a square.
figure(16, down_right(square, square)). % square down and right in a square.

%%% relation/3
relation(middle(S1, S2), middle(S2, S1), inverse).
%%% Opposite relation.
relation(down_left(S1, S1), up_right(S1, S1), opposite).
relation(up_right(S1, S1), down_left(S1, S1), opposite).
relation(down_right(S1, S1), up_left(S1, S1), opposite).
relation(up_left(S1, S1), down_right(S1, S1), opposite).
%%% Vertical line symmetry relation.
relation(down_left(S1, S1), down_right(S1, S1), v_symmetry).
relation(up_left(S1, S1), up_right(S1, S1), v_symmetry).
relation(down_right(S1, S1), down_left(S1, S1), v_symmetry).
relation(up_right(S1, S1), up_left(S1, S1), v_symmetry).
%%% Horizontal line symmetry relation.
relation(down_left(S1, S1), up_left(S1, S1), h_symmetry).
relation(up_left(S1, S1), down_left(S1, S1), h_symmetry).
relation(down_right(S1, S1), up_right(S1, S1), h_symmetry).
relation(up_right(S1, S1), down_right(S1, S1), h_symmetry).
%%% Same position of the inner shape relation.
relation(up_right(S1, S1), up_right(S2, S2), same_pos).
relation(down_right(S1, S1), down_right(S2, S2), same_pos).
relation(up_left(S1, S1), up_left(S2, S2), same_pos).
relation(down_left(S1, S1), down_left(S2, S2), same_pos).

%%% relation_between_figures/3
relation_between_figures(F1, F2, R) :-
    figure(F1, P1),
    figure(F2, P2),
    relation(P1, P2, R).

%%% analogy/4
analogy(F1, F2, F3, F4) :-
    relation_between_figures(F1, F2, R),
    relation_between_figures(F3, F4, R).
