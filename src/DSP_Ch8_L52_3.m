%������������IIR�����˲�����ϵͳ������ϵͳ���㼫��ֲ�ͼ��Ƶ����Ӧ�͵�λ������Ӧ��
clc;
clear;
close all;

clc;
clear;
close all;

sos=[1 -exp(1i*pi/3) 0.25*exp(1i*2*pi/3) 1 0 -0.81;1 -exp(-1i*pi/3) 0.25*exp(-1i*2*pi/3) 1 0 0];
[b,a]=sos2tf(sos);
[z,p,k]=tf2zp(b,a); %�������ԭ����
w=0:0.001*pi:pi; 
[H,w]=freqz(b,a,w);%��Ƶ����Ӧ
h=impz(b,a);        %��λ�����Ӧ

figure;plot(abs(H));
figure;plot(abs(h));