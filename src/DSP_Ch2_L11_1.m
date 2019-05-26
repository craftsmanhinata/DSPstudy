%程序名：最小相位系统的特点
%一、程序说明：本程序是讲解第二章第三节LTI离散时间系统的频域分析中“系统零极点对系统频率响应的影响”的实例。
%通过设置两个幅频响应相同的最大和最小相位系统，利用同一个输入信号（单载波），观察两个系统输出的不同。
%最小相位
clear;
close all;
z1=0.9*exp(1i*0.122*pi);z2=0.9*exp(-1i*0.122*pi); %设置最小相位系统零点
z3=0.7*exp(1i*0.3*pi);z4=0.7*exp(-1i*0.3*pi); 
p1=0.95*exp(1i*0.01*pi);p2=0.95*exp(-1i*0.01*pi); %设置最小相位系统极点
p3=0.95*exp(1i*0.1*pi);p4=0.95*exp(-1i*0.1*pi); 

z=[z1,z2,z3,z4]';p=[p1,p2,p3,p4]';
figure;zplane(z,p);grid on;%画出最小相位系统零极点图  
title('最小相位系统零极点图','fontsize',12);

[b,a]=zp2tf(z,p,1);%根据零极点求系统函数  

z21=1/z1;z22=1/z2;z23=1/z3;z24=1/z4;  
zz=[z21,z22,z23,z24]';%求镜像对称的零点  
pp=p;  figure;zplane(zz,pp);grid on;%画出最大相位系统零极点图    
title('最大相位系统零极点图','fontsize',12);  
[b1,a1]=zp2tf(zz,pp,1);  

w=0:0.005*pi:pi;  
h=freqz(b,a,w);  hmax=max(abs(h));  
h1=freqz(b1,a1,w);h1max=max(abs(h1));  
w=w/pi;               
figure;subplot(2,1,1),plot(w,20*log10(abs(h)/hmax));grid on; 
xlabel('\omega/\pi'  ,'fontsize',14);ylabel('幅度(dB)','fontsize',14);            
title('最小相位系统的幅频响应','fontsize',12);  
subplot(2,1,2),plot(w,20*log10(abs(h1)/h1max));grid on
title('最大相位系统的幅频响应','fontsize',12);
xlabel('\omega/\pi'  ,'fontsize',14);ylabel('幅度(dB)','fontsize',14);  
x=sin(2*pi*(1:1256)*80/2000);%产生输入信号
y1=filter(b,a,x);%信号通过最小相位系统
y2=filter(b1,a1,x);%信号通过最大相位系统
figure;

subplot(2,1,1),plot(y1(1:200)/hmax);grid on; 
title('最小相位系统的输出','fontsize',12);
ylim([-0.1 0.2]);xlabel('n'   ,'fontsize',14);ylabel('y(n)','fontsize',14);

subplot(2,1,2),plot(y2(1:200)/h1max);grid on;             
title('最大相位系统的输出','fontsize',12);
ylim([-0.1 0.2]);xlabel('n'   ,'fontsize',14);ylabel('y(n)','fontsize',14);