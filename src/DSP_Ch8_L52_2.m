%本程序用于由IIR数字滤波器的系统函数求系统级联结构，并求系统输出。

clc;
clear;
close all;

x=sin(2*pi*(0:199)*2/20)+cos(2*pi*(0:199)*7/20);    %系统输入
b=[0.0940 0.3759 0.5639 0.3759 0.0940];
a=[ 1 0 0.4860 0 0.0177]; 

[sos,g]=tf2sos(b,a);          % 求系统级联结构系数矩阵
y=sosfilt(sos,x);              % 求系统输出

figure;plot(x);
figure;plot(y);
