clear;
close all;

%��ַ���ϵ��
a0=1;
a1=-0.7;
b0=1.5;
%ϵͳ��ʼ����
ys=1;

xn=[1,zeros(1,30)];
B=b0;
A=[a0,a1];
xi=filtic(B,A,ys);%xi�ǵ�Ч��ʼ��������������
yn=filter(B,A,xn,xi);%���ϵͳ���y(n)
 
figure;stem(0:30,yn);grid on;
title('��ʼ����y(-1)=1ʱ,ϵͳ���', 'fontsize', 14 );
ylabel('y(n)','fontsize', 14 );xlabel('n','fontsize', 14 );

%��ַ���ϵ��
a0=1;
a1=-0.7;
b0=1.5;

xn=[1,zeros(1,30)];
B=b0;
A=[a0,a1];
yn=filter(B,A,xn);%���ϵͳ���y(n)
 
figure;stem(0:30,yn);grid on;
title('��ʼ����y(-1)=0ʱ,ϵͳ���', 'fontsize', 14 );
ylabel('y(n)','fontsize', 14 );xlabel('n','fontsize', 14 );