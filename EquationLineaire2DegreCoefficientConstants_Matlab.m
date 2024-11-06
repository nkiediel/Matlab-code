clc; clear all;

%% Lorenz
a=0; Wo=1 ; A=0 ; W=1;
f1=@(t,x1,x2) x2;
f2=@(t,x1,x2) -a*x2-Wo^2*x1+A*cos(W*t);
%f2=@(t,x1,x2) -a*x2-Wo^2*x1+t;

h=0.001;
t=0:h:20;

x1=zeros(1,length(t));
x2=zeros(1,length(t));

x1(1)=0;
x2(1)=1;


for i=1:(length(t)-1) %
    
    k1=f1(t(i),x1(i),x2(i));
    k2=f1(t(i)+h/2,x1(i)+k1*h/2,x2(i)+k1*h/2);
    k3=f1(t(i)+h/2,x1(i)+k2*h/2,x2(i)+k2*h/2);
    k4=f1(t(i)+h,x1(i)+k3*h,x2(i)+k3*h);
    x1(i+1)=x1(i)+h*(k1+2*k2 +2*k3+k4)/6;
    
    k1=f2(t(i),x1(i),x2(i));
    k2=f2(t(i)+h/2,x1(i)+k1*h/2,x2(i)+k1*h/2);
    k3=f2(t(i)+h/2,x1(i)+k2*h/2,x2(i)+k2*h/2);
    k4=f2(t(i)+h,x1(i)+k3*h,x2(i)+k3*h);
    x2(i+1)=x2(i)+h*(k1+2*k2+2*k3+k4)/6;
    
end
subplot(2,2,1); plot(t,x1,'LineWidth',2); grid on;
subplot(2,2,2); plot(t,x2,'LineWidth',2); grid on;
subplot(2,2,3); plot(t,x1,t,x2,'LineWidth',2); grid on;
subplot(2,2,4); plot(x1,x2,'LineWidth',2); grid on;
