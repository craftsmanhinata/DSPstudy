%FIR带通滤波器
%(一)程序说明 本程序主要利用MATLAB自带函数来设计FIR带通滤波器。
clc;
clear;
close all;

wpl=0.32*pi;
wpu=0.6*pi;
wsl=0.28*pi;
wsu=0.66*pi; % 设计指标参数赋值
wd1=0.5*(wpl+wsl);
wd2=0.5*(wpu+wsu);        % 理想带通滤波器截止频率
Bt=min(abs(wsl-wpl),abs(wsu-wpu));    % 过渡带的宽度
N=ceil(6.6*pi/Bt);    % 选用汉明窗,计算滤波器长度,精确过渡带宽。也可选择8pi/bt，但超出设计要求。
wn=[wd1/pi,wd2/pi]; % 设置理想带通截止频率

h=fir1(N-1,wn,'bandpass',hamming(N));
WR=abs(fft(h,512))/max(abs(fft(h,512)));
WR=20*log10(WR); 

subplot(1,2,1);
stem(h,'.');
grid on; 
xlabel('n');ylabel('h(n)'); 

subplot(1,2,2);
plot((0:255)/256,WR(1:256));
grid on;
xlabel('\omega/\pi');ylabel('20lg|H(\omega)|')