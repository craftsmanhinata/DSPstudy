%FIR��ͨ�˲���
%(һ)����˵�� ��������Ҫ����MATLAB�Դ����������FIR��ͨ�˲�����
clc;
clear;
close all;

wpl=0.32*pi;
wpu=0.6*pi;
wsl=0.28*pi;
wsu=0.66*pi; % ���ָ�������ֵ
wd1=0.5*(wpl+wsl);
wd2=0.5*(wpu+wsu);        % �����ͨ�˲�����ֹƵ��
Bt=min(abs(wsl-wpl),abs(wsu-wpu));    % ���ɴ��Ŀ��
N=ceil(6.6*pi/Bt);    % ѡ�ú�����,�����˲�������,��ȷ���ɴ���Ҳ��ѡ��8pi/bt�����������Ҫ��
wn=[wd1/pi,wd2/pi]; % ���������ͨ��ֹƵ��

h=fir1(N-1,wn,'bandpass',hamming(N));
WR=abs(fft(h,512))/max(abs(fft(h,512)));
WR=20*log10(WR); 

subplot(1,2,1);
stem(h,'.');
grid on; 
xlabel('n');ylabel('h(n)'); 

subplot(1,2,2);
plot((0:255)/256,WR(1:256));
grid on;
xlabel('\omega/\pi');ylabel('20lg|H(\omega)|')