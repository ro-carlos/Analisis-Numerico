Taylor = function(f, x0, tol, maxiter){
  # Derivada numérica con diferencia central
  fp = function(x) { h = 0.1
  (f(x+h) - f(x-h)) / (2*h)
  }
  k = 0
  #Par imprimir estado
  cat("---------------------------------------------------------------------------\n")
  cat(formatC( c("x_k"," f(x_k)","Error est."), width = -20, format = "f", flag = " "), "\
      n")
  cat("---------------------------------------------------------------------------\n")
  repeat{
    correccion = f(x0)/fp(x0)
    x1 = x0 - correccion
    dx = abs(correccion)
    # Imprimir iteraciones
    cat(formatC( c(x1 ,f(x1), dx), digits=15, width = -15, format = "f", flag = " "), "\n")
    x0 = x1
    k = k+1
    # until
    if(dx <= tol || k > maxiter ) break;
  }
  cat("---------------------------------------------------------------------------\n")
  if(k > maxiter){
    cat("Se alcanzó el máximo número de iteraciones.\n")
    cat("k = ", k, "Estado: x = ", x1, "Error estimado <= ", correccion)
  } else {
    cat("k = ", k, " x = ", x1, " f(x) = ", f(x1), " Error estimado <= ", correccion) }
}
## --- Pruebas
f = function(x) x/2+x**2-11/20*exp(2*x)+7/4

options(digits = 15)
Taylor(f, 0.5, 0.1, 10)
plot(f,0,1,col="red",xlab="X",ylab="Fx")

g = function(x) x/2+x**2-11/20*exp(2*x)+7/4
plot(g,0,1,col="yellow",xlab="X",ylab="Fx")
title(main="Exacta(azul)vs Taylor(Rojo)")