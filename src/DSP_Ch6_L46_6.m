%本程序利用Remez交替算法，设计一个线性相位低通FIR数字滤波器
clc;
clear;
close all;
fp=800;fs=1000;   %设置滤波器参数
Fs=4000;            %设置采样频率
alphap=0.5;alphas=40;     %设置滤波器参数
f=[fp,fs];            
m=[1 0]; 
delta1=(10^(alphap/20)-1)/(10^(alphap/20)+1); % 求通带波纹幅度delta1
delta2=10^(-alphas/20);    %    求阻带波纹幅度delta2
delta=[delta1,delta2];
[N,fpts,mag,wt]=remezord(f,m,delta,Fs);    %    用remezord求参数
hn=remez(N,fpts,mag,wt);      %      用remez求滤波器的脉冲响应h(n)
[H,w]=freqz(hn,1,512);    %    用freqz求频率响应H
plot(w*2000/pi,20*log10(abs(H)));
grid; xlabel('Frequency/Hz'); ylabel('Amplitude/dB');