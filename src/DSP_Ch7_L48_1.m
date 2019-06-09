%本程序用于设计巴特沃斯型模拟低通滤波器，指标如下：
% fp=5kHz, fs=10kHz 
% αp=3dB, αs=3dB
clc;
clear;
close all;

Wp=2*pi*5000;
Ws=2*pi*10000;
Rp=3;Rs=30; 

wp=1;
ws=Ws/Wp; %归一化

[N,Wc]=buttord(wp,ws,Rp,Rs,'s'); %求归一化巴特沃思低通滤波器阶数和3dB频率
[z,p,k]=buttap(N); 
[bp,ap]=zp2tf(z,p,k);          %求归一化低通滤波器系统函数分子、分母系数
[b,a]=lp2lp(bp,ap,Wp);         %求一般低通滤波器系统函数分子、分母系数
w=0:2*pi*100:2*pi*30000;      %求模拟低通滤波器频率
[h,w]=freqs(b,a,w);             %求模拟低通滤波器频率响应
wp=0:0.1:6;                       %求归一化低通滤波器频率
[hp,wp]=freqs(bp,ap,wp);       %求模拟低通滤波器频率响应
w=w/2/pi/1000; 
figure;
plot(w,20*log10(abs(h)));grid on;xlabel('kHz');ylabel('幅度(dB)');
title('巴特沃思低通滤波器的幅频响应');