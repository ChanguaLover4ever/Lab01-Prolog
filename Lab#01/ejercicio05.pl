%Ejercicio 5 - 4 color problem
%Dado el problema.

%Find an "admissible" coloring of a map such that all adjacent countries have different colors.
%It had been conjectured for a long time that such a coloring is possible with only 4 colors.

%Escribe un programa que encuentre todas las soluciones validas del mapa usando 4 colores, azul, amarillo, rojo, verde.
color(red).
color(blue).
color(yellow).
color(green).

map(A, B, C, D, E) :-
    adjacent(A, B), adjacent(A, D), adjacent(A, E),
    adjacent(B, C), adjacent(B, D), adjacent(B, E),
    adjacent(C, D), adjacent(C, E),
    adjacent(D, E).

% Faltaria definir la regla adjacent la cual valide la adyacencia valida.
adjacent(X,Y):- color(X), color(Y), (X \= Y).
