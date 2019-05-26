%程序名：时域样点内插零，频域压缩
%一、程序说明：本程序是讲解前两章小结时的实例。
%在原信号样点之间内插零，相当于将原信号频谱无失真压缩。
clear;
close all; 
x=[1 2 3 4 5 6 7 6 5 4 3 2 1];
y(1:3:13*3)=x;%在信号每个样点之间加2个零
figure;
subplot(2,1,1),stem(0:12,x);grid on;
xlabel('n','fontsize',14);ylabel('x(n)','fontsize',14);
subplot(2,1,2),stem(0:12*3,y);grid on;
xlim([0 12*3]);
xlabel('n','fontsize',14);ylabel('y(n)','fontsize',14);

xf=fft(x,1024);%求信号频谱
yf=fft(y,1024);
figure;
subplot(2,1,1),plot((0:1023)/512,abs(xf));
grid on; xlabel('\omega/\pi'  ,'fontsize',14);ylabel('幅度(dB)','fontsize',14);            
title('原信号频谱','fontsize',12);
subplot(2,1,2),plot((0:1023)/512,abs(yf));
grid on;title('样点中间内插零之后的频谱','fontsize',12);
xlabel('\omega/\pi'  ,'fontsize',14);ylabel('幅度(dB)','fontsize',14);