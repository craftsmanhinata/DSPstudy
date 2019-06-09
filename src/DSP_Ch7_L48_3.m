%本程序设计一个切比雪夫II型高通滤波器
clc;
clear;
close all;

Wp=2*pi*600;
Ws=2*pi*200;
Rp=3;Rs=25;
wp=1;ws=Ws/Wp;

[N,Wc]=cheb2ord(wp,ws,Rp,Rs,'s');%求归一化切比雪夫II型低通滤波器阶数和3dB频率
[z,p,k]=cheb2ap(N,Rs);
[bp,ap]=zp2tf(z,p,k);               %求归一化低通滤波器系统函数分子、分母系数
[b,a]=lp2hp(bp,ap,Wp);              %求一般高通滤波器系统函数分子、分母系数
w=0:2*pi*100:2*pi*1000;             %求模拟高通滤波器频率
[h,w]=freqs(b,a,w);                  %求模拟高通滤波器频率响应h 
wp=0:0.1:6; 
[hp,wp]=freqs(bp,ap,wp);            %求归一化低通滤波器的系统函数hp 
w=w/2/pi/1000; 
figure;plot(w,20*log10(abs(h)));grid on;
xlabel('kHz');ylabel('幅度(dB)');
title('切比雪夫II型高通滤波器的幅频响应')