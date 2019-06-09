%设计FIR高通滤波器
%(一)程序说明本程序用于设计FIR高通滤波器。
clc;
clear;
close all;

wp=0.5*pi;        %计算滤波器的通带截止频率
ws=0.45*pi;        %计算滤波器的阻带起始频率
Bt=wp-ws;        %计算过渡带
N=ceil(8*pi/Bt);        %计算汉明窗的长度
wd=0.5*(wp+ws);      %计算理想低通滤波器的通带截止频率
hn=fir1(N,wd/pi,'high'); %调用fir1计算高通FIR滤波器
hf=fft(hn,256);
WR=20*log10(abs(hf));
ff=unwrap(angle(hf)); 
figure;stem(hn,'.');grid;xlabel('n');title('h(n)'); 
figure; 
subplot(2,1,1);plot((0:127)/128,WR(1:128));grid;xlabel('\omega/\pi');title('20lg|H(\omega)|'); 
subplot(2,1,2);plot((0:127)/128,ff(1:128));grid;xlabel('\omega/\pi');title('\theta(\omega)');