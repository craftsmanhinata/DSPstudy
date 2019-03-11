%����������غ����������м���źŵ�Ӧ��
%�������ǵ�һ�µ��Ľ���ɢʱ���źŵ�������н�����غ���Ӧ��ʱ�ٵ�ʵ����
%���Ȳ���һ·��˹����������ֵΪ�㣬����Ϊ 1����
%Ȼ���ڵ��ز��ź��ϵ�������������������Ⱦ����ź�����غ������۲���غ����������м���źŵ�Ӧ�������

clear;%����ڴ�
close all;%�ر�����ͼ��
xn=randn(1,200);%������˹������
r_nn=xcorr(xn,xn);
figure;
subplot(2,1,1),plot(0:199,xn);grid on;
title('������ʱ��ͼ','fontsize',12);
ylabel('N(n)','fontsize',14);xlabel('n','fontsize',14);%��עxy������

subplot(2,1,2),plot(0:199,r_nn(200:399)/200);grid on;
title('����������غ���ͼ','fontsize',12);
ylabel('rn(m)','fontsize',14);xlabel('m','fontsize',14);%��עxy������

SNR=7;%�����
A=sqrt(2*10^(SNR/10));%��������ȼ����źŷ���
x1=A*sin(pi*0.165*(0:199));%���������ز��ź�
x=x1+randn(1,200);%�źż�����
y=xcorr(x,x); %��x������غ���������Ϊ2N-1
y=y/200; %����غ���������ƽ��(����)
figure;
subplot(3,1,1),plot(0:199,x1);grid on;
title('�źŵ�ʱ��ͼ','fontsize',12);
ylabel('s(n)','fontsize',14);xlabel('n','fontsize',14);%��עxy������
subplot(3,1,2),plot(0:199,x);grid on;
title('�źż�����ʱ��ͼ','fontsize',12);
ylabel('x(n)','fontsize',14);xlabel('n','fontsize',14);%��עxy������
subplot(3,1,3),plot(0:99,y(200:299));grid on;
title('�źż���������غ���ͼ','fontsize',12);
ylabel('r(m)','fontsize',14);xlabel('m','fontsize',14);%��עxy������