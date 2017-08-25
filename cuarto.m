funcion='exp(-5)';
f=sym(funcion); 


%forma 1
pol = 0;
Sum =0;
for i=0:9
    Sum = Sum + (1/factorial(i));
    
end
Sum=Sum^5;
res = 1 / Sum;
fprintf('Valor de la serie metodo 1: %10.10f\n\n',res);



% forma 2
Sum = 0;
for i=0:9
    Sum = Sum + (((-5)^i)/factorial(i));
end
fprintf('Valor de la serie metodo 2 con 9 iteraciones: %10.10f\n',Sum);


Sum = 0;
for i=0:100
    Sum = Sum + (((-5)^i)/factorial(i));
end
fprintf('Valor de la serie metodo 2 con 100 iteraciones: %10.10f\n\n',Sum);