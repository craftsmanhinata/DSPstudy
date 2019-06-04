%一、程序说明  本程序用于估计正（余）弦信号的频率，适用条件是已知频率的大概取值。
clear;
close all;

samples=90;FFTN=2048;%信号持续点数及FFT点数
n=0:samples-1; 
Fs=100;%采样频率(kHz)
f1=20.1;f2=21.5;%信号频率(kHz)
x=cos(2*pi*f1/Fs*n)+2*cos(2*pi*f2/Fs*n); 
fx=fft(x,FFTN);%设定FFT点数为FFTN
df=0.5;%频率搜索范围-df-df
dk=floor(df/Fs*FFTN);%与之对应的k 
k1=floor(f1/Fs*FFTN);
k2=floor(f2/Fs*FFTN); 
[m,n]=max(abs(fx(k1-dk:k1+dk)));[n+k1-dk-2 (n+k1-dk-2)/FFTN*Fs] 
[m,n]=max(abs(fx(k2-dk:k2+dk)));[n+k2-dk-2 (n+k2-dk-2)/FFTN*Fs] 
figure; plot((0:FFTN-1)/FFTN*Fs,20*log10((abs((fx(1:FFTN))))),'b','LineWidth',2);
grid on; xlabel('kHz','fontsize',12);ylabel('|X(e^j\omega)|','fontsize',12);
%axis([0 50 -10 40]);