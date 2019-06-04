% ��������DFTѭ����λ����
% 
% �������ǽ�������µ����� DFT ѭ����λ����ʱ��ʵ����
% ǿ��ʱ��ѭ����λ������ɢ����Ҷ�任�ķ�Ƶ���Բ��䣬��Ƶ���Է����˱仯��

clear;%����ڴ�
close all;%�ر�����ͼ��

x1=[1 2 3 4 4 3 2 1];%�����ź�x1(n)
x2=[4 3 2 1 1 2 3 4];%x2(n)��x1(n)��ѭ����λ

x1f=fft(x1,2048);%���ź�Ƶ��
x2f=fft(x2,2048);%��ѭ����λ���ź�Ƶ��

figure;
plot((0:2047)/1024,abs(x1f));%��ԭ�ź�SFT��Ƶ����
grid on;hold on; 
stem((0:256:2047)/1024,abs(x1f(1:256:2048)),'r');%��8��DFT��Ƶ����
xlabel('\omega/\pi','fontsize',14);ylabel('����','fontsize',14);
xlim([0 2048/1024]);title('8��DFT��Ƶ����','fontsize',14);

figure;
plot((0:2047)/1024,abs(x2f));%���ź���λ���ź�SFT��Ƶ����
grid on;hold on; 
stem((0:256:2047)/1024,abs(x2f(1:256:2048)),'r');%��ѭ����λ��8��DFT��Ƶ����
xlabel('\omega/\pi','fontsize',14);ylabel('����','fontsize',14);
xlim([0 2048/1024]); title('8��DFT��Ƶ����','fontsize',14);

figure;
plot((0:2047)/1024,unwrap(angle(x1f)));%��ԭ�ź�SFT��Ƶ����
grid on;hold on; 
stem((0:256:2047)/1024,unwrap(angle(x1f(1:256:2048))),'r');%��8��DFT��Ƶ����
xlabel('\omega/\pi','fontsize',14);ylabel('����','fontsize',14);
xlim([0 2048/1024]);title('8��DFT��Ƶ����','fontsize',14);

figure;
plot((0:2047)/1024,unwrap(angle(x2f)));%���ź���λ���ź�SFT��Ƶ����
grid on;hold on; 
stem((0:256:2047)/1024,unwrap(angle(x2f(1:256:2048))),'r');%��ѭ����λ��8��DFT��Ƶ����
xlabel('\omega/\pi','fontsize',14);ylabel('����','fontsize',14);
xlim([0 2048/1024]); title('8��DFT��Ƶ����','fontsize',14);
 
figure;
plot((0:2047)/1024,abs(x1f));
grid on;hold on; 
stem((0:128:2047)/1024,abs(x1f(1:128:2048)),'r');%��16��DFT��Ƶ����
xlabel('\omega/\pi','fontsize',14);ylabel('����','fontsize',14);
xlim([0 2048/1024]);title('16��DFT��Ƶ����','fontsize',14);

figure;
plot((0:2047)/1024,abs(x2f));
grid on;hold on; 
stem((0:128:2047)/1024,abs(x2f(1:128:2048)),'r');%��ѭ����λ��16��DFT��Ƶ����
xlabel('\omega/\pi','fontsize',14);ylabel('����','fontsize',14);
xlim([0 2048/1024]); title('16��DFT��Ƶ����','fontsize',14);