%����MATLAB�⺯��������޳����Ӧ��IIR���˲�������
%�������ǵ�һ�µ�һ����ɢʱ��ϵͳ�����н����� MATLAB ���ϵͳ�����ʵ����
%���Ȳ������������źţ�����ͨ��һ�������Գ�ϵ����ַ��̱�ʾ�ĵ�ͨ�˲��������޳����Ӧ�˲�����IIR ϵͳ�����۲�ϵͳ�������

clear;%�����ڴ�
close all;
x=sin(2*pi*0.4*(0:127)/10)+sin(2*pi*2.45*(0:127)/10); 
figure;plot(0:127,x);grid on;
xlim([0 127]); 
xlabel('n','fontsize',14);ylabel('x(n)','fontsize',14);
title('ϵͳ�����ź�x(n)','fontsize',14);

B=[0.0223 0.001 0.0223];
A=[1 -1.7007 0.7613];
hf=freqz(B,A,1024);%��Ƶ��
xf=freqz(x,1,1024); 
figure;subplot(2,1,1);
plot((0:1023)*10/2048,20*log10(abs(hf)/max(abs(hf))));
grid on;xlabel('kHz','fontsize',14);ylabel('ϵͳƵ����Ӧ','fontsize',12);
title('ϵͳƵ����Ӧ','fontsize',14);ylim([-50 1]);

subplot(2,1,2);
plot((0:1023)*10/2048,20*log10(abs(xf)/max(abs(xf))));
grid on;xlabel('kHz','fontsize',14);ylabel('�����ź�Ƶ��','fontsize',12);
title('�����źŷ�Ƶ��Ӧ','fontsize',14);ylim([-50 1]);

y=filter(B,A,x);figure;plot(0:127,y);grid on;
xlim([0 127]);grid on;
xlabel('n','fontsize',14);ylabel('y(n)','fontsize',14);
title('ϵͳ���','fontsize',14);