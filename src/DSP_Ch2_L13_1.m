%��������ʱ�������ڲ��㣬Ƶ��ѹ��
%һ������˵�����������ǽ���ǰ����С��ʱ��ʵ����
%��ԭ�ź�����֮���ڲ��㣬�൱�ڽ�ԭ�ź�Ƶ����ʧ��ѹ����
clear;
close all; 
x=[1 2 3 4 5 6 7 6 5 4 3 2 1];
y(1:3:13*3)=x;%���ź�ÿ������֮���2����
figure;
subplot(2,1,1),stem(0:12,x);grid on;
xlabel('n','fontsize',14);ylabel('x(n)','fontsize',14);
subplot(2,1,2),stem(0:12*3,y);grid on;
xlim([0 12*3]);
xlabel('n','fontsize',14);ylabel('y(n)','fontsize',14);

xf=fft(x,1024);%���ź�Ƶ��
yf=fft(y,1024);
figure;
subplot(2,1,1),plot((0:1023)/512,abs(xf));
grid on; xlabel('\omega/\pi'  ,'fontsize',14);ylabel('����(dB)','fontsize',14);            
title('ԭ�ź�Ƶ��','fontsize',12);
subplot(2,1,2),plot((0:1023)/512,abs(yf));
grid on;title('�����м��ڲ���֮���Ƶ��','fontsize',12);
xlabel('\omega/\pi'  ,'fontsize',14);ylabel('����(dB)','fontsize',14);