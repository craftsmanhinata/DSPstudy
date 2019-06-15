%本程序利用IIR滤波器产生一个单音信号。
clc;
clear;
close all;

n=1:256;
f0 = 1296;      %产生单音信号的频率
Fs  =  8000;    %采样频率
w0 = 2*pi*f0/Fs;
x=  [1,zeros(1,255)];    %输入单位脉冲
y = zeros(1,256); %初始化输出y(n)
y(1) = 0;y(2) = sin(w0);
for i = 3:256
    y(i) = 2*cos(w0)*y(i-1) - y(i-2) + sin(w0)*x(i-1);
end
plot(n,y,'k','linewidth',2);
xlabel('n');ylabel('h(n)');