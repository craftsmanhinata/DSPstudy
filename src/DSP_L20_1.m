%��������Ƶ�����
%�������ǽ�������µ����Ƶ�����ʱ��ʵ����
%��ĳһ�źŵ� SFT ���в�ͬ�����Ĳ������۲����Ӧ��ʱ���κ� SFT��

clear;%����ڴ�
close all;%�ر�����ͼ��

x=[1 2 3 4 5 6 7 8 9 10 10 9 8 7 6 5 4 3 2 1];%�����ź�
xf=fft(x,2048);%���źŵĽ���SFT
y1f=xf(1:64:2048); %��SFT�ϲ���32�� 
y2f=xf(1:128:2048); %��SFT�ϲ���16��

y1=ifft(y1f);%��y1(n)
y1sft=fft(y1,2048);%��32��������SFT

y2=ifft(y2f);%��y2(n)
y2sft=fft(y2,2048);%��16��������SFT

figure;
subplot(3,1,1),stem(0:19,x);grid on;
xlabel('n','fontsize',12);ylabel('x(n)','fontsize',12);
subplot(3,1,2),plot((0:2047)/1024,abs(xf));grid on;hold on;
stem((0:64:2047)/1024,abs(y1f),'r');ylim([0 110]);
xlabel('\omega/\pi','fontsize',14);ylabel('����(dB)','fontsize',12);
xlim([0 2048/1024]);
% title('��SFT32�����','fontsize',12);
subplot(3,1,3),stem(0:31,y1);grid on;ylim([0 10]);
xlabel('n','fontsize',12);ylabel('y1(n)','fontsize',12);

figure;
subplot(3,1,1),stem(0:19,x);grid on;
xlabel('n','fontsize',14);ylabel('x(n)','fontsize',14);
subplot(3,1,2),plot((0:2047)/1024,abs(xf));grid on;hold on; 
stem((0:128:2047)/1024,abs(y2f),'r');ylim([0 110]);
xlabel('\omega/\pi','fontsize',14);ylabel('����(dB)','fontsize',14);
xlim([0 2048/1024]);
% title('��SFT16�����','fontsize',14);
subplot(3,1,3),stem(0:15,y2);grid on;
xlabel('n','fontsize',14);ylabel('y2(n)','fontsize',14);
 
figure;
plot((0:2047)/1024,abs(y1sft),'b',(0:2047)/1024,abs(y2sft),'r');
grid on;hold on;
stem((0:128:2047)/1024,abs(y2f),'black');ylim([0 110]);
xlabel('\omega/\pi','fontsize',14);ylabel('����(dB)','fontsize',14);
xlim([0 2048/1024]);title('��ͬ�������Ӧ��SFT','fontsize',14);
legend('32��SFT','16��SFT');
 