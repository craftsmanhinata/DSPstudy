% �����±�Ƶ��
% һ������˵�� ��������ͼ1��ʾ��ԭ���ͼ��ʵ���˽������ź������������źű�Ƶ������Ƶͬʱ���������Ƶ�ʣ����˳������ź��������ĵ�Ƶ���š�
clear;
close all;

Fs=4000;%����Ƶ��(kHz)
fm=10;f1=200;f2=235;%�ź��������ĵ���Ƶ�ʼ��ز�Ƶ��(kHz)
f0=f1;%NCO��Ƶ��
n=4096;%������
D=20;%��ȡ����
x=((1+0.5*sin(2*pi*fm/Fs*(0:n-1))).*sin(2*pi*f1/Fs*(0:n-1))+0.4*sin(2*pi*f2/Fs*(0:n-1))); 
fx=fft(x); 
figure; 
subplot(2,1,1);plot(x(1:100),'b','LineWidth',2);grid on;
xlabel('n');ylabel('x(n)');title('��ȡǰ������'); 
subplot(2,1,2);plot((0:n-1)/n*Fs,20*log10(abs(fx)),'b','LineWidth',2);grid on; 
xlabel('kHz');ylabel('dB');title('��ȡǰ���еķ�Ƶ����'); 

nf=exp(-1i*2*pi*f0/Fs*(0:n-1)); 
x1=x.*nf; 
fx1=fft(x1); 
figure; plot((0:n-1)/n*Fs,20*log10(abs(fx1)),'b','LineWidth',2);grid on; 
xlabel('kHz');ylabel('dB');title('����Ƶ�ķ�Ƶ����'); 

cicb=1/D*ones(1,D); 
x2=conv(cicb,x1); 
fx2=fft(x2(D:length(x2)-D),n); 
figure; plot((0:n-1)/n*Fs,20*log10(abs(fx2)),'b','LineWidth',2);grid on; 
xlabel('kHz');ylabel('dB');title('CIC�˲���ķ�Ƶ����');
x3=x2(D:D:length(x2)-D);%ȥ��̬����ȡ
fx3=fft(x3); 
figure; plot((0:length(x3)-1)/length(x3)*(Fs/D),20*log10(abs(fx3)),'b'   ,'LineWidth',2);grid on; 
xlabel('kHz');ylabel('dB');title('��ȡ�����еķ�Ƶ����'); 

b=fir1(31,20/50);
x5=conv(b,x3);
x4=x5(32:length(x5)-32);
fx4=fft(x4); 
figure; 
subplot(2,1,1);plot(real(x4),'b','LineWidth',2);grid on; 
xlabel('n');ylabel('y(n)');title('��ȡ�������'); 
subplot(2,1,2);plot((0:length(x4)-1)/length(x4)*(Fs/D),20*log10(abs(fx4)),'b','LineWidth',2);grid on;
xlabel('kHz');ylabel('dB');title('�����±�Ƶ����źŵķ�Ƶ����');