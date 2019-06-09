%���������һ���б�ѩ��I�͵�ͨ�˲���
clc;
clear;
close all;

Wp=2*pi*10000;
Ws=2*pi*12000;
Rp=0.2;Rs=50;
wp=1;ws=Ws/Wp;

[N,Wc]=cheb1ord(wp,ws,Rp,Rs,'s');%���һ���б�ѩ��I��ͨ�˲���������0.2dBƵ��
[z,p,k]=cheb1ap(N,Rp); 
[bp,ap]=zp2tf(z,p,k);               %���һ����ͨ�˲���ϵͳ�������ӡ���ĸϵ��
[b,a]=lp2lp(bp,ap,Wp);              %��һ���ͨ�˲���ϵͳ�������ӡ���ĸϵ��
w=0:2*pi*100:2*pi*30000;            %��ģ���ͨ�˲���Ƶ��
[h,w]=freqs(b,a,w);             %��ģ���ͨ�˲���Ƶ����Ӧ
wp=0:0.1:6; 
[hp,wp]=freqs(bp,ap,wp);                %���һ����ͨ�˲�����ϵͳ����hp
w=w/2/pi/1000; 
figure;plot(w,20*log10(abs(h)));grid on;
xlabel('kHz');ylabel('����(dB)');
title('�б�ѩ��I�͵�ͨ�˲����ķ�Ƶ��Ӧ')