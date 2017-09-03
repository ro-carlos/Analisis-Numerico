syms x;
%f = 3*x^2;
%y=diff(f);
%disp(y);

%funcion=char(inputdlg('ingrese la funcion'))
%f=inline(funcion);

funcion=input('Ingrese la funcion: ');
f=sym(funcion);
x0=input('Ingrese el valor de x: ');
distancia=input('Ingrese la distancia: ');
m=input('Ingrese la cantidad de repeticiones: ');
error=input('Ingrese el error: ');

%disp(i);

y=subs(f,'x',x0);
%fprintf('0 %d %d\n',x0, y);
fprintf('\n0 %d 0 0 \n', x0);


if(abs(y)<=error)
    fprintf('Raiz buena!!');
else
    dx=diff(f, x);
    for i=1:m

        x1 = eval( x0 -(y / subs(dx,'x',x0)) );
        y=subs(f,'x',x1);
        %x^3+2*x^2+10*x-20
        fprintf('%d %10.6f\n', i, x1);

        if(abs(x1-x0)<distancia || abs(y)<error)
            break;
        end
        x0=x1;
    end
end

