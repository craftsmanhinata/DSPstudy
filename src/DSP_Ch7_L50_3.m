%��������˫���Ա任�����IIR���ָ�ͨ�˲����������б�ѩ��I�͵�ͨ�˲���ԭ�͡�
%ֱ����MATLAB�⺯����˫���Ա任����������˲���
clc;
clear;
close all;

Fs=1000;
fp=300;fs=200; 
wpz=2*fp/Fs;wsz=2*fs/Fs; 
Rp=1;Rs=40;    %�������˲�������ָ��
[N,Wpo]=cheb1ord(wpz,wsz,Rp,Rs);   %���˲���������ͨ����ֹƵ��
[bz,az]=cheby1(N,Rp,Wpo,'high'); %����˫���Ա任���������˲���ϵͳ����
w=0:0.01*pi:pi;
[h,w]=freqz(bz,az,w); %�������˲�����Ƶ��Ӧ

w=w/pi; 
figure;plot(w,20*log10(abs(h))); xlabel('\omega/\pi');ylabel('���ȣ�dB��'); grid on; 