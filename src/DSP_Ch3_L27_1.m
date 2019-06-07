% ��ȡǰ�����е�Ƶ��
%һ������˵�� ����������x(n) 3����ȡ���Ƚϳ�ȡǰ���Ƶ���Լ��˲��Գ�ȡ��Ӱ�졣
close all;
clear;

x=[0:7 8 7:-1:0];%�߲������ʵ�����
D=3;%��ȡ����
b=1/D*ones(1,D);%��ͨ�˲���
x1=conv(b,x);
x2=conv(b,x1);
x3=conv(b,x2);
x4=conv(b,x3);
x5=conv(b,x4);
y=x(1:D:length(x));%δ�˲�����ȡ
y1=x5(1:D:length(x5));%�˲��ٳ�ȡ
fx=fft(x,512);
fy=fft(y,512);
fy1=fft(y1,512);
figure;
plot((0:511)/512*2,20*log10(abs(fx)),'linewidth',2);
xlabel('\omega/\pi','fontsize',12); 
ylabel('|X(e^{j\omega})|', 'fontsize',12);
grid on; 

figure;
plot((0:511)/512*2,20*log10(abs(fy)),' b:', (0:511)/512*2,20*log10(abs(fy1)),'b'   ); 
xlabel('\omega/\pi','fontsize',12);
ylabel('|Y(e^{j\omega})|','fontsize',12);
grid on; 
title('�˲��Գ�ȡ��Ӱ��','fontsize',12);
legend('δ�˲�','�˲���', 'fontsize',12);