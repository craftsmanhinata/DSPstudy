%��������˫���Ա任�����IIR���ִ�ͨ�˲����������б�ѩ��II�͵�ͨ�˲���ԭ�͡�
%ֱ����MATLAB�⺯����˫���Ա任����������˲���
clc;
clear;
close all;

Fs=20000;
fpl=2000;fpu=5000;
fsl=1500;fsu=5600;  
Rp=1;Rs=40;
wpz=[2*fpl/Fs,2*fpu/Fs];
wsz=[2*fsl/Fs,2*fsu/Fs];
[N1,Wso]=cheb2ord(wpz,wsz,Rp,Rs);
[bz1,az1]=cheby2(N1,Rs,Wso);
w=0:0.01*pi:pi;
[h1,w]=freqz(bz1,az1,w);

w=w/pi;
figure;plot(w,20*log10(abs(h1))); xlabel('\omega/\pi');ylabel('���ȣ�dB��'); grid on; 
set(gca,'YLim',[-100 0]);