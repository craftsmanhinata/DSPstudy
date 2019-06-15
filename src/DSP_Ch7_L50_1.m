%本程序用双线性变换法设计IIR数字高通滤波器，采用切比雪夫I型低通滤波器原型。
%按照首先设计模拟滤波器再用双线性变换法转换为数字滤波器的思路
clc;
clear;
close all;

Fs=1000;fp=300;fs=200; 
Wp1=1;Ws1=tan(pi*fp/Fs)/tan(fs*pi/Fs); 
Rp=1;Rs=40;      %求模拟滤波器技术指标
[N,Wpo]=cheb1ord(Wp1,Ws1,Rp,Rs,'s');    %求归一化低通滤波器阶数和通带截止频率
[z,p,k]=cheb1ap(N,Rp);    %求归一化低通滤波器零极点
[bl,al]=zp2tf(z,p,k);   %求归一化低通滤波器系统函数
wp=2*tan(pi*fp/Fs)*Fs;   %求模拟高通滤波器通带截止频率
[b,a]=lp2hp(bl,al,wp);       %求模拟高通滤波器系统函数
[bz,az]=bilinear(b,a,Fs);   %利用双线性变换法求数字滤波器系统函数
w=0:0.01*pi:pi;
[h,w]=freqz(bz,az,w);  %求数字滤波器幅频响应
w=w/pi; 
figure;plot(w,20*log10(abs(h))); xlabel('\omega/\pi');ylabel('幅度（dB）'); grid on; 
%以上是首先设计归一化低通滤波器，再通过模拟频率转换求出模拟高通滤波器，最后通过双线性变换库函数求出数字高通滤波器的系统函数。
