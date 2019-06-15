%利用MATLAB的脉冲响应不变法库函数设计IIR数字低通滤波器。
%技术指标如下：1）通带截止频率Ωp=4000π rad/s，阻带起始频率Ωs=8000π rad/s
%通带最大衰减αp=3dB，阻带最小衰减αs=30dB
%T=0.1ms，T=0.05ms

clc;
clear;
close all; 
f1=10000;f2=20000;
Wp=4000*pi;Ws=8000*pi;Rp=3;Rs=30; %模拟滤波器技术指标
[N,Wc]=buttord(Wp,Ws,Rp,Rs,'s'); 
[b,a]=butter(N,Wc,'s'); 
[bz,az]=impinvar(b,a,f1);%利用脉冲响应不变法求数字滤波器系统函数
[bz1,az1]=impinvar(b,a,f2); 

w=0:0.01*pi:pi;
[h,w]=freqz(bz,az,w);
[h1,w]=freqz(bz1,az1,w);
w=w/pi;
figure; 
plot(w,20*log10(abs(h)),'-.',w,20*log10(abs(h1)),'-','LineWidth',1.5); 
legend('T=0.1ms','T=0.05ms'); 
xlabel('\omega/\pi');ylabel('幅度（dB）');title('数字滤波器幅频响应');grid on;