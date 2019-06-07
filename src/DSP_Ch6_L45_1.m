%凯赛窗设计FIR低通滤波器
%(一)程序说明本程序利用凯塞窗函数设计FIR低通滤波器。

clc;
clear;
close all;

N1=256;                        %信号的采样点数
n=0:N1-1; Fs=10000;f1=1500;f2=2500;alphas=40;    %设置滤波器的参数
wp=2*pi*f1/Fs;        %计算滤波器的通带截止频率
ws=2*pi*f2/Fs;        %计算滤波器的阻带起始频率
beta=0.5842*(alphas-21)^0.4+0.07886*(alphas-21); %计算凯塞窗的控制参数
Bt=ws-wp;         %计算过渡带
N=ceil((alphas-8)/(2.285*Bt)); %计算凯塞窗的长度
wd=0.5*(wp+ws);      %计算理想低通滤波器的通带截止频率
hn=fir1(N-1,wd/pi,kaiser(N,beta)); %调用fir1计算低通FIR滤波器
x=cos(2*pi*f1/Fs*n)+cos(2*pi*f2/Fs*n);%模拟信号采样得到的数字信号
y=conv(x,hn);          %对信号进行滤波

M=512;                        %设置DFT的点数
X=20*log10(abs(fft(x,M))/max(abs(fft(x,M))));    %计算原信号的幅频特性
H=20*log10(abs(fft(hn,M))/max(abs(fft(hn,M))));%计算滤波器的幅频特性
Y=20*log10(abs(fft(y,M))/max(abs(fft(y,M))));    %计算滤波后的幅频特性

figure(1);
subplot(1,2,1);
plot((0:M/2-1)/M,X(1:M/2),'--',(0:M/2-1)/M,H(1:M/2));
grid on; 
legend('原信号幅频特性','滤波器幅频特性'); 
xlabel('\omega/\pi');ylabel('幅频特性'); 

subplot(1,2,2);
plot((0:M/2-1)/M,Y(1:M/2));
grid on;
xlabel('\omega/\pi');ylabel('滤波后信号的幅频特性');
