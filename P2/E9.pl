/*Ingresar una lista de números enteros y calcular su promedio. Respetar
el formato del predicado promedio(L,S,C) donde L es la lista ingresada,
S la sumatoria y C el contador de los elementos de la lista.*/

leer([H|T]):-read(H), H\=[], leer(T).
leer([]).

promedio:-leer(Lista), prom(Lista,Suma,Contador), P is Suma/Contador, write(P).

prom([],0,0).
prom([H|T],Suma,Contador):-prom(T,Sum,Cont), Suma is Sum+H, Contador is Cont+1.

