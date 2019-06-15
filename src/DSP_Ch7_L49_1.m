%本程序用脉冲响应不变法设计IIR数字低通滤波器，
%指标如下：1）通带截止频率0.1π rad，
%阻带起始频率0.2π rad，
%通带最大衰减αp=3dB，阻带最小衰减αs=30dB
%T=0.01s，T=0.5s

clc; 
clear;
close all;

T=0.01; 
Wp=0.1*pi/T;Ws=0.2*pi/T;Rp=3;Rs=30; %求模拟滤波器技术指标
[N,Wc]=buttord(Wp,Ws,Rp,Rs,'s');
[b,a]=butter(N,Wc,'s');
[bz,az]=impinvar(b,a,1/T);    %利用脉冲响应不变法求数字滤波器系统函数

T1=0.5; 
Wp=0.1*pi/T1;Ws=0.2*pi/T1;Rp=3;Rs=30; 
[N,Wc]=buttord(Wp,Ws,Rp,Rs,'s'); 
[b1,a1]=butter(N,Wc,'s'); 
[bz1,az1]=impinvar(b1,a1,1/T1);

w=0:0.01*pi:pi;
[h,w]=freqz(bz,az,w);
[h1,w]=freqz(bz1,az1,w);
w=w/pi;
figure; plot(w,20*log10(abs(h)),'LineWidth',1.5); hold on;
plot(w,20*log10(abs(h1)),'k--','LineWidth',1.5); 
xlabel('\omega/\pi');ylabel('幅度（dB）');title('数字滤波器幅频响应');grid on;

w = 0:0.1:1/T;     
[h2,w] = freqs(b,a,w); 
figure; plot(w,20*log10(abs(h2)/max(abs(h2))),'LineWidth',1.5); 
xlabel('Hz');ylabel('幅度（dB）');title('T=0.01s模拟滤波器幅频响应');grid on;

w = 0:0.1:1/T1;     
[h2,w] = freqs(b1,a1,w); 
figure; plot(w,20*log10(abs(h2)/max(abs(h2))),'LineWidth',1.5); 
xlabel('Hz');ylabel('幅度（dB）');title('T=0.5s模拟滤波器幅频响应');grid on