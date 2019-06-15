%本程序分别用脉冲响应不变法和双线性变换法设计IIR数字带通滤波器，采用切比雪夫I型低通滤波器原型。
clc;
clear;
close all;

Fs=20000;
fpl=3000;fpu=7000;
fsl=2000;fsu=8500;
Rp=1;Rs=40;      
%双线性变换法
wpl=2*Fs*tan(pi*fpl/Fs);wpu=2*Fs*tan(pi*fpu/Fs); 
wsl=2*Fs*tan(pi*fsl/Fs);wsu=2*Fs*tan(pi*fsu/Fs);    %求模拟滤波器技术指标
wp=[wpl,wpu];ws=[wsl,wsu]; 
[N,Wpo]=cheb1ord(wp,ws,Rp,Rs,'s'); 
[b,a]=cheby1(N,Rp,Wpo,'s'); 
[bz,az]=bilinear(b,a,Fs);           %利用双线性变换法求数字滤波器系统函数
w=0:0.01*pi:pi;
[h,w]=freqz(bz,az,w); 

%脉冲响应不变法
wpl=2*pi*fpl; wpu=2*pi*fpu; wsl=2*pi*fsl;wsu=2*pi*fsu;            %求模拟滤波器技术指标
wp=[wpl,wpu];ws=[wsl,wsu]; 
[N,Wpo]=cheb1ord(wp,ws,Rp,Rs,'s'); 
[b,a]=cheby1(N,Rp,Wpo,'s'); 
[bz,az]=impinvar(b,a,Fs);       %利用脉冲响应不变法求数字滤波器系统函数
w=0:0.01*pi:pi;
[h1,w]=freqz(bz,az,w);

w=w/2/pi/1000*Fs; 
figure;subplot(121);plot(w,20*log10(abs(h)));grid on;
xlabel('kHz');ylabel('幅度(dB)'); 
subplot(122);plot(w,20*log10(abs(h1)));grid on;
xlabel('kHz');ylabel('幅度(dB)')