% 复信号的频谱
% (一)程序说明 本程序用于演示复信号的频谱的构成。

clc;
clear;
close all;

N=200; %信号长度
M=2048;%fft点数
at(1:N)=0; 
at(1:8)=[1,2,3,4,4,3,2,1];%exp(-0.15*(0:N-1))
x=at.*sin(2*pi*(0:N-1)*0.25);% 信号实部
y=-at.*cos(2*pi*(0:N-1)*0.25);% 信号虚部

z=x+1i*y; %复信号

xf=abs(fft(x,M));%实部的幅度谱
zf=abs(fft(z,M));%复信号的幅度谱
yf1=abs(fft(y,M));%虚部的幅度谱

yf(1:M/2)=-yf1(1:M/2);
yf(M/2+1:M)=yf1(M/2+1:M);%带j虚部的幅度谱

a=(0:M-1)/M*2; %绘图

figure;
subplot(2,1,1),plot(a,(xf),'b','linewidth',2);
grid on;
xlabel('\omega/\pi');
ylabel('X( e^{j\omega})');
subplot(2,1,2),plot(a,(yf),'b','linewidth',2);
grid on; 
xlabel('\omega/\pi');
ylabel('X_1(e^{j\omega})'); 

figure;
plot(a,(zf),'b','linewidth',2);
grid on; 
xlabel('\omega/\pi');
ylabel('Z(e^{j\omega})');