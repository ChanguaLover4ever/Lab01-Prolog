%Ejercicio 6 - Listas

%En Prolog, las listas se representan con corchetes:
%Lista vacía: []
%Lista con elementos: [a, b, c]

%Se puede descomponer en cabeza y cola: [Cabeza | Cola]
%?- [H|T] = [1,2,3,4].
%H = 1,
%T = [2,3,4].
%?- [H|T] = [1].
%H = 1,
%T = [].

%Ejercicios:
%Escribe una regla que verifique si un elemento es miembro de una lista.
pertenece(Elemento, [Elemento|_]).
pertenece(Elemento, [_|Cola]):- pertenece(Elemento, Cola).
    
%Escribe una regla "longitud" que dada una lista, calcule su longitud.
longitud([],0).
longitud([_|Cola],X):-
    longitud(Cola, X1),
    X is X1 + 1.
    
%Escribe una regla "concatena" que dadas dos listas, las concatene en otra
concatena([], B, B).
concatena([A1|A2], B , [A1|X]):- concatena(A2, B, X).

%Escribe una regla que permite obtener en una lista los N elementos de las serie de fibonacci,
%usa la regla predifina append(L1,L2,L3), que concatena L1 y L2, en L3.

% Regla de fibonacci definida anteriormente.
fib(0, 0).
fib(1, 1).
fib(X, N) :-
    X > 1,           
    X1 is X - 1,
    X2 is X - 2,
    fib(X1, N1),    
    fib(X2, N2),     
    N is N1 + N2.

% Regla -> lista para sucesión de fibonacci
fib_lista(1, [1]).
fib_lista(N, Y):-
    N1 is N - 1,
    fib(N, X), 
    fib_lista(N1, ListaAnterior),
    append(ListaAnterior, [X], Y).

%Escribe una regla que determine el reverso de una lista.
reverso([],[]).
reverso([H|T], ReversoLista):-
	reverso(T, T_Reversada),
    append(T_Reversada, [H], ReversoLista).
    
%Escribe una regla que determine si una lista es palindroma.
% Una lista L es palíndromo si al invertirla obtenemos la misma lista L
palindromo(L) :- reverso(L, L).
