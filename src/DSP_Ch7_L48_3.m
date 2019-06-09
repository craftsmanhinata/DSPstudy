%���������һ���б�ѩ��II�͸�ͨ�˲���
clc;
clear;
close all;

Wp=2*pi*600;
Ws=2*pi*200;
Rp=3;Rs=25;
wp=1;ws=Ws/Wp;

[N,Wc]=cheb2ord(wp,ws,Rp,Rs,'s');%���һ���б�ѩ��II�͵�ͨ�˲���������3dBƵ��
[z,p,k]=cheb2ap(N,Rs);
[bp,ap]=zp2tf(z,p,k);               %���һ����ͨ�˲���ϵͳ�������ӡ���ĸϵ��
[b,a]=lp2hp(bp,ap,Wp);              %��һ���ͨ�˲���ϵͳ�������ӡ���ĸϵ��
w=0:2*pi*100:2*pi*1000;             %��ģ���ͨ�˲���Ƶ��
[h,w]=freqs(b,a,w);                  %��ģ���ͨ�˲���Ƶ����Ӧh 
wp=0:0.1:6; 
[hp,wp]=freqs(bp,ap,wp);            %���һ����ͨ�˲�����ϵͳ����hp 
w=w/2/pi/1000; 
figure;plot(w,20*log10(abs(h)));grid on;
xlabel('kHz');ylabel('����(dB)');
title('�б�ѩ��II�͸�ͨ�˲����ķ�Ƶ��Ӧ')