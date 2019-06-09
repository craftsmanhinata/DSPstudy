%本程序设计一个椭圆型带通滤波器滤波器
clc;
clear;
close all;

Wpl=2*pi*7000;
Wpu=2*pi*12000; 
Wsl=2*pi*4000;
Wsu=2*pi*16000; 
Rp=3;Rs=25; 

wo=Wpl*Wpu;
bw=Wpu-Wpl;
wp=1; 
ws1=(Wsu*Wsu-wo)/Wsu/bw; 
ws2=-(Wsl*Wsl-wo)/Wsl/bw; 
ws=min(ws1,ws2);                %求归一化低通滤波器的最小阻带起始频率
[N,Wc]=ellipord(wp,ws,Rp,Rs,'s'); 
[z,p,k]=ellipap(N,Rp,Rs);
[bp,ap]=zp2tf(z,p,k); 
wo=sqrt(wo);                    %求带通滤波器的通带中心频率
[b,a]=lp2bp(bp,ap,wo,bw);
w=0:2*pi*100:2*pi*3000;
[h,w]=freqs(b,a,w);           %求带通滤波器的系统函数h
wp=0:0.1:6; 
[hp,wp]=freqs(bp,ap,wp);     %求归一化低通滤波器的系统函数hp 
w=w/2/pi/1000; 
figure;plot(w,20*log10(abs(h)));grid on;
xlabel('kHz');ylabel('幅度(dB)');
title('实际带通滤波器的幅频响应');

