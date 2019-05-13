%�������ƣ�����MATLAB�⺯��������޳����Ӧ�˲��������
%һ���������������޳����Ӧ��FIR���˲�����������ʱ����ϵͳ���������ص���Ƶ����Ӧ�߱�������λ��
%���FIR�˲������ź��˲��еõ��˹㷺��Ӧ�á�
%����ԭ�����������FIR�˲����������������MATLAB�⺯���еľ������conv��
%����ʵ�����������������ڽ����һ�µ�һ����ɢʱ��ϵͳ�����н���LTIϵͳ�������֮��Ĺ�ϵʱ���ܵġ�
%���Ȳ���һ�������źţ�����ͨ��һ��FIR��ͨ�˲������۲�ϵͳ�������
%��β������������źţ�һ��Ƶ����ϵͳ��ͨ���ڣ�һ���źŵ�Ƶ����ϵͳ������۲�ϵͳ�����

clear;%�����ڴ�
close all   ;%�ر�����ͼ��
x=sin(2*pi*0.4*(0:127)/10);%�������ز������ź�
figure;plot(0:127,x);xlim([0 127]);grid on; 
xlabel('n','fontsize',14);ylabel('x(n)','fontsize',14);
title('ϵͳ�����ź�x(n)','fontsize',14);

h(1:10)=(1:10);
h(11)=11;
h(12:21)=(10:-1:1);%����ϵͳ��λ��������
figure;plot(0:20,h);ylim([0 11]);grid on; 
xlabel('n','fontsize',14);ylabel('h(n)','fontsize',14);
title('ϵͳ��λ������Ӧh(n)','fontsize',14);

hf=freqz(h,1,1024);%��ϵͳƵ����Ӧ
xf=freqz(x,1,1024);%�������ź�Ƶ��
figure;
subplot(2,1,1);plot((0:1023)*10/2048,20*log10(abs(hf)/max(abs(hf))));grid on; 
xlabel('kHz','fontsize',14);ylabel('ϵͳƵ����Ӧ','fontsize',12);
title('ϵͳƵ����Ӧ','fontsize',14);

subplot(2,1,2),plot((0:1023)*10/2048,20*log10(abs(xf)/max(abs(xf))));grid on;
xlabel('kHz','fontsize',14);ylabel('�����ź�Ƶ��','fontsize',12);
title('�����ź�Ƶ��','fontsize',14);

y=conv(h,x);%���þ����ϵͳ���
figure;plot(0:147,y);grid on; xlim([0 147]);grid on;
xlabel('n','fontsize',14);ylabel('y(n)','fontsize',14);
title('ϵͳ���','fontsize',14);

yf=freqz(y,1,1024);%������ź�Ƶ��
figure;
plot((0:1023)*10/2048,20*log10(abs(yf)/max(abs(yf))));grid on; 
xlabel('kHz','fontsize',14);ylabel('ϵͳƵ����Ӧ','fontsize',12);
title('����ź�Ƶ��','fontsize',14);

x=sin(2*pi*0.3*(0:127)/10)+sin(2*pi*2.4*(0:127)/10);%�������������ź�
figure;plot(0:127,x);xlim([0 127]);grid on; 
xlabel('n','fontsize',14);ylabel('x(n)','fontsize',14);
title('ϵͳ�����ź�x(n)','fontsize',14);

h(1:20)=(1:20);h(21)=21;h(22:41)=(20:-1:1);%����ϵͳ��λ�������У����ȱ䳤��
figure;plot(0:40,h);ylim([0 21]);grid on; 
xlabel('n','fontsize',14);ylabel('h(n)','fontsize',14);
title('ϵͳ��λ������Ӧh(n)','fontsize',14);

hf=freqz(h,1,1024);%��ϵͳƵ����Ӧ
xf=freqz(x,1,1024);%�������ź�Ƶ��
figure;
subplot(2,1,1);plot((0:1023)*10/2048,20*log10(abs(hf)/max(abs(hf))));grid on;
xlabel('kHz','fontsize',14);ylabel('ϵͳƵ����Ӧ','fontsize',12);title('ϵͳƵ����Ӧ','fontsize',14);

subplot(2,1,2),plot((0:1023)*10/2048,20*log10(abs(xf)/max(abs(xf))));grid on;
xlabel('kHz','fontsize',14);ylabel('�����ź�Ƶ��','fontsize',12);title('�����ź�Ƶ��','fontsize',14);

y=conv(h,x);%���þ����ϵͳ���
figure;plot(0:167,y);grid on; xlim([0 167]);grid on; 
xlabel('n','fontsize',14);ylabel('y(n)','fontsize',14);
title('ϵͳ���','fontsize',14);

yf=freqz(y,1,1024);%������ź�Ƶ��
figure;
plot((0:1023)*10/2048,20*log10(abs(yf)/max(abs(yf))));grid on; 
xlabel('kHz','fontsize',14);ylabel('ϵͳƵ����Ӧ','fontsize',12);
title('����ź�Ƶ��','fontsize',14);