% ��������DFT ������Ӱ��
% �������ǽ�������µڶ���DFT����ʱ��ʵ������ͬһ�����У�����ͬ���DFT�����ͬ�� 
% ԭ������ԭ�źŵ� SFT �ϲ��������ͬ�õ��Ľ����

clear;
close all;
x(1:4)=1;%����R4(n);

xsft=fft(x,1024);%��R4(n)��SFT
x4f=fft(x,4);%��4��DFT
x64f=fft(x,64);%��8��DFT
x256f=fft(x,256);%��32��DFT

figure;

subplot(3,1,1);
plot((0:1023)/512,abs(xsft));
grid on;
hold on;
xlim([0 1023/512]);
grid on;hold on; 
stem((0:256:1023)/512,abs(x4f),'r');
xlabel('\omega/\pi','fontsize',14);ylabel('����(dB)','fontsize',14);

subplot(3,1,2),plot((0:1023)/512,abs(xsft));
grid on;hold on;xlim([0 1023/512]);
stem((0:16:1023)/512,abs(x64f),'r')
xlabel('\omega/\pi','fontsize',14);ylabel('����(dB)','fontsize',14);

subplot(3,1,3),plot((0:1023)/512,abs(xsft));
grid on;hold on;xlim([0 1023/512]);
stem((0:4:1023)/512,abs(x256f),'r')
xlabel('\omega/\pi','fontsize',14);ylabel('����(dB)','fontsize',14);