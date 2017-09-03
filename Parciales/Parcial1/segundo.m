funcion='cos(4*x-1)+0.5';

fprintf('Valores para cos(4*x-1)+0.5\n\n\n\n');
f=sym(funcion);
tolerancia=0.0001;



xnAnterior1=0;
xn1=1;

i=0;
xnFinal1=0;
while(i<2)
    num1=xn1-xnAnterior1;
    den1=subs(f, 'x', xn1) - subs(f, 'x', xnAnterior1);
    f01=subs(f, 'x', xn1);

    xnFinal1 = xn1 + eval(xnAnterior1-f01*((num1)/(den1)));
    
    xnAnterior=xn1;
    xn1=xnFinal1;
    i=i+1;
    
    disp(xnFinal1);

end

%fprintf('evaluacion cos(4x-1)+0.05 [0 1]: %10.4f\n', xnFinal1);




%parte b
funcion2='2^x-1.3';
f2=sym(funcion2);

xnAnterior2=-1;
xn2=1;
fprintf('*************\n\n\n\n');
i=1;
xnFinal2=0;
fprintf('Valores para 2^x-1,3\n\n\n\n');
while(i<10)
    num2=subs(f2,'x', xn2)*(xn2-xnAnterior2);
    den2=subs(f2, 'x', xn2) - subs(f2, 'x', xnAnterior2);

    xnFinal2 = xn2 - (num2/den2);
    
    xnAnterior2=xn2;
    xn2=xnFinal2;
    i=i+1;
    
    disp(xnFinal2);

end

%fprintf('evaluacion 2^x [-1 1]: %10.4f\n', xnFinal2);
