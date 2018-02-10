%Metodo bisección
function y=EjerciciosAdicionales5(f, a, b, toleranciaError)

u = subs(f,a);
v = subs(f,b);

if sign(u)==sign(v)
    disp('Error: SIN SOLUCION POR ESTE METODO')
    return
end

while (b-a)/2>toleranciaError
    c=(a+b)/2;
    w=subs(f,c);
    if sign(u)==sign(w)
        a=c;
        u=w;
    else
        b=c;
        v=w;
    end
end

c