/*pelicula(nombrePelicula, género, [actores], otras..)
usuario(nombreUsuario, sexo, edad)
actor(nombre, genero, edad)
puntuación(nombreUsuario, nombrePelicula, puntuacion)
Pedía:
1. Dada una pelicula, calcular el promedio de puntuación de todos lo usuarios de género Femenino.
2. Mostrar la cantidad de peliculas que tengan todos sus actores menores de 40 años.
*/

:- dynamic(pelicula/3).
:- dynamic(usuario/3).
:- dynamic(actor/3).
:- dynamic(puntuacion/3).

abrirBD:-
    retractall(pelicula(_,_,_)),
    retractall(usuario(_,_,_)),
    retractall(actor(_,_,_)),
    retractall(puntuacion(_,_,_)),
    consult('C:/Users/PC/Documents/Prolog/20240515.txt').

inicio():-
    abrirBD,
    writeln('Ingrese una opcion'),
    writeln('1. Promedio de puntuacion de usuarios mujeres para una pelicula.'),
    writeln('2. Cantidad de peliculas con todos actores menores de 40 anios'),
    writeln('3. Salir'),
    read(Opc), Opc<3, opcion(Opc),
    inicio.
inicio.

opcion(1):-
    abrirBD,
    writeln('Ingrese una pelicula: '), read(Pelicula),
    buscar_puntuacion(Pelicula, Sum, Cant), Cant \= 0,
    Prom is Sum/Cant,
    write('La puntuacion promedio de usuario mujeres es de: '), writeln(Prom).

buscar_puntuacion(Pelicula, Sum, Cant):-
    retract(puntuacion(NombreUsuario,Pelicula,Puntuacion)),
    usuario(NombreUsuario,femenino,_),
    buscar_puntuacion(Pelicula, SumAnt, CantAnt),
    Sum is SumAnt + Puntuacion,
    Cant is CantAnt + 1.
buscar_puntuacion(_,0,0).

opcion(2):-
    abrirBD,
    calcular_peliculas(Cant),
    write('Cantidad de peliculas: '), writeln(Cant).

calcular_peliculas(Cant):-
    retract(pelicula(_,_,Actores)),
    actores_menores(Actores),
    calcular_peliculas(CantAnt),
    Cant is CantAnt+1.
calcular_peliculas(0).

actores_menores([Actor|T]):-
    actor(Actor,_,Edad),
    Edad < 40,
    actores_menores(T).
actores_menores([]).
