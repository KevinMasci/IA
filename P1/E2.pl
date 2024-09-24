conoce(franco,ingles).
conoce(renzo,ingles).
conoce(franco,frances).
conoce(renzo,frances).
conoce(franco,italiano).
conoce(marco,ingles).
conoce(omar,ingles).
conoce(maria,frances).

habla_ingles_frances(X):-conoce(X,ingles), conoce(X,frances).

%En la terminal ejecutar:
%swipl
%consult('/workspaces/IA/P1/E2.pl').
%habla_ingles_frances(X).
%habla_ingles_frances(maria).
%habla_ingles_frances(_).