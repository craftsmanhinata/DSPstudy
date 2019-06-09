%本程序设计一个椭圆型带阻滤波器
clc;
clear;
close all;

Wpl=2*pi*6000;
Wpu=2*pi*10000;
Wsl=2*pi*7000;
Wsu=2*pi*9500;
Rp=1;Rs=50;
wo=Wsl*Wsu;
bw=Wpu-Wpl;    
wp=1;
ws1= Wsl*bw/(wo-Wsl* Wsl);
ws2=-Wsu*bw/(wo-Wsu* Wsu); 
ws=min(ws1,ws2);                %求归一化低通滤波器的最小阻带起始频率

[N,Wc]=ellipord(wp,ws,Rp,Rs,'s');    
[z,p,k]=ellipap(N,Rp,Rs); 
[bp,ap]=zp2tf(z,p,k); 
wo=sqrt(wo);                    %求带通滤波器的通带中心频率
[b,a]=lp2bs(bp,ap,wo,bw);
w=0:2*pi*100:2*pi*15000;
[h,w]=freqs(b,a,w);
wp=0:0.1:6; 
[hp,wp]=freqs(bp,ap,wp);     %求归一化低通滤波器的系统函数hp
w=w/2/pi/1000; 
figure;plot(w,20*log10(abs(h)));grid on;
xlabel('kHz');ylabel('幅度(dB)');
title('实际带阻滤波器的幅频响应');