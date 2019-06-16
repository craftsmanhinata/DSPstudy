%本程序用于由FIR数字滤波器的系统函数求系统级联结构。

clc;
clear;
close all;
b=[0.8 2 3.2 1.2]; 
a=1; 
[sos,g]=tf2sos(b,a);