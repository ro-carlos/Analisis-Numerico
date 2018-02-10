##analisis numerico
#instalar paqute Matrix


install.packages("Matrix")#instalar paquete
library(Matrix)
install.packages("PolynomF")#instalar paquete
library(PolynomF)
install.packages("pracma")
library(pracma)
install.packages("barylag")
library(barylag)


#interpolacion de lagrange
lagrange = function(x,y,a){
n = length(x)
if(a < min(x) || max(x) < a) stop("No está interpolando")
X = matrix(rep(x, times=n), n, n, byrow=T)
mN = a - X; diag(mN) = 1
mD = X - t(X); diag(mD) = 1
Lnk = apply(mN, 1, prod)/apply(mD, 2, prod)
sum(y*Lnk)
}
##prueba
x = c(6,8,10,12,14,16,18,20)
y =  c(7,9,12,18,21,19,15,10)
lagrange(x[2:5],y[2:5], 8.5)
plot(x,y, pch=19, cex=1, col = "red", asp=1,xlab="Hora", ylab="Temperatura", main="Diagrama Temperatura vs Tiempo ")
##graficar el polinomio

##ajuste polinomica
datx = x[2:5]; daty = y[2:5]
polyAjuste = poly.calc(datx,daty)
polyAjuste
datx1 = x[2:8]; daty1 = y[2:8]
polyAjuste1 = poly.calc(datx1,daty1)
polyAjuste1

plot(datx,daty, pch=19, cex=1, col = "red", asp=1,xlab="Hora", ylab="Temperatura", main="Diagrama Temperatura vs Tiempo ")
curve(polyAjuste,add=T) # Curva de ajuste (polinomio interpolante) y puntos
plot(datx1,daty1, pch=19, cex=1, col = "gray", asp=1,xlab="Hora", ylab="Temperatura", main="Diagrama Temperatura vs Tiempo ")
curve(polyAjuste1,add=T) # Curva de ajuste (polinomio interpolante) y puntos

xi=c(0,.5,1,2,3,4)
yi=c(0,.93,1,1.1,1.15,1.2)
polyAjuste = poly.calc(xi,yi)
#polyAjuste
plot(xi,yi, pch = 19, cex=1.5, col= "red")
curve(polyAjuste,add=T,lty=3, lwd=5)

xi = c( 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0)
yi = c(0.31, 0.32, 0.33, 0.34, 0.45, 0.46, 0.47, 0.48, 0.49, 0.5)
# Interpolar con los 5 datos
xi[c(2:6)]; yi[c(2:6)]
# Interpolar en tres nodos: 0.35, 0.41, 0.55
barylag(xi[c(2:6)], yi[c(2:6)], c(0.35, 0.41, 0.55))

#otros metodos ejemplos
 ##Diferencias finitas hacia adelante. diff.ad
x<- 0:8
f<-c(0,0,0,0,1,0,0,0,0)
n<-length(f)
nombres<-c("f",paste("D",1:(n-1),sep="") )
diff.ad <-rep(NA,n*n)
dim(diff.ad)<-c(n,n)
diff.ad[,1]<-f
dimnames(diff.ad)<-list(0:(n-1),nombres)
for (j in 2:n) {
for (i in 1:(n-j+1)) {
diff.ad[i,j] <- diff.ad[i+1,j-1] - diff.ad[i,j-1]
}
}
tabla<-as.matrix(data.frame(x=x,diff.ad))
print(tabla,na.print = "")
# Diferencias finitas hacia atras : diff.at.
x<- 0:8
f<-c(0,0,0,0,1,0,0,0,0)
n<-length(f)
nombres<-c("f",paste("D",1:(n-1),sep="") )
diff.at <-rep(NA,n*n)
dim(diff.at)<-c(n,n)
diff.at[,1]<-f
dimnames(diff.at)<-list(0:(n-1),nombres)
for (j in 2:n) {
for (i in n:(j)) {
diff.at[i,j] <- diff.at[i,j-1] - diff.at[i-1,j-1]
}
}
tabla<-as.matrix(data.frame(x=x,diff.at))
print(tabla,na.print = "")

##Diferencias finitas centrales. diff.c
x<-0:8
f<-c(0,0,0,0,1,0,0,0,0)
n<-length(f)
x1<-rep(NA,2*n)
f1<-x1
for (i in seq(2,2*n,2)){
x1[i-1]<-x[i/2]
f1[i-1]<-f[i/2]
}
m<-2*n
nombres<-c("f",paste("D",1:(n-1),sep="") )
diff.c <-rep(NA,2*n*n)
dim(diff.c)<-c(2*n,n)
diff.c[,1]<-f1
xnames<-seq(0,n-0.5,0.5)
dimnames(diff.c)<-list(xnames,nombres)
for (j in 2:n) {
for (i in j:(m-j+1)) {
print(c(i,j))
diff.c[i,j] <- diff.c[i+1,j-1] - diff.c[i-1,j-1]
}
}
tabla<-as.matrix(data.frame(x=x1,diff.c))
print(tabla,na.print = "")

##Diferencias divididas. diff.dv
x<-c(0,1,3,4,6,7)
f<-c(-5,1,25,55,181,289)
n<-length(f)
nombres<-c("f",paste("D",1:(n-1),sep="") )
diff.dv <-rep(NA,n*n)
dim(diff.dv)<-c(n,n)
diff.dv[,1]<-f
dimnames(diff.dv)<-list(0:(n-1),nombres)
for (j in 2:n) {
for (i in 1:(n-j+1)) {
k<-j+i-1
print(c(i,j,k))
diff.dv[i,j] <- (diff.dv[i+1,j-1] - diff.dv[i,j-1])/(x[k]-x[i])
}
}
tabla<-as.matrix(data.frame(x=x,diff.dv))
print(tabla,na.print = "")


