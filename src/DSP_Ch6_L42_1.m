% �Ƚ�FIR�˲�����IIR�˲�������λ
% (һ)����˵�� ���������ڱȽ�FIR�˲�����IIR�˲�������λ���Լ��˲��������ź���ʱ�����
clc;
close all;
clear;

n=0:250; %�趨�źų���
x = cos(0.2*pi*n)+cos(0.3*pi*n); %�����ź�
x1 = cos(0.2*pi*n)+cos(0.5*pi*n); %�����ź�

%�ô��������FIR�˲���
h1 = fir1(30,0.4,'low',hamming(31));%���������FIR�˲���
H1 = 20*log10(abs(fft(h1,1024)))/max(abs(fft(h1,1024))); 
figure(1); 
subplot(2,1,1);
plot((0:511)/512,H1(1:512),'LineWidth',2);
xlabel('Normalized Frequency\pi(rad/sample)');
ylabel('Magnitude(dB)'); 
grid on;
title('30(N=31)��FIR�˲���');

subplot(2,1,2) 
H11 = fft(h1,1024); 
plot((0:511)/512,phase(H11(1:512)),'LineWidth',2); 
xlabel('Normalized Frequency\pi(rad/sample)'); 
ylabel('Phase(degrees)');
grid on;

%���б�ѩ��II���IIR�˲���
Wp = 0.3;
Ws = 0.5;
Rp=1;
Rs = 40; %����ָ��
[N,Wso] = cheb2ord(Wp,Ws,Rp,Rs,'s');%���˲����Ľ״�
[B,A] = cheby2(N,Rs,Wso);% ����˲������ó�ϵ��

figure(2); 
freqz(B,A);%����˱���ʱ�Զ���Ƶ������ͼ
title('6���б�ѩ��II���˲���'); 

yIIR = filter(B,A,x); 
yFIR = conv(x,h1); 

figure(3); 
subplot(3,1,1); 
plot(x,'LineWidth',2); 
ylabel('x(n)');
xlabel('n');
title('x(n) = cos(0.2*pi*n)+cos(0.3*pi*n)'); 

subplot(3,1,2);
plot(yIIR,'LineWidth',2); 
ylabel('yIIR(n)');
xlabel('n'); 

subplot(3,1,3); 
plot(yFIR,'LineWidth',2); 
ylabel('yFIR(n)');
xlabel('n'); 
yIIR = filter(B,A,x1); 
yFIR = conv(x1,h1); 

figure(4); 
subplot(3,1,1) 
plot(x1,'LineWidth',2); 
ylabel('x(n)');
xlabel('n');
title('x(n) = cos(0.2*pi*n)+cos(0.5*pi*n)'); 

subplot(3,1,2); 
plot(yIIR,'LineWidth',2); 
ylabel('yIIR(n)');
xlabel('n'); 

subplot(3,1,3);
plot(yFIR,'LineWidth',2);
ylabel('yFIR(n)');
xlabel('n'); 