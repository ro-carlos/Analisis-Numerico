import math


def heun(f,g,x,y,z,h):
	for i in range (0,2):

		k1y = h*f(x*i,y*i,z*i)
		k1z = h*g(x*i,y*i,z*i)
		k2y = h*f(x*i + h , y*i + k1y , z*i + k1z)
		k2z = h*g(x*i + h , y*i + k1y , z*i + k1z)
		y = y*i + 0.5 * (k1y + k2y)
		z = z*i + 0.5 * (k1z + k2z)
		x =  x*i + h	
	
		print("i=",i ," valor Y:" , y )
		print("i=",i ," valor Z:" , z )
		print("i=",i ," valor X:" , x )
		print("Error en i=",i,"es: ", x - y)
		print("\n")

	

def f(x , y , z):return x + y + z
def g(x , y , z):return y - z + x

print("h= 0.1: \n")
print(heun(f,g,0,1,2,0.1))
print("\n")
print("h= 0.001: \n")
print(heun(f,g,0,1,2,0.001))