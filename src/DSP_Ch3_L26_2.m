% 采样频率与频谱混叠
% 一、程序说明本程序对载频200kHz、带宽6 kHz的信号用不同采样频率采样后，进行频谱分析，观察频谱混叠现象。
% 二、程序清单
close all;
clear;
samples=256;FFTN=1024;%信号持续点数及FFT点数
n=0:samples-1; 
Fs=1015;%采样频率(kHz)
f1=200;f=3;%信号频率(kHz)
x=(1+0.3*sin(2*pi*f/Fs*n)+0.3*sin(2*pi*1/Fs*n)+0.3*sin(2*pi*2/Fs*n)).*sin(2*pi*f1/Fs*n)+ 0.1*randn(1,samples); %最后一项增加高斯白噪声
fx=fft(x,FFTN);%设定FFT点数为FFTN
figure;
plot((0:FFTN-1)/FFTN*Fs,20*log10(abs(fx)),'LineWidth',2);
grid on;
xlabel('kHz','fontsize',12);ylabel('|X(e^j\omega)|','fontsize',12); 