%���ֺ������FIR�˲���
%(һ)����˵��  ����������fir1���һ����������ָ���������λFIR��ͨ�˲�����
%  �����ֹƵ��Ϊ0.4�У�ͨ����ʼƵ��Ϊ0.55�У����ͨ��˥��Ϊ0.1dB����С���˥��Ϊ42dB��
%  �ֱ��������洰����������˲��������������������������������Ϳ�������
%  ����ÿ�������������������Ӧϵ����������Ƶ��˲����ķ�Ƶ��Ӧ��
clc;
clear;
close all;

ws=0.4*pi;wp=0.55*pi;
wd=0.5*(wp+ws);      %���������ͨ�˲�����ͨ����ֹƵ��
Bt=abs(wp-ws);         %������ɴ�
alphas=42; 

N1=ceil(8*pi/Bt); %���㺺�����ĳ���
%!!!!!!!!!��ͨ�������˲�������������-1��ֻ��Ϊż�����������pi����һ����㣬������Ҫ��!!!!!!!!!
N1 = N1+1-mod(N1,2);
hhan=fir1(N1-1,wd/pi,'high',hann(N1)); %����fir1�����ͨFIR�˲���,�˲����Ľ���Ϊ����-1
HHan=fft(hhan,512); 

N2=ceil(8*pi/Bt); %���㺺�����ĳ���
N2 = N2+1-mod(N2,2);
hhm=fir1(N2-1,wd/pi,'high'); %����fir1�����ͨFIR�˲���
HHm=fft(hhm,512); 

N3=ceil(12*pi/Bt); %���㲼���������ĳ���
N3 = N3+1-mod(N3,2);
hb=fir1(N3-1,wd/pi,'high',blackman(N3)); %����fir1�����ͨFIR�˲���
HHb=fft(hb,512); 

beta=0.5842*(alphas-21)^0.4+0.07886*(alphas-21); % ���������Ʋ���
N4=ceil((alphas-8)/(2.285*Bt));
N4 = N4+1-mod(N4,2);
hks=fir1(N4-1,wd/pi,'high',kaiser(N4,beta)); %����fir1�����ͨFIR�˲���
Hks=fft(hks,512); 

figure;
subplot(2,1,1);plot(hhan);grid;xlabel('n');ylabel('h(n)'); 
subplot(2,1,2);plot((0:255)/512,20*log10(abs(HHan(1:256))));grid; xlabel('\omega/\pi'); ylabel('20lg|H(\omega)|'); 
figure;
subplot(2,1,1);plot(hhm);grid;xlabel('n');ylabel('h(n)');
subplot(2,1,2);plot((0:255)/512,20*log10(abs(HHm(1:256))));grid; xlabel('\omega/\pi');title('\theta(\omega)'); 
figure;
subplot(2,1,1);plot(hb);grid;xlabel('n');ylabel('h(n)'); 
subplot(2,1,2);plot((0:255)/512,20*log10(abs(HHb(1:256))));grid; xlabel('\omega/\pi'); ylabel('20lg|H(\omega)|'); 
figure;
subplot(2,1,1);plot(hks);grid;xlabel('n');ylabel('h(n)'); 
subplot(2,1,2);plot((0:255)/512,20*log10(abs(Hks(1:256)))); grid;xlabel('\omega/\pi'); ylabel('20lg|H(\omega)|');