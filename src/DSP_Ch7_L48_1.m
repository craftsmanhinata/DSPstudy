%������������ư�����˹��ģ���ͨ�˲�����ָ�����£�
% fp=5kHz, fs=10kHz 
% ��p=3dB, ��s=3dB
clc;
clear;
close all;

Wp=2*pi*5000;
Ws=2*pi*10000;
Rp=3;Rs=30; 

wp=1;
ws=Ws/Wp; %��һ��

[N,Wc]=buttord(wp,ws,Rp,Rs,'s'); %���һ��������˼��ͨ�˲���������3dBƵ��
[z,p,k]=buttap(N); 
[bp,ap]=zp2tf(z,p,k);          %���һ����ͨ�˲���ϵͳ�������ӡ���ĸϵ��
[b,a]=lp2lp(bp,ap,Wp);         %��һ���ͨ�˲���ϵͳ�������ӡ���ĸϵ��
w=0:2*pi*100:2*pi*30000;      %��ģ���ͨ�˲���Ƶ��
[h,w]=freqs(b,a,w);             %��ģ���ͨ�˲���Ƶ����Ӧ
wp=0:0.1:6;                       %���һ����ͨ�˲���Ƶ��
[hp,wp]=freqs(bp,ap,wp);       %��ģ���ͨ�˲���Ƶ����Ӧ
w=w/2/pi/1000; 
figure;
plot(w,20*log10(abs(h)));grid on;xlabel('kHz');ylabel('����(dB)');
title('������˼��ͨ�˲����ķ�Ƶ��Ӧ');