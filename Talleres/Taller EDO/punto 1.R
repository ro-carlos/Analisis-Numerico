#install.packages('deSolve')
#library('deSolve')
require(deSolve)


#Condiciones iniciales del problema
xInicial = 0
yInicial = 1
cantIteraciones = 7
pasoSalto=1



f1 = function(x,y){
  s = (y+x-x^2+1)
  return (s)
}

solF1 = function(x){
  s = (x^2+x+exp(x))
  return(s)
  
}


exacta = function(yInicial,xInicial,m,h){
  
  if(h>=m)stop("No es posible calcular el metodo")
  i=0
  xi=xInicial
  yi=yInicial
  
  x=c(xi)
  y=c(yi)
  
  pos = 1
  while(i<=m){
    x[pos]=i
    y[pos]=(solF1(i))
    
    i=i+h;
    pos=pos+1
  }
  tabla1 = cbind(x,y)
  #plot(x,y,main = "Algoritmo exacta")
  return (tabla1)
  
}

algoritmo = function(yInicial, xInicial, m,h){
  
  if(h>=m)stop("No es posible calcular el metodo")
  i=0
  
  xi=xInicial
  yi=yInicial
  
  x=c(xi)
  y=c(yi)
  
  pos = 1
  while(i<=m){
    k1=h*eval(f1(xi,yi))
    k2= h*eval(f1(xi+h,yi+k1))
    
    x[pos]=xi
    y[pos]=yi
    xi = xi+h
    yi = yi+(0.5)*(k1+k2)
    i=i+h;
    pos=pos+1
  }
  tabla2 = cbind(x,y)
  #plot(x,y,main = "Algoritmo punto 1")
  return (tabla2)
}

#Estimacion del error sacando la diferencia de evaluar la funcion en
#un punto x y promediar ese valor
calcularError=function(tablaExacta, tablaAlgoritmo){

  
  tam = length(tablaExacta)
  tam2 = length(tablaAlgoritmo)
  
  if(tam!=tam2)stop("No se puede calcular el error")
  
  i = tam /2
  errorAcum = 0
  v1=c()
  v2=c()
  while(i<=tam){
    errorAcum = abs((tablaExacta[i]-tablaAlgoritmo[i])/(tablaExacta[i]))
    i=i+1
  }
  errorAcum = errorAcum*100
  sprintf("El error es de: %f por ciento", (errorAcum))
  
  
}


tablaExacta=exacta(yInicial, xInicial, cantIteraciones, pasoSalto)
tablaAlgoritmo=algoritmo(yInicial, xInicial, cantIteraciones, pasoSalto)
plot(tablaExacta,col="red", main="Exacta(rojo)vs Algoritmo(azul)")
points(tablaAlgoritmo,col="blue" )


calcularError(tablaExacta,tablaAlgoritmo)