%奇对称序列的线性相位特性
%(一)程序说明 本程序用于观察奇对称序列的线性相位特性。

clc;
close all;
clear;

h=[0.7 0.8 0.9 1 1 0 -1 -1 -0.9 -0.8 -0.7];
H = fft(h,1024);
HP = angle(H);
plot((0:1023)/512,HP);
xlabel('Normalized Frequency\pi(rad/sample)');
ylabel('Phase(degrees)');
grid on;
