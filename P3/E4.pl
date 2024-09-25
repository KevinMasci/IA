%4. Transformar una cadena en una lista de caracteres.

inicio:-writeln('Ingrese una cadena: '), read(C), lista_caracteres(C,L), writeln(L).

lista_caracteres('',[]).
lista_caracteres(C,[H|T]):-sub_atom(C,0,1,_,H), sub_atom(C,1,_,0,Sub), lista_caracteres(Sub,T).
