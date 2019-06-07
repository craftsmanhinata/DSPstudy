%设计FIR带通滤波器
%(一)程序说明本程序用于设计FIR带通滤波器。
clc;
clear;
close all;

Fs=40000;fpl=2000;fpu=10000;fsl=1500;fsu=11500;alphas=45;    %设置滤波器的参数
wpl=2*pi*fpl/Fs;
wpu=2*pi*fpu/Fs;
wsl=2*pi*fsl/Fs;
wsu=2*pi*fsu/Fs; 
Bt=min(abs(wpl-wsl),abs(wpu-wsu));                  %计算过渡带
N=ceil(8*pi/Bt); %计算汉明窗的长度
wd=[0.5*(wpl+wsl),0.5*(wsu+wpu)];      %计算理想带通滤波器的通带截止频率
hn=fir1(N-1,wd/pi); %调用fir1计算带通FIR滤波器
hf=fft(hn,512);
WR=20*log10(abs(hf));
ff=unwrap(angle(hf));

figure;
stem(hn,'.');
grid on;
xlabel('n');
title('h(n)');

figure; 
subplot(2,1,1);plot((0:255)/512,WR(1:256));grid on;xlabel('\omega/\pi');title('20lg|H(\omega)|'); 
subplot(2,1,2);plot((0:255)/512,ff(1:256));grid on;xlabel('\omega/\pi');title('\theta(\omega)');
