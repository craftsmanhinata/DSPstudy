%傅里叶变换时域相乘
%本程序是讲解第二章第二节离散时间信号傅里叶变换性质的实例。从 wave 文件读取一段音乐
%信号，画出其幅频特性，然后进行 DSB（抑制载波双边带调制）调制（乘以 cos）到 8kHz，再观
%察其幅频特性。

clear;%清除内存
close all;%关闭所有图形
filename1='../resource/canon.wav';
[s1,fs]=audioread(filename1);%读取音乐信号，采样频率为fs
fs=fs/1000;%采样频率单位为kHz
s=s1';
x=s(180000:184095);%取音乐信号的一部分


xf=20*log10(abs(fft(x,4096)));%求实信号的频谱
xf1(1:2048)=xf(2049:4096);
xf1(2049:4096)=xf(1:2048);
figure;plot((-2048:2047)*fs/4096,xf1);grid on;
ylabel('实信号频谱','fontsize',12);xlabel('kHz','fontsize',14);%标注xy轴坐标
title('实信号幅频特性','fontsize',14); xlim([-16 16]);

y=x.*cos(2*pi*8/fs*(0:4095));%DSB调制

%y=x.*exp(2*1i*pi*6/32*(0:4095));%频谱搬移
yf=20*log10(abs(fft(y,4096)));%求复信号的频谱
yf1(1:2048)=yf(2049:4096);
yf1(2049:4096)=yf(1:2048);
figure;plot((-2048:2047)*fs/4096,yf1);grid on;
ylabel('调制信号频谱','fontsize',12);xlabel('kHz','fontsize',14);%标注xy轴坐标
title('调制信号幅频特性','fontsize',14); xlim([-16 16]);