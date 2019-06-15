%本程序用于比较IIR和FIR数字滤波器特性。分别设计一个IIR和FIR数字带通滤波器.
clc;
clear;
close all;

n=1:256;
fsl=10000;fpl=11000;fpu=20000;fsu=21000;
Fs=50000;
Rp=1;Rs=50;
wsl=2*pi*fsl/Fs;wpl=2*pi*fpl/Fs;
wpu=2*pi*fpu/Fs;wsu=2*pi*fsu/Fs;
wp=[wpl/pi,wpu/pi];ws=[wsl/pi,wsu/pi];
[N,Wpo]=ellipord(wp,ws,Rp,Rs); %求模拟带通滤波器阶数和通带截止频率
[b,a]=ellip(N,Rp,Rs,Wpo); %用双线性变换求椭圆带通数字滤波器
w=0:0.005*pi:pi;
[h,w]=freqz(b,a,w); %求IIR数字带通滤波器的幅频响应

B1=wsu-wpu;B2=wpl-wsl; B=min(B1,B2); %选取最窄的过渡带
NF=ceil(6.6*pi/B);    %求窗化法设计（哈明窗）FIR所需阶数
wp1=[(fpl+fsl)/Fs,(fpu+fsu)/Fs];    %求FIR通带起始和截止频率
h1=fir1(NF-1,wp1); %窗化法设计FIR数字带通滤波器
[hf,w]=freqz(h1,1,w); %求FIR数字带通滤波器的幅频响应

x=sin(2*pi*(1:256)*12000/Fs);      %输入信号
yi=filter(b,a,x); 
yf=filter(h1,1,x); %求系统输出

figure(1);
subplot(211);plot(w,20*log10(abs(h)),'linewidth',2);grid on;
xlabel('kHz');ylabel('幅度(dB)'); 
subplot(212);plot(w,unwrap(angle(h)),'linewidth',2);grid on;
xlabel('kHz');ylabel('相位(rad/s)');
figure(2);
subplot(211);plot(w,20*log10(abs(hf)),'linewidth',2);grid on;
xlabel('kHz');ylabel('幅度(dB)'); 
subplot(212);plot(w,unwrap(angle(hf)),'linewidth',2);grid on;
xlabel('kHz');ylabel('相位(rad/s)'); 
figure(3);
subplot(211);plot(yi);grid on;
subplot(212);plot(yf);grid on;

