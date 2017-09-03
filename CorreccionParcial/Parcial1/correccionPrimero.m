% Se esperan recibir funciones de multiplicidad par
% Funciones de la forma a*x^2+b*x+c
clear all
syms x
sym x;

% a=1, b=2, c=7 para obtener raices: -1(+-)2.44i
% a=1, b=2, c=1 para obtener raiz: -1
a = input('Digite el valor de a: '); %1
b = input('Digite el valor de b: '); %2
c = input('Digite el valor de b: '); %7
funcion=a*x^2+b*x+c;
f=sym(funcion);

radicando = b*b - 4*a*c;
x1 = ((-b)-sqrt(radicando))/(2*a);

if(radicando==0)
    fprintf('\nSolo tiene una raíz y es: %d\n\n', x1);
else 
    x2 = conj(x1);
    fprintf('\nTiene raices: %f %fi   %f +%fi\n\n', x1, x1/1i, x2, x2/1i);
end
