%Ingresar una lista de números enteros e informar cuánto da la sumatoria de ellos.

inicio:-leer(L), sumar(L,S), writeln(S).

leer([H|T]):-read(H),H\=[],leer(T).
leer([]).

sumar([],0).
sumar([H|T],S):-sumar(T,SumaT),S is H + SumaT.

