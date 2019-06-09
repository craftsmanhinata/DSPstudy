%����������Remez�㷨���41��������λFIR����΢������
%Ҫ��ͨ����ֹƵ��Ϊ0.6�У������ֹƵ��Ϊ0.7�У���ϣ������ƽ��㡣

clc;
clear;
close all;

N=42;
f=[0.0,0.6,0.7,1];
m=[0,1,0,0];
hn=remez(N-1,f,m,'defferetiator'); %����remez�������FIR΢����
hf=fft(hn,512); H=abs(hf); 
P=unwrap(angle(hf)); P=P/pi; 
figure; 
subplot(1,2,1);stem(hn);grid;xlabel('n'); title('h(n)'); 
subplot(1,2,2);plot((0:255)/256,H(1:256));grid;xlabel('\omega/\pi'); title('|H(e^j^\omega)|');