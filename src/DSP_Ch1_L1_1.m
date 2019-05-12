% 程序名：傅里叶变换的意义
% 程序说明：本程序是绪论中讲解傅里叶变换意义时举的实例。
% 首先产生两个时间上可以分开的信号（无噪声），然后在原信号上加上噪声，此时时域已无法观察出信号格式，
% 但通过观察信号的傅里叶变换（频谱）即可清楚观察信号分量。

clear;%清除内存
close all;%关闭所有图形
x=sin(2*pi*(0:199)*0.5/10);%产生某时段的正弦信号
x(201:400)=sin(2*pi*(0:199)*2/10); %产生另一时段的正弦信号
figure;plot(x);grid on;%画图，并打网格
title('时域可分信号','fontsize',14);
ylabel('x(n)','fontsize',14);
xlabel('n','fontsize',14);%标注xy轴坐标

x=x+0.8*randn(1,400);%信号加上噪声
figure;plot(x);grid on; 
title('信号加噪声','fontsize',14); 
ylabel('x(n)','fontsize',14);
xlabel('n','fontsize',14);%标注xy轴坐标

xf=fft(x,512);%求信号频谱
figure;plot((0:255)*10/512,abs(xf(1:256)));grid on;%画图
xlabel('kHz','fontsize',14);ylabel('信号频谱','fontsize',14);%标注xy轴坐标
title('信号频谱','fontsize',14);
