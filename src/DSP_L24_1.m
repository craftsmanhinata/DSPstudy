% 程序说明
% 本程序改变两个余弦信号之间的频率间隔，观察信号持续时间对信号频谱的影响。
clear;
close all;

samples=2048;%信号持续点数
FFTN=2048;%FFT 点数
n=0:samples-1; 
Fs=80;%采样频率(kHz)
f1=20;f2=21;%信号频率(kHz)

x=cos(2*pi*f1/Fs*n)+2*cos(2*pi*f2/Fs*n); 

fx=fft(x,FFTN);%设定 FFT 点数为 FFTN

figure; 
subplot(2,1,1);
plot(x,'LineWidth',1.5);
grid on;
xlabel('n');ylabel('x(n)');title('时域波形');

subplot(2,1,2);
plot(abs(fx),'LineWidth',1.5);
grid on;
xlabel('k');ylabel('X(k)');title('幅频特性');

%寻找幅频特性最大值并显示
[fz, fn] = max(abs(fx(1:FFTN/2))); 
f=(fn-1)/FFTN*Fs;