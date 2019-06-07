% ���źŵ�Ƶ��
% (һ)����˵�� ������������ʾ���źŵ�Ƶ�׵Ĺ��ɡ�

clc;
clear;
close all;

N=200; %�źų���
M=2048;%fft����
at(1:N)=0; 
at(1:8)=[1,2,3,4,4,3,2,1];%exp(-0.15*(0:N-1))
x=at.*sin(2*pi*(0:N-1)*0.25);% �ź�ʵ��
y=-at.*cos(2*pi*(0:N-1)*0.25);% �ź��鲿

z=x+1i*y; %���ź�

xf=abs(fft(x,M));%ʵ���ķ�����
zf=abs(fft(z,M));%���źŵķ�����
yf1=abs(fft(y,M));%�鲿�ķ�����

yf(1:M/2)=-yf1(1:M/2);
yf(M/2+1:M)=yf1(M/2+1:M);%��j�鲿�ķ�����

a=(0:M-1)/M*2; %��ͼ

figure;
subplot(2,1,1),plot(a,(xf),'b','linewidth',2);
grid on;
xlabel('\omega/\pi');
ylabel('X( e^{j\omega})');
subplot(2,1,2),plot(a,(yf),'b','linewidth',2);
grid on; 
xlabel('\omega/\pi');
ylabel('X_1(e^{j\omega})'); 

figure;
plot(a,(zf),'b','linewidth',2);
grid on; 
xlabel('\omega/\pi');
ylabel('Z(e^{j\omega})');