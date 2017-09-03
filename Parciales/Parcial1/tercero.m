raiz=log(25)/log(8);
x0=1;
error=0.001;
funcion=log(x)/log(8);
f=sym(funcion);
n=10;

for i=1:n
    fEval = subs(f,'x', x0);
    dx=diff(f,x);
    dxEval = subs(dx, 'x', x0);

    res = x0-( fEval / dxEval );
    x0=res;
    
    disp(x0);
    disp(res);
end






disp(res);