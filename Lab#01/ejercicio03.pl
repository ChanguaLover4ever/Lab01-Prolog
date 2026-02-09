% Hechos: estudiante y su nota final en un curso
nota(ana, 4.5).
nota(luis, 2.8).
nota(maria, 3.7).
nota(juan, 5.0).
nota(pedro, 2.3).

%Responde:
%Define una regla reprueba, que sea cierta si un estudiante tiene menor a 3.0.
reprueba(X):- nota(X,Y), (Y < 3.0).

%Define una regla aprueba, que sea cierta si un estudiante tiene nota mayor o igual a 3.0.
aprueba(X):- nota(X,Y), (Y >= 3.0).

%Define una regla rango, donde rango(X, Min, Max) sea cierto si la nota de un estudiante X está entre Min y Max.
rango(X, Min, Max):-
    nota(X,Y),
    (Y >= Min),
    (Y =< Max).

%Define una regla clasificacion que asigne una categoría a cada estudiante según la nota:
%0.0 – 2.9 → reprobado
%3.0 – 3.9 → aprobado
%4.0 – 4.4 → notable
%4.5 – 5.0 → excelente
clasificacion(X,reprobado):- reprueba(X).
clasificacion(X,aprobado):- nota(X,Y), rango(Y, 3.0, 3.9). 
clasificacion(X,notable):- nota(X,Y), rango(Y, 4.0, 4.4).
clasificacion(X,excelente):- nota(X,Y), rango(Y, 4.5, 5.0).

%Define la regla distancia((X1, Y1), (X2, Y2), D), que calcule la distantia euclidiana entre dos puntos
distancia((X1, Y1), (X2, Y2), DistEuclidiana) :-
    DistanciaX is X2 - X1,
    DistanciaY is Y2 - Y1,
    Dx2 is DistanciaX ** 2,
    Dy2 is DistanciaY ** 2,
    SumaDeCuadrados is Dx2 + Dy2,
    DistEuclidiana is sqrt(SumaDeCuadrados).

%Ahora teniendo en cuenta estos casos base.
% Caso base: lista vacía o con un solo punto -> distancia 0
distancia_total([], 0).
distancia_total([_], 0).

%Define la regla
%distancia_total([P1, P2 | Resto], Total), que calcule la suma de distancias entre una lista puntos.
distancia_total([P1, P2 | Resto], Total) :-
    distancia(P1, P2, D1),           
    distancia_total([P2 | Resto], DResto),
    Total is D1 + DResto.
