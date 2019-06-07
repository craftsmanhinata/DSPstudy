% 抽取前后序列的频谱
%一、程序说明 本程序将序列x(n) 3倍抽取，比较抽取前后的频谱以及滤波对抽取的影响。
close all;
clear;

x=[0:7 8 7:-1:0];%高采样速率的序列
D=3;%抽取因子
b=1/D*ones(1,D);%低通滤波器
x1=conv(b,x);
x2=conv(b,x1);
x3=conv(b,x2);
x4=conv(b,x3);
x5=conv(b,x4);
y=x(1:D:length(x));%未滤波即抽取
y1=x5(1:D:length(x5));%滤波再抽取
fx=fft(x,512);
fy=fft(y,512);
fy1=fft(y1,512);
figure;
plot((0:511)/512*2,20*log10(abs(fx)),'linewidth',2);
xlabel('\omega/\pi','fontsize',12); 
ylabel('|X(e^{j\omega})|', 'fontsize',12);
grid on; 

figure;
plot((0:511)/512*2,20*log10(abs(fy)),' b:', (0:511)/512*2,20*log10(abs(fy1)),'b'   ); 
xlabel('\omega/\pi','fontsize',12);
ylabel('|Y(e^{j\omega})|','fontsize',12);
grid on; 
title('滤波对抽取的影响','fontsize',12);
legend('未滤波','滤波后', 'fontsize',12);