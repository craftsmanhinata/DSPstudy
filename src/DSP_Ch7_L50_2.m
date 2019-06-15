%��������˫���Ա任�����IIR���ָ�ͨ�˲����������б�ѩ��I�͵�ͨ�˲���ԭ�͡�
%Ҳ���Խ�ģ���˲���ָ��Ԥ�����ֱ�����ģ���ͨ�˲���������˫���Ա任�⺯�������ָ�ͨ�˲�����
clc;
clear;
close all;

Fs=1000;
fp=300;fs=200;
Rp=1;Rs=40;
wp=2*Fs*tan(pi*fp/Fs);ws=2*Fs*tan(pi*fs/Fs); 
[N,Wpo]=cheb1ord(wp,ws,Rp,Rs,'s');      
[b,a]=cheby1(N,Rp,wp,'high','s');
[bz,az]=bilinear(b,a,Fs);
w=0:0.01*pi:pi;
[h,w]=freqz(bz,az,w);  %�������˲�����Ƶ��Ӧ
w=w/pi; 
figure;plot(w,20*log10(abs(h))); xlabel('\omega/\pi');ylabel('���ȣ�dB��'); grid on; 