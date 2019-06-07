% AD9857Ӧ�÷���
% һ����������  �������±�Ƶ����Ӧ�ó��ϲ�ͬ������Ҫ�������źŰ��Ƶ��ϸߵ�Ƶ�ʣ���Ҫʹ�������ϱ�Ƶ����
%  ��������Analog Devices��˾�Ŀɱ�̵�ͨ�������ϱ�Ƶ����AD9857Ϊ�����ԵͲ���Ƶ���µĻ����źŽ��������ϱ�Ƶ����
% ����������������������ƵΪ5kHz������Ƶ��Ϊ25kHz������Ƶ��Ϊ0.5kHz��������30%��խ�������źţ�
% ��150kHzΪNCO������Ƶ�ʽ��������ϱ�Ƶ������źŵĲ���Ƶ����Ϊ2MHz��Ҳ�����ڲ屶��I=80��
% ����AD9857�Ը����ڲ����ӵ������Լ��ڲ��˲�������ƣ�ѡ��I1=2��I2=2��I3=20��
close all;
clear;
Fs=25;%����Ƶ��(kHz)
f1=5;%�ź�Ƶ��(kHz)
f0=150;%NCO��Ƶ��(kHz)
n=120;%������
x=(1+0.3*sin(2*pi*0.5/Fs*(0:n-1))).*sin(2*pi*f1/Fs*(0:n-1))+0.01*randn(1,n); 
fx=fft(x); 
figure;
subplot(2,1,1);plot(x,'b','LineWidth',2);grid on; 
xlabel('n','fontsize',12);ylabel('x(n)','fontsize',12);
title('�ڲ�ǰ������','fontsize',12); 
subplot(2,1,2);plot((0:n-1)/n*Fs,20*log10(abs(fx)),'b','LineWidth',2);grid on;
xlabel('kHz','fontsize',12);ylabel('dB','fontsize',12); 
title('�ڲ�ǰ���еķ�Ƶ����','fontsize',12); 
I1=2;I2=2;I3=20;%�ڲ�����
%%%%%%%%%%%%%%%% 
y1=zeros(1,I1*length(x)); 
y1(1:I1:length(y1))=x;%��һ���ڲ�������
fy1=fft(y1); 
figure;
subplot(2,1,1); plot((0:length(y1)-1)/length(y1)*I1*Fs,20*log10(abs(fy1)),'b'   ,'LineWidth',2);grid on;
xlabel('kHz','fontsize',12);ylabel('dB','fontsize',12); 
title('��������еķ�Ƶ����','fontsize',12); 

b1=I1*firhalfband('minorder',2*6.5/(Fs*I1),0.002);%����˲���
yf1=conv(b1,y1);
N=length(b1);
yf2=yf1(N:length(yf1)-N);%ȥ����̬��Ӧ
fyf1=fft(yf2); 
subplot(2,1,2); plot((0:length(yf2)-1)/length(yf2)*I1*Fs,20*log10(abs(fyf1)),'b','LineWidth',2);grid on;
xlabel('kHz','fontsize',12);ylabel('dB','fontsize',12); 
title('��ͨ�˲���ķ�Ƶ����','fontsize',12); 
%%%%%%%%%%%%%%%%
y2=zeros(1,I2*length(yf2)); 
y2(1:I2:length(y2))=yf2;%�ڶ����ڲ�������
fy2=fft(y2); 
figure;
subplot(2,1,1); plot((0:length(y2)-1)/length(y2)*I2*I1*Fs,20*log10(abs(fy2)),'b','LineWidth',2);grid on;
xlabel('kHz','fontsize',12);ylabel('dB','fontsize',12); 
title('��������еķ�Ƶ����','fontsize',12);
b2=I2*firhalfband('minorder',2*6.5/(Fs*I1*I2),0.0002);%����˲���
yf3=conv(b2,y2); N=length(b2);
yf4=yf3(N:length(yf3)-N);%ȥ����̬��Ӧ
fyf2=fft(yf4);
subplot(2,1,2); plot((0:length(yf4)-1)/length(yf4)*I2*I1*Fs,20*log10(abs(fyf2)),'b','LineWidth',2);grid on; 
xlabel('kHz','fontsize',12);ylabel('dB','fontsize',12); 
title('��ͨ�˲���ķ�Ƶ����','fontsize',12); 
%%%%%%%%%%%%%%%%
y3=zeros(1,I3*length(yf4)); 
y3(1:I3:length(y3))=yf4;%�������ڲ�������
fy3=fft(y3); 
figure;
subplot(2,1,1); plot((0:length(y3)-1)/length(y3)*I1*I2*I3*Fs,20*log10(abs(fy3)),'b','LineWidth',2);grid on; 
xlabel('kHz','fontsize',12);ylabel('dB','fontsize',12); 
title('��������еķ�Ƶ����','fontsize',12); 
cb=1/I3*ones(1,I3);
b=conv(conv(conv(conv(cb,cb),cb),cb),cb);
b3=I3*b;%����˲���
N=length(b3);    
yf5=conv(b3,y3); 
yf6=yf5(N:length(yf5)-N);%ȥ����̬��Ӧ
fyf3=fft(yf6);
subplot(2,1,2); plot((0:length(yf6)-1)/length(yf6)*I1*I2*I3*Fs,20*log10(abs(fyf3)),'b','LineWidth',2); grid on;
xlabel('kHz','fontsize',12);ylabel('dB','fontsize',12); 
title('��ͨ�˲���ķ�Ƶ����','fontsize',12); 
%%%%%%%%%%%%%%%%
y=yf6.*exp(1i*2*pi*f0/(I1*I2*I3*Fs)*(0:length(yf6)-1));%����Ƶ
fy=fft(y); 
figure;
subplot(2,1,1);plot(real(y(1:500)),'b','LineWidth',2);grid on; 
xlabel('n','fontsize',12);ylabel('x(n)','fontsize',12); 
title('�����ϱ�Ƶ�������','fontsize',12);
subplot(2,1,2); 
plot((0:length(y)-1)/length(y)*I1*I2*I3*Fs,20*log10(abs(fy(1:length(y)))),'b','LineWidth',2); 
grid on;
xlabel('kHz','fontsize',12);ylabel('dB','fontsize',12); 
title('�����ϱ�Ƶ����źŵķ�Ƶ����','fontsize',12);