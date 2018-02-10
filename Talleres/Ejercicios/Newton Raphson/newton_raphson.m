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
opcion=input('Digite 1 si desea verificar multiplicidad, en caso contrario cualquier numero: ');

i=1;
if(opcion==1)
    multiplicidad = diff(f,x);
    while(i<3)
        disp(multiplicidad);
        r = subs(multiplicidad, 'x', 0);
        %disp(r);
        if(r ~= 0);break;
        end
        i=i+1;
        multiplicidad = diff(multiplicidad,x);
    end
else i=2;
end
%disp(i);
if(i==2)
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
            fprintf('%d %d %d %d\n', i, x1, abs(x1-x0), eval(y / subs(dx,'x',x1)));

            if(abs(x1-x0)<distancia || abs(y)<error)
                break;
            end
            x0=x1;
        end
    end
else
    fprintf('Multiplicidad erronea, metodo no disponible');
end

