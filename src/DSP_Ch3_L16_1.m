%��������DFT��SFT�Ĺ�ϵ
%һ������˵�����������ǽ�������µڶ���DFT����ʱ��ʵ����ǿ��DFT��SFT�Ĺ�ϵ��
clear;
close all;
N=16;
x=exp(1i*2*pi/8*(0:N-1));%����x(n);
xsft=fft(x,1024);%��x��n)��SFT
xf=fft(x,N);%��N��DFT 
figure;plot((0:1023)/512,abs(xsft));grid on;hold on;
stem((0:64:1023)/512,abs(xf),'r'  );%����DFTͼ
xlabel('\omega/\pi'   ,'fontsize',14);ylabel('����(dB)','fontsize',14);
xlim([0 1023/512]);