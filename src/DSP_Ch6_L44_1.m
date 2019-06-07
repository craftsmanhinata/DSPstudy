%FIR低通滤波器
%(一)程序说明 本程序主要利用MATLAB自带函数来设计FIR低通滤波器。
clc;
clear;
close all;

wp=0.5*pi;        %计算滤波器的通带截止频率
ws=0.6*pi;        %计算滤波器的阻带起始频率
%alphas>=20;     %阻带衰减20,可选择矩形窗
Bt=ws-wp;         %计算过渡带
N=ceil(4*pi/Bt);        %计算矩形窗的长度
wd=0.5*(wp+ws);      %计算理想低通滤波器的通带截止频率

hn=fir1(N-1,wd/pi,rectwin(N)); %调用fir1计算低通FIR滤波器
hf=fft(hn,256);
WR=20*log10(abs(hf));
ff=unwrap(angle(hf)); 
figure;
stem(hn,'.');
grid on;
xlabel('n');
title('h(n)'); 

figure; 
subplot(2,1,1);
plot((0:127)/128,WR(1:128));
grid;
xlabel('\omega/\pi');
title('20lg|H(\omega)|'); 
subplot(2,1,2);
plot((0:127)/128,ff(1:128));
grid on;
xlabel('\omega/\pi');
title('\theta(\omega)');