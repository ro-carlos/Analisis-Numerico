#Segundo punto taller

#install.packages('deSolve')
#library('deSolve')

require(deSolve)
tis=seq(0,10,0.1)
funcion=function(x,y,parms){
  s=(2*y-x^2+x-3)
  return(list(s))
}



listaFuncion=funcion(2,2)
solucionEuler= ode(c(1.2),tis,funcion,parms=NULL,method="euler")
tabla = cbind(tis,solucionEuler[,2])
colnames(tabla)=c("ti","euler")
tabla
plot(tis,solucionEuler[,2],main = "Metodo de euler")


listaFuncion=funcion(2,2)
solucionRK= ode(c(1.2),tis,funcion,parms=NULL,method="rk4")
tabla = cbind(tis,solucionRK[,2])
colnames(tabla)=c("ti","Rouge Kutta")
tabla
plot(tis,solucionRK[,2],main = "Metodo de Runge Kutta")

listaFuncion=funcion(2,2)
solucion= ode(c(1.2),tis,funcion,parms=NULL,method="rk2")
tabla = cbind(tis,solucion[,2])
colnames(tabla)=c("ti","Rouge rk2")
tabla
plot(tis,solucion[,2],main = "Metodo de Heun")


#funcion comparacion

funcionBase=function(x,parms){
  s=(x/2+x^2-(11/20)* exp(2*x)+(7/4))
  
}
y=funcionBase(tis)
plot(tis,y,main="Comparacion sulucion exacta")
#metodo de euler
points(tis,solucionEuler[,2],pch=5,col="red")
#metodo de Rouge Kutta
points(tis,solucionRK[,2],pch=5,col="blue")
#metodo de heun
points(tis,solucion[,2],pch=5,col="green")

