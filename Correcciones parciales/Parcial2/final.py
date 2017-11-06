import os
import sys
import numpy as np
from scipy.interpolate import griddata
import matplotlib.pyplot as plt
from PIL import Image

img_name = sys.argv[1]
img_s = sys.argv[2]

def interpolar():

    def make_interpolated_image(nmuestra):

        Arrayx = np.random.randint(imagen.shape[1], size=nmuestra)
        Arrayy = np.random.randint(imagen.shape[0], size=nmuestra)
        muestra = imagen[Arrayy,Arrayx]
        int_imagen = griddata((Arrayy,Arrayx), muestra, (Y, X))
        return int_imagen


    imagen = Image.open(img_name)
    imagen = np.array(imagen.convert('L'))


    nx, ny = imagen.shape[1], imagen.shape[0]
    X, Y = np.meshgrid(np.arange(0, nx, 1), np.arange(0, ny, 1))


    nfilas, ncolubnas = 2, 2
    fig, ax = plt.subplots(nrows=2, ncols=2, figsize=(6,4), dpi=100)
    if nx < ny:
        w, h = fig.get_figwidth(), fig.get_figheight()
        fig.set_figwidth(h), fig.set_figheight(w)


    get_indices = lambda i: (i // nfilas, i % ncolubnas)


    for i in range(4):
        nmuestra = 10**(i+2)
        Eje = ax[get_indices(i)]
        Eje.imshow(make_interpolated_image(nmuestra),
                              cmap=plt.get_cmap('Greys_r'))
        Eje.set_xticks([])
        Eje.set_yticks([])
        Eje.set_title('# Puntos = {0:d}'.format(nmuestra))
    Archivo = os.path.splitext(os.path.basename(img_name))[0]
    plt.savefig(img_s.format(Archivo), dpi=100)

interpolar()
