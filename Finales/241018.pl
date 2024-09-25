/*usuario(id, estado, edad, ciudad, [ids usuarios amigos]).
provincia(id, nombre, [ids ciudades]).
pais(id, nombre, [ids provincias]).
El estado de un usuario puede ser activo o inactivo.
1) Mostrar la cantidad de usuarios activos que vivan en países que tengan más de 20 provincias.
2) Ingresar los datos de un usuario (id, estado, edad, ciudad, [ids
usuarios amigos]) y guardarlo en la base de datos sólo si es argentino y
mayor de 18 años.*/

% Se declaran los hechos con dynamic siempre al principio
:- dynamic(usuario/5).
:- dynamic(provincia/3).
:- dynamic(pais/3).

% Predicado para leer de la base de hechos
% Se usa retracall para todos los hechos

abrir_base:- retractall(usuario(_, _, _, _, _)), retractall(provincia(_, _, _)), retractall(pais(_, _, _)), consult('C:/UTN/Inteligencia Artificial/bd.txt').

% Menu para poder seleccionar las opciones

menu:- writeln('1. Mostrar cantidad de usuarios activos que vivan en paises con mas de 20 provincias'), writeln('2. Ingresar usuario'), write('Ingrese una opcion: '), read(Op), Op \= 3, opciones(Op), menu.
menu.
% Escribi menu. porque en caso de que elija la opcion 3 y falle la
% validacion, el programa termina y devuelve true. En caso contrario, si
% el menu. no estaria devolveria false. Todos los predicados deberian
% devolver true, a menos que se necesite que devuelva false como el
% predicado pertenece.

opciones(1):- abrir_base, buscar_usuarios_provincias(Lista), write('Los usuarios son: '), writeln(Lista).
opciones(2):- ingresar_usuario.
% Esta forma de llamar opciones a otros predicados no es necesario, lo
% hice asi para que quede mas entendible.

% Modificar la condicion de CantidadProvincias >= 3 para probar con la
% base de datos
buscar_usuarios_provincias([H|T]):- usuario(H, 'activo', _, Ciudad, _), buscar_provincia(Ciudad, Provincia), buscar_pais(Provincia, ListaProvincias), contar(ListaProvincias, CantidadProvincias), CantidadProvincias >= 3, retract(usuario(H, 'activo', _, Ciudad, _)),  buscar_usuarios_provincias(T).
buscar_usuarios_provincias([]).
% Cuando se inicializa una lista vacia o un contandor, la condicion de
% cierre va abajo de todo.

buscar_provincia(Ciudad, Provincia):- provincia(Provincia, _, ListaCiudad), pertenece(Ciudad, ListaCiudad).

buscar_pais(Provincia, ListaProv):- pais(_, _, ListaProv), pertenece(Provincia, ListaProv).
% En este predicado no me interesaba devolver el id del pais, solo la
% lista de provincias para contar cuantas eran

% En este como no hay inicializacion de variables, la condicion de
% cierre se pone al principio
pertenece(X, [X|_]).
pertenece(X, [_|T]):- pertenece(X, T).

contar([_|T], N):- contar(T, Cont), N is Cont + 1.
contar([], 0).

ingresar_usuario:- abrir_base, write('Ingrese ID del usuario: '), read(Id), write('Ingrese estado del usuario: '), read(Estado), write('Ingrese edad del usuario '), read(Edad), write('Ingrese ciudad del usuario: '), read(Ciudad), write('Ingrese los amigos del usuario: '), leer(Amigos), Edad > 17, buscar_provincia(Ciudad, Provincia), buscar_pais_nombre(Provincia, 'Argentina'), assert(usuario(Id, Estado, Edad, Ciudad, Amigos)), guardar.

% En este predicado si me interesaba encontrar el nombre del pais.
% Podria haber modificado el buscar_pais para que devuelva lista de
% provincias y el nombre del pais tambien

buscar_pais_nombre(Provincia, Pais):- pais(_, Pais, ListaProv), pertenece(Provincia, ListaProv).

leer([H|T]):- read(H), H \= [], leer(T).
leer([]).

guardar:- tell('C:/UTN/Inteligencia Artificial/bd.txt'), listing([usuario, provincia, pais]), told.