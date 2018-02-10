%f=inline('9.8*(68.1/x)*(1-exp((-10*x)/(68.1)))-40', 'x');
f=inline('x^3+2*x^2+10*x-20', 'x');

%xl = input('xl: ');
%xu = input('xu: ');
%error = input('error: ');
xl=1;
xu=2;
error=0.001;

n = (log(xu-xl) - log(error)) / (log(2));
c = (xl+xu)/2;



a = feval(f,xl); 
b = feval(f,xu);
c = (xl+xu)/2;    
cm = feval(f,c);
    
if(a*b<0)
    fprintf('%d\n', n);
    fprintf('0 %d %d\n', xl, xu);
    for i=1:round(n)

        a = feval(f,xl); 
        b = feval(f,xu);
        c = (xl+xu)/2;    
        cm = feval(f,c);

        
        fprintf('%d %d %d %d ', i, xl, xu, c);

        if(a*cm<0)
            xu=c;
        elseif (a*cm>0)
            xl=c;
        elseif(a*cm==0) 
            fprintf('El valor de la raiz es: %d\n', cm);
            break;
        end
        c1 = (xl+xu)/2;
        fprintf('%d %d\n', abs(c1-c), abs(cm));
    end   
elseif fprintf('No existe la raiz');    
end
