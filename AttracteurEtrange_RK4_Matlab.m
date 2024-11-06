clc; clear all;

%% Lorenz
sig=10; bet=8/3 ; rho=28;
fx=@(t,x,y,z) sig*(y-x);
fy=@(t,x,y,z) rho*x-y-x*z;
fz=@(t,x,y,z) x*y-bet*z;

%% Rossler
a=0.2; b=0.2 ; c=5.7;
fx=@(t,x,y,z) -y-z;
fy=@(t,x,y,z) x+a*y;
fz=@(t,x,y,z) b+z*(x-c);


h=0.01;
t=0:h:500;

x=zeros(1,length(t));
y=zeros(1,length(t));
z=zeros(1,length(t));

x(1)=0.1;
y(1)=0;
z(1)=0;

for i=1:(length(t)-1) %
    
    k1=fx(t(i),x(i),y(i),z(i));
    k2=fx(t(i)+h/2,x(i)+k1*h/2,y(i)+k1*h/2,z(i)+k1*h/2);
    k3=fx(t(i)+h/2,x(i)+k2*h/2,y(i)+k2*h/2,z(i)+k2*h/2);
    k4=fx(t(i)+h,x(i)+k3*h,y(i)+k3*h,z(i)+k3*h);
    x(i+1) = x(i) + h*(k1 +2*k2  +2*k3   +k4)/6;
    
    k1=fy(t(i),x(i),y(i),z(i));
    k2=fy(t(i)+h/2,x(i)+k1*h/2,y(i)+k1*h/2,z(i)+k1*h/2);
    k3=fy(t(i)+h/2,x(i)+k2*h/2,y(i)+k2*h/2,z(i)+k2*h/2);
    k4=fy(t(i)+h,x(i)+k3*h,y(i)+k3*h,z(i)+k3*h);
    y(i+1) = y(i) + h*(k1  +2*k2   +2*k3    +k4)/6;
    
    k1=fz(t(i),x(i),y(i),z(i));
    k2=fz(t(i)+h/2,x(i)+k1*h/2,y(i)+k1*h/2,z(i)+k1*h/2);
    k3=fz(t(i)+h/2,x(i)+k2*h/2,y(i)+k2*h/2,z(i)+k2*h/2);
    k4=fz(t(i)+h,x(i)+k3*h,y(i)+k3*h,z(i)+k3*h);
    z(i+1) = z(i) + h*(k1+2*k2 +2*k3  +k4)/6;
    
end
plot3(x,y,z); grid on;