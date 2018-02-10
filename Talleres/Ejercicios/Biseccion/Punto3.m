funcion=char(inputdlg('ingrese la funcion'));
f=inline(funcion);
x=-5:0.1:5;
n=length(x);
for i=1:n
y(i)=f(x(i));
end
plot(x,y);
hold on;
plot([-5 5],[0 0],'r');
grid on;
plot([0 0],[-5 5],'r');
j=-5;
for i=1:11
text(j,0,num2str(j));
j=j+1;
end
a=str2double(inputdlg('ingrese el valor de a'));
b=str2double(inputdlg('ingrese el valor de b'));
iteraciones=1;
j=1;
pmviejo=0;
while iteraciones<5
pm=((a+b)/2);
fa=f(a);
fb=f(b);
fpm=f(pm);
aa(j)=a;
bb(j)=b;
ppm(j)=pm;
errorf=abs(pm-pmviejo);
err(j)=errorf;
if fa*fpm<0
b=pm;
end
if fb*fpm<0
a=pm;
end
pmviejo=pm;
j=j+1;
iteraciones=iteraciones+1;
end
set(handles.uitable1,'data',[aa' ppm' bb' err']);