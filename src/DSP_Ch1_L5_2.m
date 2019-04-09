%利用MATLAB库函数求解无限冲击响应（IIR）滤波求的输出
%本程序是第一章第一节离散时间系统分析中讲解用 MATLAB 求解系统输出的实例。
%首先产生两个正弦信号，令其通过一个用线性常系数差分方程表示的低通滤波器（无限冲击响应滤波器，IIR 系统），观察系统的输出。

clear;%清里内存
close all;
x=sin(2*pi*0.4*(0:127)/10)+sin(2*pi*2.45*(0:127)/10); 
figure;plot(0:127,x);grid on;
xlim([0 127]); 
xlabel('n','fontsize',14);ylabel('x(n)','fontsize',14);
title('系统输入信号x(n)','fontsize',14);

B=[0.0223 0.001 0.0223];
A=[1 -1.7007 0.7613];
hf=freqz(B,A,1024);%求频谱
xf=freqz(x,1,1024); 
figure;subplot(2,1,1);
plot((0:1023)*10/2048,20*log10(abs(hf)/max(abs(hf))));
grid on;xlabel('kHz','fontsize',14);ylabel('系统频率响应','fontsize',12);
title('系统频率响应','fontsize',14);ylim([-50 1]);

subplot(2,1,2);
plot((0:1023)*10/2048,20*log10(abs(xf)/max(abs(xf))));
grid on;xlabel('kHz','fontsize',14);ylabel('输入信号频谱','fontsize',12);
title('输入信号幅频响应','fontsize',14);ylim([-50 1]);

y=filter(B,A,x);figure;plot(0:127,y);grid on;
xlim([0 127]);grid on;
xlabel('n','fontsize',14);ylabel('y(n)','fontsize',14);
title('系统输出','fontsize',14);