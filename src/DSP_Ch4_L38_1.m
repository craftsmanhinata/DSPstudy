% 用CZT变换观察滤波器零点特性
% 一、案例背景：当输入信号点数有限或较少时，若希望提高频谱分辨率（增加频率分点，细化频谱），则需要补零，结果计算量也增加了;
% 对于窄带信号，我们只希望通带内频率分点密，带外可以较疏，或根本不用计算。
% 二、原理描述：Z变换采用螺旋线取样是一种适合以上需要的变换，且可以采用FFT来快速计算，
% 这种变换也称做调频Z变换-Chirp-Z变换或CZT，它是适用于更一般情况由x(n)求X(zk)的快速算法。
% 三、案例描述：某一低通滤波器的零、极点分布如图所示，利用Chirp-Z变换观察滤波器零点特性。（极点半径1.2）

close all;
clear;

fs=2000; 
fp=150; 
p1=0.9*exp(-1i*2*pi*fp/fs); 
p2=p1';
p=[p1,p2]'; 

fz1=500; 
fz2=300; 
z1=1.2*exp(-1i*2*pi*fz1/fs);z2=z1'; 
z3=1.2*exp(-1i*2*pi*fz2/fs);z4=z3'; 
z=[z1,z2,z3,z4]';

[b,a]=zp2tf(z,p,1); 
ww=0:0.005*pi:2*pi; 
h1=freqz(b,a,ww); 
hn1=ifft(h1);
hn=real(hn1); 
N=length(ww); 

f2=700;
f1=50;
M=201;
W=exp(-1i*2*pi*(f2-f1)/(M*fs)); 
A=1.20*exp(1i*2*pi*f1/fs); 
yzz=czt(hn,M,W,A); 

subplot(1,2,1);
plot(ww*fs/(2*pi),20*log10(abs(h1)));
grid on;
title('低通滤波器的幅频响应');
ylabel('|H(e^j^\omega)|db');
axis([0 1000 -10 30]);

subplot(1,2,2); 
plot(20*log10(abs(yzz)));
grid on;
title('CZT的幅频响应'); 
ylabel('db');
axis([0 201 -40 20]);