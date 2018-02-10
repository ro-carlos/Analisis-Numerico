%im1=imread('C:\Users\LENOVO\Pictures\lenna_gris.png');
im1=imread('C:\Users\LENOVO\Pictures\ej1.jpg');

%filtro sobel
sf=fspecial('sobel');
sc=sf';
s1=imfilter(im1,sf);
s2=imfilter(im1,sc);
s3=imadd(s1,s2);
subplot(2,2,1),subimage(im1),title('Imagen Original');
subplot(2,2,2),subimage(s2),title('Sobel Vertical');
subplot(2,2,3),subimage(s1),title('Sobel Horizontal');
subplot(2,2,4),subimage(s3),title('Sobel');  

%filtro prewitt
sf=fspecial('prewitt');
sc=sf';
p1=imfilter(im1,sf);
p2=imfilter(im1,sc);
p3=imadd(p1,p2);
figure(2), subplot(2,2,1),subimage(im1),title('Imagen Original');
figure(2), subplot(2,2,2),subimage(p2),title('Prewit Vertical');
figure(2), subplot(2,2,3),subimage(p1),title('Prewit Horizontal');
figure(2), subplot(2,2,4),subimage(p3),title('Prewit'); 



figure(3), subplot(1,3,1),subimage(im1),title('Imagen Original');
figure(3), subplot(1,3,2),subimage(s3),title('Sobel');
figure(3), subplot(1,3,3),subimage(p3),title('Prewit');