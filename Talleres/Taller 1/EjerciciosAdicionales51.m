%Método de Newton Raphson
clear, clc
cf= input('Ingrese función a evaluar: ');
syms x
f=inline(cf)
derivada= diff(cf,x);
df=inline(derivada)
tol=input('Ingrese tolerancia: ');
error=50;
x=input('Ingrese un valor inicial: ');
n=0;
disp('n\tx\terror');
while(error>tol)
    fprintf('\t%i\t%3.5f\t%f\n', n, x, error);
    n=n+1;
    x=x-f(x)/df(x);
    error=abs(f(x));
end