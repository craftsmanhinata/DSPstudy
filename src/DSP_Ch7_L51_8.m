%���������ڱȽ�IIR��FIR�����˲������ԡ��ֱ����һ��IIR��FIR���ִ�ͨ�˲���.
clc;
clear;
close all;

n=1:256;
fsl=10000;fpl=11000;fpu=20000;fsu=21000;
Fs=50000;
Rp=1;Rs=50;
wsl=2*pi*fsl/Fs;wpl=2*pi*fpl/Fs;
wpu=2*pi*fpu/Fs;wsu=2*pi*fsu/Fs;
wp=[wpl/pi,wpu/pi];ws=[wsl/pi,wsu/pi];
[N,Wpo]=ellipord(wp,ws,Rp,Rs); %��ģ���ͨ�˲���������ͨ����ֹƵ��
[b,a]=ellip(N,Rp,Rs,Wpo); %��˫���Ա任����Բ��ͨ�����˲���
w=0:0.005*pi:pi;
[h,w]=freqz(b,a,w); %��IIR���ִ�ͨ�˲����ķ�Ƶ��Ӧ

B1=wsu-wpu;B2=wpl-wsl; B=min(B1,B2); %ѡȡ��խ�Ĺ��ɴ�
NF=ceil(6.6*pi/B);    %�󴰻�����ƣ���������FIR�������
wp1=[(fpl+fsl)/Fs,(fpu+fsu)/Fs];    %��FIRͨ����ʼ�ͽ�ֹƵ��
h1=fir1(NF-1,wp1); %���������FIR���ִ�ͨ�˲���
[hf,w]=freqz(h1,1,w); %��FIR���ִ�ͨ�˲����ķ�Ƶ��Ӧ

x=sin(2*pi*(1:256)*12000/Fs);      %�����ź�
yi=filter(b,a,x); 
yf=filter(h1,1,x); %��ϵͳ���

figure(1);
subplot(211);plot(w,20*log10(abs(h)),'linewidth',2);grid on;
xlabel('kHz');ylabel('����(dB)'); 
subplot(212);plot(w,unwrap(angle(h)),'linewidth',2);grid on;
xlabel('kHz');ylabel('��λ(rad/s)');
figure(2);
subplot(211);plot(w,20*log10(abs(hf)),'linewidth',2);grid on;
xlabel('kHz');ylabel('����(dB)'); 
subplot(212);plot(w,unwrap(angle(hf)),'linewidth',2);grid on;
xlabel('kHz');ylabel('��λ(rad/s)'); 
figure(3);
subplot(211);plot(yi);grid on;
subplot(212);plot(yf);grid on;

