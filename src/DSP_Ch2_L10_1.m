%���������㼫��λ�öԷ�Ƶ���Ե�Ӱ��
%�������ǽ���ڶ��µ�����LTI��ɢʱ��ϵͳ��Ƶ������㼫��λ�öԷ�Ƶ��ӦӰ���ʵ����
%ͨ���ı���֪ϵͳ���㼫��λ�ã��ı�ϵͳ�ķ�Ƶ��Ӧ���ԡ�

clear;%����ڴ�
close all;%�ر�����ͼ��
z0 = 0.9;
p0 = 0.9;
z1=z0*exp(1i*0.4*pi);z2=z0*exp(-1i*0.4*pi); %����ϵͳ�����
p1=p0*exp(1i*0.2*pi);p2=p0*exp(-1i*0.2*pi); %����ϵͳ�ļ���
z=[z1,z2]';
p=[p1,p2]';
figure;zplane(z,p);grid on;%����ϵͳ���㼫��ͼ
title('ϵͳ���㼫��ͼ','fontsize',14);

[b,a]=zp2tf(z,p,1);%�����㼫����ϵͳ������ϵ��
w=0:0.005*pi:pi;
h=freqz(b,a,w);%��ϵͳ��Ƶ����Ӧ
hmax=max(abs(h));
w=w/pi; 
figure;
plot(w,20*log10(abs(h)/hmax));grid on;
xlabel('\omega/\pi','fontsize',14);ylabel('����(dB)','fontsize',14);
title('ϵͳ��Ƶ����Ӧ','fontsize',14);