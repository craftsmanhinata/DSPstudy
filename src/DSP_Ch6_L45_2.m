%���FIR��ͨ�˲���
%(һ)����˵���������������FIR��ͨ�˲�����
clc;
clear;
close all;

Fs=40000;fpl=2000;fpu=10000;fsl=1500;fsu=11500;alphas=45;    %�����˲����Ĳ���
wpl=2*pi*fpl/Fs;
wpu=2*pi*fpu/Fs;
wsl=2*pi*fsl/Fs;
wsu=2*pi*fsu/Fs; 
Bt=min(abs(wpl-wsl),abs(wpu-wsu));                  %������ɴ�
N=ceil(8*pi/Bt); %���㺺�����ĳ���
wd=[0.5*(wpl+wsl),0.5*(wsu+wpu)];      %���������ͨ�˲�����ͨ����ֹƵ��
hn=fir1(N-1,wd/pi); %����fir1�����ͨFIR�˲���
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
subplot(2,1,2);plot((0:255)/512,ff(1:256));grid on;xlabel('\omega/\pi');title('\theta(\omega)');
