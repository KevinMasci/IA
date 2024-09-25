%2. Ingresar una cadena de texto y obtener el último carácter de la misma.

inicio:-writeln('Ingrese una cadena: '), read(C), ultimo_caracter(C,UC), writeln(UC).

ultimo_caracter(C,UC):-sub_atom(C,_,1,0,UC).

