% 正交移相器
%(一)程序说明 本程序主要用于窗化法设计FIR正交移相器
clc;
clear;
close all; 

N = 91;    % 滤波器的长度
M = (N-1)/2; 
n = -M:2:M; %n的取值
h(1:N) = 0; 
h(1:2:end) = 2./(pi*n);% n为偶数时h(n)的值，n为奇数时h(n)=0 
fh=fft(h,512); 
figure; 
plot((0:255)/512*2,20*log10(abs(fh(1:256))),'linewidth',1.5);
grid on; 
xlabel('\omega/\pi');
ylabel('|H(e^{j\omega})|(dB)');
title('90阶正交FIR移相器幅频特性'); 

figure; 
plot((0:255)/512*2,unwrap(angle(fh(1:256)))/pi*180,'linewidth',1.5);
grid on; 
xlabel('\omega/\pi');
ylabel('Arg(e^{j\omega})');
title('90阶正交FIR移相器相频响应');