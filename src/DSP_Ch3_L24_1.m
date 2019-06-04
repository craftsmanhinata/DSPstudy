%һ������˵��  ���������ڹ��������ࣩ���źŵ�Ƶ�ʣ�������������֪Ƶ�ʵĴ��ȡֵ��
clear;
close all;

samples=90;FFTN=2048;%�źų���������FFT����
n=0:samples-1; 
Fs=100;%����Ƶ��(kHz)
f1=20.1;f2=21.5;%�ź�Ƶ��(kHz)
x=cos(2*pi*f1/Fs*n)+2*cos(2*pi*f2/Fs*n); 
fx=fft(x,FFTN);%�趨FFT����ΪFFTN
df=0.5;%Ƶ��������Χ-df-df
dk=floor(df/Fs*FFTN);%��֮��Ӧ��k 
k1=floor(f1/Fs*FFTN);
k2=floor(f2/Fs*FFTN); 
[m,n]=max(abs(fx(k1-dk:k1+dk)));[n+k1-dk-2 (n+k1-dk-2)/FFTN*Fs] 
[m,n]=max(abs(fx(k2-dk:k2+dk)));[n+k2-dk-2 (n+k2-dk-2)/FFTN*Fs] 
figure; plot((0:FFTN-1)/FFTN*Fs,20*log10((abs((fx(1:FFTN))))),'b','LineWidth',2);
grid on; xlabel('kHz','fontsize',12);ylabel('|X(e^j\omega)|','fontsize',12);
%axis([0 50 -10 40]);