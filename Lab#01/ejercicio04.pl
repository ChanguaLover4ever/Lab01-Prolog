% Casos base sucesión de fibonacci
fib(0, 0).
fib(1, 1).
% Regla para calcular el valor de fibonacci para un número X dado.
fib(X, N):-
    X1 is X-1,
    X2 is X-2,
    fib(X1, N1),
    fib(X2, N2),
    N is (N1 + N2).
