
f=inline('x^3+2*x^2+10*x-20', 'x');
%xl = input('xl: ');
%xu = input('xu: ');
%error = input('error: ');
xl=1;
xu=2;
error=0.001;

n = (log(xu-xl) - log(error)) / (log(3));



a = feval(f,xl); 
b = feval(f,xu);
    
if(a*b<0)
    fprintf('%d\n', n);
    fprintf('0 %d %d\n', xl, xu);

    for i=1:round(n)
        
        distancia = abs(xu-xl)/3;        
        
        fprintf('distancia: %d    ', distancia);
        
        c1=xl+distancia;
        c2=c1+distancia;
        
        a = feval(f,xl); 
        b = feval(f,xu);
        cm1=feval(f,c1);
        cm2=feval(f,c2);
        
        fprintf('i: %d  xl: %d  c1: %d  c2: %d  xu: %d\n', i, xl, c1, c2, xu);
        
        if(a*cm1<0)
            xu=c1;
        elseif(b*cm2<0)
            xl=c2;
        elseif(cm1*cm2<0)
            xl=c1;
            xu=c2;
        elseif(cm1*cm2==0 || a*cm1==0 ) 
            fprintf('El valor de la raiz es: %d\n', cm1);
            break;
        elseif(b*cm2==0)
            fprintf('El valor de la raiz es: %d\n', cm2);
            break;
        end        
       
    end   
elseif fprintf('No existe la raiz');    
end
