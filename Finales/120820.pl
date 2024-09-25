/*
Se tiene una Base de Datos compuesta por hechos con la siguiente estructura:

camion(cod_camion, marca, modelo, tipo_mma, peso_vacio, tipo1, tipo2, tipo3).
tipo1: Clasificación según el tipo de mercancia a transportar (‘Camión de lona’ / ‘Plataforma abierta’)
tipo2: Clasificación según Dimensiones (‘2 ejes’ / ‘3 ejes’ / ‘4 ejes’)
tipo3: Clasificación según Estructura vehículo (‘Rígido’ / ‘Articulado’ / ‘Trailer’ / ‘Tren de carretera’)

conductor(cod_conductor, apellido_nombre, edad, ciudad_natal, [cod_camion]).
[cod_camion]: Lista de códigos de camión que el conductor está habilitado a conducir

viaje(cod_conductor, cod_camion, peso_carga_kg, ciudad_origen, fecha_partida,
ciudad_destino, fecha_llegada).
Formato campo fecha_partida / fecha_llegada: dd/mm/aaaa

Ejemplo de hechos con datos:
camion(1553, scania, 2015, N1, 1000, ‘Camión de lona’, ‘2 ejes’, ‘Rígido’).
conductor(523, ‘Suárez Mario’, 56, ‘Rosario’, [1553,1645,1825]).
viaje(523, 1553, 1000, ‘Rosario’, ‘13/04/2020’,‘Santa Fe’,’15/04/2020’).

Desarrollar un programa en PROLOG que permita:
1. Dada una lista [ ] de códigos de camiones y un código de conductor (datos de entrada), devolver
una nueva lista [ ] con aquellos camiones de la lista ingresada que dicho conductor está habilitado a
conducir.
2. Dada una lista [ ] de códigos de conductores y un código de camion (datos de entrada) devolver
una nueva lista [ ] con el apellido/nombre de los conductores (de la lista de entrada) que realizaron al
menos un viaje con dicho camión en Abril 2020 (para el mes y año considerar fecha_partida).
*/

:-dynamic(camion/8)
:-dynamic(conductor/5)
:-dynamic(viaje/7)

inicio:- write("Ingrese Opcion"), read(Op), menu(Op).
abrirBase:-retractall(camion/8), retractall(conductor/5), retractall(viaje/7), consult("./base.txt").

menu(1):- abrirBase, write("Ingrese camiones"), leer(LC), write("ingrese conductor), read(Conductor), buscarHabilitados(LC,Conductor,Camiones), mostrar(Camiones).

buscarHabilitados([C|T],Conductor,[C|T2]):- conductor(Conductor,_,_,_,Habilitados), pertenece(C,Habilitados), buscarHabilitados(T,Conductor,T2). /*Pregunta: Donde se ve el BackTracking en ese ejercicio?*/
buscarHabilitados([_|T],C,L):- buscarHabilitados(T,C,L).
buscarHabilitados([],_,[]) /*Pregunta: Porque en este lugar esta regla y porque [] en vez de _*/

menu(2):- abrirBase, write("Ingrese Conductores"), leer(Conductores), write("Ingrese Camion"), read(C), viajesAbril(Conductores,C, Nombres), mostrar(Nombres).

viajesAbril([Con|T],Cam,[Nomb|T2]):-
    retract(viajes(Con,Cam,_,_,Fecha,_,_)),/*Pregunta: porque un retract? como funciona el retract? (No hacia falta y no lo recomienda pistilli)*/
    sub_atom(Fecha,3,_,_,S), S = "04/2020", /*Error: el 3er arg (hasta donde corto) hace falta especificarlo. */
    conductor(Con,Nomb,_,_,_), viajesAbril(T,Cam,T2).
/*Me falto el metodo para avanzar la lista igual que el 1er ejercicio*/
viajesAbril([],_,[]).

/*... leer, mostrar, y pertenece normales*/
