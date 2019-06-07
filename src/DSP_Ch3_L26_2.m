% ����Ƶ����Ƶ�׻��
% һ������˵�����������Ƶ200kHz������6 kHz���ź��ò�ͬ����Ƶ�ʲ����󣬽���Ƶ�׷������۲�Ƶ�׻������
% ���������嵥
close all;
clear;
samples=256;FFTN=1024;%�źų���������FFT����
n=0:samples-1; 
Fs=1015;%����Ƶ��(kHz)
f1=200;f=3;%�ź�Ƶ��(kHz)
x=(1+0.3*sin(2*pi*f/Fs*n)+0.3*sin(2*pi*1/Fs*n)+0.3*sin(2*pi*2/Fs*n)).*sin(2*pi*f1/Fs*n)+ 0.1*randn(1,samples); %���һ�����Ӹ�˹������
fx=fft(x,FFTN);%�趨FFT����ΪFFTN
figure;
plot((0:FFTN-1)/FFTN*Fs,20*log10(abs(fx)),'LineWidth',2);
grid on;
xlabel('kHz','fontsize',12);ylabel('|X(e^j\omega)|','fontsize',12); 