%����������С��λϵͳ���ص�
%һ������˵�����������ǽ���ڶ��µ�����LTI��ɢʱ��ϵͳ��Ƶ������С�ϵͳ�㼫���ϵͳƵ����Ӧ��Ӱ�족��ʵ����
%ͨ������������Ƶ��Ӧ��ͬ��������С��λϵͳ������ͬһ�������źţ����ز������۲�����ϵͳ����Ĳ�ͬ��
%��С��λ
clear;
close all;
z1=0.9*exp(1i*0.122*pi);z2=0.9*exp(-1i*0.122*pi); %������С��λϵͳ���
z3=0.7*exp(1i*0.3*pi);z4=0.7*exp(-1i*0.3*pi); 
p1=0.95*exp(1i*0.01*pi);p2=0.95*exp(-1i*0.01*pi); %������С��λϵͳ����
p3=0.95*exp(1i*0.1*pi);p4=0.95*exp(-1i*0.1*pi); 

z=[z1,z2,z3,z4]';p=[p1,p2,p3,p4]';
figure;zplane(z,p);grid on;%������С��λϵͳ�㼫��ͼ  
title('��С��λϵͳ�㼫��ͼ','fontsize',12);

[b,a]=zp2tf(z,p,1);%�����㼫����ϵͳ����  

z21=1/z1;z22=1/z2;z23=1/z3;z24=1/z4;  
zz=[z21,z22,z23,z24]';%����ԳƵ����  
pp=p;  figure;zplane(zz,pp);grid on;%���������λϵͳ�㼫��ͼ    
title('�����λϵͳ�㼫��ͼ','fontsize',12);  
[b1,a1]=zp2tf(zz,pp,1);  

w=0:0.005*pi:pi;  
h=freqz(b,a,w);  hmax=max(abs(h));  
h1=freqz(b1,a1,w);h1max=max(abs(h1));  
w=w/pi;               
figure;subplot(2,1,1),plot(w,20*log10(abs(h)/hmax));grid on; 
xlabel('\omega/\pi'  ,'fontsize',14);ylabel('����(dB)','fontsize',14);            
title('��С��λϵͳ�ķ�Ƶ��Ӧ','fontsize',12);  
subplot(2,1,2),plot(w,20*log10(abs(h1)/h1max));grid on
title('�����λϵͳ�ķ�Ƶ��Ӧ','fontsize',12);
xlabel('\omega/\pi'  ,'fontsize',14);ylabel('����(dB)','fontsize',14);  
x=sin(2*pi*(1:1256)*80/2000);%���������ź�
y1=filter(b,a,x);%�ź�ͨ����С��λϵͳ
y2=filter(b1,a1,x);%�ź�ͨ�������λϵͳ
figure;

subplot(2,1,1),plot(y1(1:200)/hmax);grid on; 
title('��С��λϵͳ�����','fontsize',12);
ylim([-0.1 0.2]);xlabel('n'   ,'fontsize',14);ylabel('y(n)','fontsize',14);

subplot(2,1,2),plot(y2(1:200)/h1max);grid on;             
title('�����λϵͳ�����','fontsize',12);
ylim([-0.1 0.2]);xlabel('n'   ,'fontsize',14);ylabel('y(n)','fontsize',14);