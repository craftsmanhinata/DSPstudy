%一、程序说明  本程序改变两个余弦信号之间的频率间隔，观察信号持续时间对信号频谱的影响。
close all;
clear;
samples=100;FFTN=1024;%信号持续点数及FFT点数
n=0:samples-1; 
Fs=100;%采样频率(kHz)
f1=10;f2=30;%信号频率(kHz)
x=cos(2*pi*f1/Fs*n)+cos(2*pi*f2/Fs*n); 
fx=fft(x,FFTN);%设定FFT点数为FFTN
figure; plot((0:FFTN/2-1)/FFTN*Fs,20*log10(abs((fx(1:FFTN/2)))),'LineWidth',2);
grid on; xlabel('kHz','fontsize',12);ylabel('|X(e^j\omega)|','fontsize',12);
axis([0 50 -10 35]); 