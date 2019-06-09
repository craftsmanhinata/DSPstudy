%本程序用于设计巴特沃斯型归一化模拟低通滤波器
clc;
clear;
close all;

Wp=1;Ws=4;Rp=3;Rs=40;               %设置滤波器技术指标,Rp为通带最大衰减，Rs为阻带最小衰减
[N,Wc]=buttord(Wp,Ws,Rp,Rs,'s'); %计算滤波器阶数和3dB截止频率
[z,p,k]=buttap(N);                   %求归一化滤波器的零极点
[b,a]=zp2tf(z,p,k);                 %求滤波器系统函数分子、分母多项式系数
w=0:0.1:6;%在0～6范围内取61点
[h,w]=freqs(b,a,w);%计算频率向量w上的频率响应
figure;
plot(w,20*log10(abs(h)));
grid on;xlabel('\lambda');ylabel('A(\lambda)(dB)');
title('巴特沃思归一化低通滤波器的幅频响应'); 