menu:-writeln('Ingrese el primer número: '), read(N1),
      writeln('Ingrese el segundo número: '), read(N2),
      writeln('¿Que operación desea realizar?'),
      writeln('1 - Suma'),
      writeln('1 - Resta'),
      writeln('1 - Multiplicación'),
      writeln('1 - División'),
      writeln('1 - Salir'),
      read(Opc),
      Opc \=5,
      opcion(Opc,N1,N2),
      menu.

menu:-writeln("Adios"), read(N), write(N).

opcion(1,N1,N2):-Suma is N1+N2, writeln(Suma).
opcion(_,_,_):-writeln('Opción invalida').