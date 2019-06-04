% ����˵��
% ������ı����������ź�֮���Ƶ�ʼ�����۲��źų���ʱ����ź�Ƶ�׵�Ӱ�졣
clear;
close all;

samples=2048;%�źų�������
FFTN=2048;%FFT ����
n=0:samples-1; 
Fs=80;%����Ƶ��(kHz)
f1=20;f2=21;%�ź�Ƶ��(kHz)

x=cos(2*pi*f1/Fs*n)+2*cos(2*pi*f2/Fs*n); 

fx=fft(x,FFTN);%�趨 FFT ����Ϊ FFTN

figure; 
subplot(2,1,1);
plot(x,'LineWidth',1.5);
grid on;
xlabel('n');ylabel('x(n)');title('ʱ����');

subplot(2,1,2);
plot(abs(fx),'LineWidth',1.5);
grid on;
xlabel('k');ylabel('X(k)');title('��Ƶ����');

%Ѱ�ҷ�Ƶ�������ֵ����ʾ
[fz, fn] = max(abs(fx(1:FFTN/2))); 
f=(fn-1)/FFTN*Fs;