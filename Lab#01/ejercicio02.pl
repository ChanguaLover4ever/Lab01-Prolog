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

%==================================================================

perro(firulais).
perro(bruno).
perro(max).
gato(misu).
gato(luna).
gato(chanel).
gato(orion).
ave(piolin).

dueno(ana, firulais).
dueno(ana, misu).
dueno(luis, luna).
dueno(luis, orion).
dueno(luis, firulais).
dueno(maria, piolin).
dueno(julia, chanel).
dueno(pedro, bruno).

%
%Responde:
%Define una regla que determine si una persona tiene un perro.
tienePerro(X):-
    dueno(X,Y),
    perro(Y).
%Ahora, encuentra los dueños de perros.
% X=ana,luis,pedro
%Define una regla que determine si una persona tiene un gato.
tieneGato(X):-
    dueno(X,Y),
    gato(Y).
%Ahora, encuentra los dueños de gatos.
% X=ana,luis,julia
%Define una regla que determine si una persona tiene multiples mascotas.
tieneMultiplesMascotas(X):-
    dueno(X,Y),
    dueno(X,Z),
    Y \= Z.
%Ahora, encuentra los dueños de multiple tipos de mascota.
% X=ana,luis.
%Define una regla amante_animales para identificar dueños que tienen tanto perro como gato.
amante_animales(X):-
    dueno(X,Y),
    dueno(X,Z),
    perro(Y),
    gato(Z).
%Define una regla mascota_compartida que indique si dos personas comparten mascota.
mascota_compartida(X,Y):-
    dueno(X,Z),
    dueno(Y,Z),
    X \= Y.
%Define una regla tipo_mascota que asocie una persona con el tipo de mascota que tiene (perro, gato, ave, etc.).
tipo_mascota(X, perro):- dueno(X, Y), perro(Y).
tipo_mascota(X, gato) :- dueno(X, Y), gato(Y).
tipo_mascota(X, ave) :- dueno(X, Y), ave(Y).


