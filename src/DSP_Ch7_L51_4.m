%����������IIR�˲�������һ�������źš�
clc;
clear;
close all;

n=1:256;
f0 = 1296;      %���������źŵ�Ƶ��
Fs  =  8000;    %����Ƶ��
w0 = 2*pi*f0/Fs;
x=  [1,zeros(1,255)];    %���뵥λ����
y = zeros(1,256); %��ʼ�����y(n)
y(1) = 0;y(2) = sin(w0);
for i = 3:256
    y(i) = 2*cos(w0)*y(i-1) - y(i-2) + sin(w0)*x(i-1);
end
plot(n,y,'k','linewidth',2);
xlabel('n');ylabel('h(n)');