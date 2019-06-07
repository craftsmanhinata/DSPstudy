%���FIR�����˲���
%(һ)����˵���������������FIR�����˲�����
clc;
clear;
close all;

wpl=0.2*pi;
wpu=0.55*pi;
wsl=0.28*pi;
wsu=0.5*pi; 

Bt=min(abs(wpl-wsl),abs(wpu-wsu));                  %������ɴ�
N=ceil(12*pi/Bt); %���㲼�ʿ������ĳ���
wd=[0.5*(wpl+wsl),0.5*(wsu+wpu)];      %���������ͨ�˲�����ͨ����ֹƵ��
hn=fir1(N,wd/pi,'stop',blackman(N+1)); %����fir1�������FIR�˲���
hf=fft(hn,512);
WR=20*log10(abs(hf));
ff=unwrap(angle(hf)); 

figure;
stem(hn,'.');
grid on;
xlabel('n');
title('h(n)'); 

figure; 
subplot(2,1,1);plot((0:255)/512,WR(1:256));grid on;xlabel('\omega/\pi');title('20lg|H(\omega)|'); 
subplot(2,1,2);plot((0:255)/512,ff(1:256));grid;xlabel('\omega/\pi');title('\theta(\omega)'); 