%һ������˵��  ������ı����������ź�֮���Ƶ�ʼ�����۲��źų���ʱ����ź�Ƶ�׵�Ӱ�졣
close all;
clear;
samples=100;FFTN=1024;%�źų���������FFT����
n=0:samples-1; 
Fs=100;%����Ƶ��(kHz)
f1=10;f2=30;%�ź�Ƶ��(kHz)
x=cos(2*pi*f1/Fs*n)+cos(2*pi*f2/Fs*n); 
fx=fft(x,FFTN);%�趨FFT����ΪFFTN
figure; plot((0:FFTN/2-1)/FFTN*Fs,20*log10(abs((fx(1:FFTN/2)))),'LineWidth',2);
grid on; xlabel('kHz','fontsize',12);ylabel('|X(e^j\omega)|','fontsize',12);
axis([0 50 -10 35]); 