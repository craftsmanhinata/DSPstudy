%本程序比较不同的采样间隔，用脉冲响应不变法将模拟滤波器转换为数字滤波器后的幅频响应。
%已知模拟滤波器的系统函数
clc;
clear;
close all;

T=0.5;
T1=0.05; 
b=[0 0 3];
a=[1 4 3];
[bz,az]=impinvar(b,a,1/T); %利用脉冲响应不变法求数字滤波器的系统函数
[bz1,az1]=impinvar(b,a,1/T1); 
w=0:0.01*pi:pi; 
[h,w] = freqz(bz,az,w); %求数字滤波器的频率响应
[h1,w] = freqz(bz1,az1,w); 

w=w/pi; 
figure; 
plot(w,20*log10(abs(h)),'-',w,20*log10(abs(h1)),'k--','LineWidth',2); 
legend('T=0.5s','T=0.05s'); 
xlabel('\omega/\pi');ylabel('幅度（dB）');title('数字滤波器幅频响应');grid on;