% �ڲ�ǰ�����е�Ƶ��
% һ������˵�� ����������x(n) 3���ڲ壬�Ƚ��ڲ�ǰ���Ƶ�ס�
close all;
clear;

x=[0:7 8 7:-1:0];%�Ͳ������ʵ�����
I=3;%�ڲ�����
y=zeros(1,I*length(x));
y(1:I:length(y))=x;%�ڲ�������
fx=fft(x,512);%�趨FFT����Ϊ512 
fy=fft(y,512);

figure;plot((0:511)/512*2,20*log10(abs(fx)),'linewidth',2);
xlabel('\omega/\pi','fontsize',12); ylabel('|X(e^{j\omega})|', 'fontsize',12);
grid on; 

figure;plot((0:511)/512*2,20*log10(abs(fy)),'linewidth',2);
xlabel('\omega/\pi','fontsize',12);ylabel('|Y(e^{j\omega})|','fontsize',12);
grid on; 