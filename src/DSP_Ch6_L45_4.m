%���FIR��ͨ�˲���
%(һ)����˵���������������FIR��ͨ�˲�����
clc;
clear;
close all;

wp=0.5*pi;        %�����˲�����ͨ����ֹƵ��
ws=0.45*pi;        %�����˲����������ʼƵ��
Bt=wp-ws;        %������ɴ�
N=ceil(8*pi/Bt);        %���㺺�����ĳ���
wd=0.5*(wp+ws);      %���������ͨ�˲�����ͨ����ֹƵ��
hn=fir1(N,wd/pi,'high'); %����fir1�����ͨFIR�˲���
hf=fft(hn,256);
WR=20*log10(abs(hf));
ff=unwrap(angle(hf)); 
figure;stem(hn,'.');grid;xlabel('n');title('h(n)'); 
figure; 
subplot(2,1,1);plot((0:127)/128,WR(1:128));grid;xlabel('\omega/\pi');title('20lg|H(\omega)|'); 
subplot(2,1,2);plot((0:127)/128,ff(1:128));grid;xlabel('\omega/\pi');title('\theta(\omega)');