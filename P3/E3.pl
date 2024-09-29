/*3. Ingresar una cadena de texto e informar cuántos caracteres tiene.
En primer lugar haciendo uso del predicado atom_length/2 y en
una segunda instancia utilizando sub_atom/5 de forma recursiva.*/

inicio:-writeln('Ingrese una cadena: '), read(C), contar_caracteres(C,Cant), writeln(Cant).

contar_caracteres('',0).
contar_caracteres(C,Cant):-sub_atom(C,1,_,0,Sub), contar_caracteres(Sub,CantSub),
                           Cant is CantSub + 1.
                        
%Misma lógica que en listas:
contar_en_lista([],0).
contar_en_lista([_|T],C):-contar_en_lista(T,CantCola),
                          C is CantCola + 1.

        