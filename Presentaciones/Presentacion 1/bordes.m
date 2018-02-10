clear all;
a=imread('C:\Users\LENOVO\Pictures\ej1.jpg');
k = 1;


%Extraccion planos
ar = double(a(:,:,1));
imshow(ar);
s = size(a);
arc = ar*0;

%convolucion
%gradientes
kernelX  = [-1 0 1; -k 0 k; -1 0 1]/(2+k);
kernelY  = [-1 -k -1; 0 0 0; 1 k 1]/(2+k);
kernelMg = [-k -1 0; -1 0 1; 0 1 k]/(2+k);

for i= 2: s(1)-1
    for j = 2:s(2)-1
        ventana = ar(i-1:i+1, j-1:j+1);
        prod = ventana .* kernelMg;
        pix = sum(sum(prod));
        arc(i,j)=(pix+255)/2;
    end
end

%disp(a);
%disp(ventana);
%disp(kernelMg);
%disp(prod);
%disp(pix);

%despliegue
figure(1), subplot(2,1,1), image(uint8(ar)), title('imagen original');
figure(1),  subplot(2,1,2), image(uint8(arc)), title('imagen con bordes');
