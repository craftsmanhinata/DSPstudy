%����Ҷ�任ʱ�����
%�������ǽ���ڶ��µڶ�����ɢʱ���źŸ���Ҷ�任���ʵ�ʵ������ wave �ļ���ȡһ������
%�źţ��������Ƶ���ԣ�Ȼ����� DSB�������ز�˫�ߴ����ƣ����ƣ����� cos���� 8kHz���ٹ�
%�����Ƶ���ԡ�

clear;%����ڴ�
close all;%�ر�����ͼ��
clear sound;
filename1='canon.wav';
info = audioinfo(filename1);

[s1,fs]=audioread(filename1);%��ȡ�����źţ�����Ƶ��Ϊfs
fs=fs/1000;%����Ƶ�ʵ�λΪkHz
s=s1';
x=s;

t1 = info.TotalSamples / 2;
t2 = info.TotalSamples;

xf=20*log10(abs(fft(x,t2)));%��ʵ�źŵ�Ƶ��
xf1(1:t1)=xf((t1+1):t2);
xf1((t1+1):t2)=xf(1:t1);
figure;plot((-t1:(t1-1))*fs/t2,xf1);grid on;
ylabel('ʵ�ź�Ƶ��','fontsize',12);xlabel('kHz','fontsize',14);%��עxy������
title('ʵ�źŷ�Ƶ����','fontsize',14); %xlim([-16 16]);

%y=x.*cos(2*pi*11/fs*(0:(t2-1)));%DSB����
y=x.*exp(2*1i*pi*0*fs/fs*(0:(t2-1)));%Ƶ�װ���
y1 = abs(y);
sound(x,fs*1000);

yf=20*log10(abs(fft(y,t2)));%���źŵ�Ƶ��
yf1(1:t1)=yf((t1+1):t2);
yf1((t1+1):t2)=yf(1:t1);
figure;plot((-t1:(t1-1))*fs/t2,yf1);grid on;
ylabel('�����ź�Ƶ��','fontsize',12);xlabel('kHz','fontsize',14);%��עxy������
title('�����źŷ�Ƶ����','fontsize',14); %xlim([-16 16]);