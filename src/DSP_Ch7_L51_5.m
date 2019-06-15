%����������˵�������˲����Ĳ���Ƶ�����˲��������Ĺ�ϵ
clc;
clear;
close all;

fsl=600;fpl=1000;fpu=2000;fsu=2300;    
Rp=1;Rs=50;      
%Fs=5000;
Fs=30000;

wsl=2*pi*fsl/Fs;wpl=2*pi*fpl/Fs;
wpu=2*pi*fpu/Fs;wsu=2*pi*fsu/Fs; 

%���IIR�˲���
wp=[wpl/pi,wpu/pi];ws=[wsl/pi,wsu/pi];
[N,Wpo]=ellipord(wp,ws,Rp,Rs);      
[b,a]=ellip(N,Rp,Rs,Wpo);
w=0:0.005*pi:pi;
[h,w]=freqz(b,a,w); 

%���FIR�˲���
B1=wsu-wpu;
B2=wpl-wsl;
B=min(B1,B2); 
NF=ceil(6.6*pi/B);        %��������ƣ����������������
wp1=[(fpl+fsl)/Fs,(fpu+fsu)/Fs];%��ͨ����ʼ�ͽ�ֹƵ��
h1=fir1(NF+1,wp1);
[hf,w]=freqz(h1,1,w);


w=w/pi;
figure;plot(w,20*log10(abs(h)));  xlabel('\omega/\pi');ylabel('���ȣ�dB��'); grid on; 
figure;plot(w,20*log10(abs(hf))); xlabel('\omega/\pi');ylabel('���ȣ�dB��'); grid on; 
