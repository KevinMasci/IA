%1. Ingresar una cadena de texto y obtener el primer carácter de la misma.

inicio:-writeln('Ingrese una cadena: '), read(C), primer_caracter(C,PC),writeln(PC).

primer_caracter(C,PC):-sub_atom(C,0,1,_,PC).
