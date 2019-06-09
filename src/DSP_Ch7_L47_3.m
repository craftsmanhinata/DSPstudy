%本程序用于设计椭圆型归一化模拟低通滤波器
clc;
clear;
close all;

Wp=1;Ws=3;Rp=1;Rs=40;              %设置滤波器技术指标
[N,Wpo]=ellipord(Wp,Ws,Rp,Rs,'s');            %计算滤波器阶数和通带截止频率
[z,p,k]=ellipap(N,Rp,Rs);                              %求归一化滤波器的零极点
[b,a]=zp2tf(z,p,k);                                          %求滤波器系统函数分子、分母多项式系数
w=0:0.02:5; 
[h,w]=freqs(b,a,w); 
figure;
plot(w,20*log10(abs(h)));grid on;
xlabel('\lambda');ylabel('A(\lambda)(dB)');
title('椭圆型归一化低通滤波器的幅频响应');