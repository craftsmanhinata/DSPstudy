%���������ڱȽ�IIR��FIR�����˲������ԡ�
clc;
clear;
close all;

fs=2500;fp=2000;
Fs=15000;
Rp=1;Rs=50;
ws=2*fs/Fs;wp=2*fp/Fs; %��Բ��IIR���ֵ�ͨ�˲���
[N,Wpo]=ellipord(wp,ws,Rp,Rs);
[b,a]=ellip(N,Rp,Rs,Wpo);
w=0:0.005*pi:pi;
[h,w]=freqz(b,a,w); 

%������FIR���ֵ�ͨ�˲���
B=ws-wp; NF=ceil(6.6*pi/B);        %��������ƣ����������������
wp1=(fp+fs)/Fs;%��ͨ����ֹƵ��
h1=fir1(NF,wp1);
[hf,w]=freqz(h1,1,w);

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

x=sin(2*pi*(0:500)*2000/Fs)+sin(2*pi*(0:500)*3000/Fs);
yi=filter(b,a,x);
yf=filter(h1,1,x); 
figure(3);
subplot(211);plot(yi);grid on;
subplot(212);plot(yf);grid on;

