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


% Ejercicio 1 - Respuestas:
% 1.
% Consulta -> ?- vuelo(bogota, medellin)
% Respuesta -> true
% 2.
% Consulta -> ?- vuelo(bogota, X)
% Respuesta -> medellin, cartagena, pasto
% 3.
% Consulta -> ?- vuelo(X, medellin)
% Respuesta -> bogota
% 4.
% Consulta -> ?- vuelo(X, cali)
% Respuesta -> false
