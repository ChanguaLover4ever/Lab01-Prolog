% Hechos: relación entre ciudades
ciudad(bogota).
ciudad(medellin).
ciudad(cali).
ciudad(cartagena).
ciudad(manizales).
ciudad(barranquilla).
ciudad(pasto).
ciudad(monteria).

% Hechos: vuelos directos
vuelo(bogota, medellin).
vuelo(medellin, cartagena).
vuelo(cali, bogota).
vuelo(bogota, cartagena).
vuelo(manizales, cartagena).
vuelo(medellin, barranquilla).
vuelo(pasto, bogota).
vuelo(bogota, pasto).

% Ejercicio 2 - Respuestas:
% 1. Defina regla que determine si dos ciudades están conectadas mediante escala.
escala(X,Y,Z):-
    vuelo(X,Y),
    vuelo(Y,Z).
% 1.1
% Consulta -> ?- escala(bogota,X,barranquilla)
% Respuesta -> Y=medellin
% 2.
% Consulta -> ?- escala(cali,X,Y)
% Respuesta 1 -> X=bogota, Y=medellin
% Respuesta 2 -> X=bogota, Y=cartagena
% Respuesta 3 -> X=bogota, Y=pasto
% 3.
viaje(X,Y):-
    vuelo(X,Y).
viaje(X,Y):-
    escala(X,_,Y).
% Consulta -> ?- viaje(bogota, pasto)
% Respuesta -> true
% 4.
destinos(X) :-
    forall(vuelo(X, Y), (write('Destino disponible desde '), write(X), write(': '), write(Y), nl)).   
% Ejemplo de uso de la regla destinos(X):
% Consulta ?- destinos(bogota)
% Respuesta:
%Destino disponible desde bogota: medellin
%Destino disponible desde bogota: cartagena
%Destino disponible desde bogota: pasto
%true
