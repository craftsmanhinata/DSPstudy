%本程序用于由IIR数字滤波器的系统函数求系统的零极点分布图、频率响应和单位脉冲响应。
clc;
clear;
close all;

clc;
clear;
close all;

sos=[1 -exp(1i*pi/3) 0.25*exp(1i*2*pi/3) 1 0 -0.81;1 -exp(-1i*pi/3) 0.25*exp(-1i*2*pi/3) 1 0 0];
[b,a]=sos2tf(sos);
[z,p,k]=tf2zp(b,a); %这里出错，原因不明
w=0:0.001*pi:pi; 
[H,w]=freqz(b,a,w);%求频率响应
h=impz(b,a);        %求单位冲击响应

figure;plot(abs(H));
figure;plot(abs(h));