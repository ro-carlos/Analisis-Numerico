x = linspace(-0.5, 0.5, 100);
p1 = 1-x;
p2 = p1 + x.^2;
f = 1./(1 + x);
plot(x, p1, x, p2, x, f)
xlabel('X0'); ylabel('Y');
title('Funcionf(x) = 1/(1 + x)')
text(-0.4, 1.8,' f');
text(-0.45, 1.4,' p1');
text(-0.45, 1.7,' p2');