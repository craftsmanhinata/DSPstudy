%傅里叶变换时域相乘
%本程序是讲解第二章第二节离散时间信号傅里叶变换性质的实例。从 wave 文件读取一段音乐
%信号，画出其幅频特性，然后进行 DSB（抑制载波双边带调制）调制（乘以 cos）到 8kHz，再观
%察其幅频特性。

clear;%清除内存
close all;%关闭所有图形
clear sound;
filename1='canon.wav';
info = audioinfo(filename1);

[s1,fs]=audioread(filename1);%读取音乐信号，采样频率为fs
fs=fs/1000;%采样频率单位为kHz
s=s1';
x=s;

t1 = info.TotalSamples / 2;
t2 = info.TotalSamples;

xf=20*log10(abs(fft(x,t2)));%求实信号的频谱
xf1(1:t1)=xf((t1+1):t2);
xf1((t1+1):t2)=xf(1:t1);
figure;plot((-t1:(t1-1))*fs/t2,xf1);grid on;
ylabel('实信号频谱','fontsize',12);xlabel('kHz','fontsize',14);%标注xy轴坐标
title('实信号幅频特性','fontsize',14); %xlim([-16 16]);

%y=x.*cos(2*pi*11/fs*(0:(t2-1)));%DSB调制
y=x.*exp(2*1i*pi*0*fs/fs*(0:(t2-1)));%频谱搬移
y1 = abs(y);
sound(x,fs*1000);

yf=20*log10(abs(fft(y,t2)));%求复信号的频谱
yf1(1:t1)=yf((t1+1):t2);
yf1((t1+1):t2)=yf(1:t1);
figure;plot((-t1:(t1-1))*fs/t2,yf1);grid on;
ylabel('调制信号频谱','fontsize',12);xlabel('kHz','fontsize',14);%标注xy轴坐标
title('调制信号幅频特性','fontsize',14); %xlim([-16 16]);