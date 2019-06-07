%FIR��ͨ�˲���
%(һ)����˵�� ��������Ҫ����MATLAB�Դ����������FIR��ͨ�˲�����
clc;
clear;
close all;

wp=0.5*pi;        %�����˲�����ͨ����ֹƵ��
ws=0.6*pi;        %�����˲����������ʼƵ��
%alphas>=20;     %���˥��20,��ѡ����δ�
Bt=ws-wp;         %������ɴ�
N=ceil(4*pi/Bt);        %������δ��ĳ���
wd=0.5*(wp+ws);      %���������ͨ�˲�����ͨ����ֹƵ��

hn=fir1(N-1,wd/pi,rectwin(N)); %����fir1�����ͨFIR�˲���
hf=fft(hn,256);
WR=20*log10(abs(hf));
ff=unwrap(angle(hf)); 
figure;
stem(hn,'.');
grid on;
xlabel('n');
title('h(n)'); 

figure; 
subplot(2,1,1);
plot((0:127)/128,WR(1:128));
grid;
xlabel('\omega/\pi');
title('20lg|H(\omega)|'); 
subplot(2,1,2);
plot((0:127)/128,ff(1:128));
grid on;
xlabel('\omega/\pi');
title('\theta(\omega)');