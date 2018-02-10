
f=inline('x^3+2*x^2+10*x-20', 'x');

%xl = input('xl: ');
%xu = input('xu: ');
%error = input('error: ');
xl=1;
xu=2;
error=0.001;

n = (log(xu-xl) - log(error)) / (log(4));

a = feval(f,xl); 
b = feval(f,xu);
    
if(a*b<0)
    fprintf('%d\n', n);
    fprintf('0 %d %d\n', xl, xu);

    for i=1:round(n)
        
        distancia = abs(xu-xl)/4;        
        
       
        c1=xl+distancia;
        c2=c1+distancia;
        c3=c2+distancia;
        
        fprintf('distancia: %d    ', distancia);
        
        a = feval(f,xl); 
        b = feval(f,xu);
        cm1=feval(f,c1);
        cm2=feval(f,c2);
        cm3=feval(f,c3);
        
        fprintf('i: %d  xl: %d  c1: %d  c2: %d  c3: %d  xu: %d\n', i, xl, c1, c2, c3, xu);
        
        if(a*cm1<0)
            xu=c1;
        elseif(cm1*cm2<0)
            xl=c1;
            xu=c2;
        elseif(cm2*cm3<0)
             xl=c2;
             xu=c3;
        elseif(b*cm3<0)
            xl=c3;
        elseif(cm1*cm2==0 || cm2*cm3==0) 
            fprintf('El valor de la raiz es: %d\n', cm2);
            break;
        elseif(b*cm3==0)
            fprintf('El valor de la raiz es: %d\n', cm3);
            break;
        elseif(a*cm1==0)
            fprintf('El valor de la raiz es: %d\n', cm1);
            break;
        end        
       
    end   
elseif fprintf('No existe la raiz');    
end
