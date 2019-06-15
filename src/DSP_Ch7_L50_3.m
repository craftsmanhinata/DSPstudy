%本程序用双线性变换法设计IIR数字高通滤波器，采用切比雪夫I型低通滤波器原型。
%直接用MATLAB库函数用双线性变换法设计数字滤波器
clc;
clear;
close all;

Fs=1000;
fp=300;fs=200; 
wpz=2*fp/Fs;wsz=2*fs/Fs; 
Rp=1;Rs=40;    %求数字滤波器技术指标
[N,Wpo]=cheb1ord(wpz,wsz,Rp,Rs);   %求滤波器阶数和通带截止频率
[bz,az]=cheby1(N,Rp,Wpo,'high'); %利用双线性变换法求数字滤波器系统函数
w=0:0.01*pi:pi;
[h,w]=freqz(bz,az,w); %求数字滤波器幅频响应

w=w/pi; 
figure;plot(w,20*log10(abs(h))); xlabel('\omega/\pi');ylabel('幅度（dB）'); grid on; 