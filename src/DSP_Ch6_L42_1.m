% 比较FIR滤波器和IIR滤波器的相位
% (一)程序说明 本程序用于比较FIR滤波器和IIR滤波器的相位，以及滤波后的输出信号延时情况。
clc;
close all;
clear;

n=0:250; %设定信号长度
x = cos(0.2*pi*n)+cos(0.3*pi*n); %产生信号
x1 = cos(0.2*pi*n)+cos(0.5*pi*n); %产生信号

%用窗化法设计FIR滤波器
h1 = fir1(30,0.4,'low',hamming(31));%窗化法设计FIR滤波器
H1 = 20*log10(abs(fft(h1,1024)))/max(abs(fft(h1,1024))); 
figure(1); 
subplot(2,1,1);
plot((0:511)/512,H1(1:512),'LineWidth',2);
xlabel('Normalized Frequency\pi(rad/sample)');
ylabel('Magnitude(dB)'); 
grid on;
title('30(N=31)阶FIR滤波器');

subplot(2,1,2) 
H11 = fft(h1,1024); 
plot((0:511)/512,phase(H11(1:512)),'LineWidth',2); 
xlabel('Normalized Frequency\pi(rad/sample)'); 
ylabel('Phase(degrees)');
grid on;

%用切比雪夫II设计IIR滤波器
Wp = 0.3;
Ws = 0.5;
Rp=1;
Rs = 40; %输入指标
[N,Wso] = cheb2ord(Wp,Ws,Rp,Rs,'s');%求滤波器的阶次
[B,A] = cheby2(N,Rs,Wso);% 设计滤波器，得出系数

figure(2); 
freqz(B,A);%无左端变量时自动画频率特性图
title('6阶切比雪夫II型滤波器'); 

yIIR = filter(B,A,x); 
yFIR = conv(x,h1); 

figure(3); 
subplot(3,1,1); 
plot(x,'LineWidth',2); 
ylabel('x(n)');
xlabel('n');
title('x(n) = cos(0.2*pi*n)+cos(0.3*pi*n)'); 

subplot(3,1,2);
plot(yIIR,'LineWidth',2); 
ylabel('yIIR(n)');
xlabel('n'); 

subplot(3,1,3); 
plot(yFIR,'LineWidth',2); 
ylabel('yFIR(n)');
xlabel('n'); 
yIIR = filter(B,A,x1); 
yFIR = conv(x1,h1); 

figure(4); 
subplot(3,1,1) 
plot(x1,'LineWidth',2); 
ylabel('x(n)');
xlabel('n');
title('x(n) = cos(0.2*pi*n)+cos(0.5*pi*n)'); 

subplot(3,1,2); 
plot(yIIR,'LineWidth',2); 
ylabel('yIIR(n)');
xlabel('n'); 

subplot(3,1,3);
plot(yFIR,'LineWidth',2);
ylabel('yFIR(n)');
xlabel('n'); 