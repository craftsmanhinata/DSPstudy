%本程序用双线性变换法设计IIR数字高通滤波器，采用切比雪夫I型低通滤波器原型。
%也可以将模拟滤波器指标预畸变后，直接设计模拟高通滤波器，再用双线性变换库函数求数字高通滤波器。
clc;
clear;
close all;

Fs=1000;
fp=300;fs=200;
Rp=1;Rs=40;
wp=2*Fs*tan(pi*fp/Fs);ws=2*Fs*tan(pi*fs/Fs); 
[N,Wpo]=cheb1ord(wp,ws,Rp,Rs,'s');      
[b,a]=cheby1(N,Rp,wp,'high','s');
[bz,az]=bilinear(b,a,Fs);
w=0:0.01*pi:pi;
[h,w]=freqz(bz,az,w);  %求数字滤波器幅频响应
w=w/pi; 
figure;plot(w,20*log10(abs(h))); xlabel('\omega/\pi');ylabel('幅度（dB）'); grid on; 