%����������Remez�����㷨�����һ��������λ��ͨFIR�����˲���
clc;
clear;
close all;
fp=800;fs=1000;   %�����˲�������
Fs=4000;            %���ò���Ƶ��
alphap=0.5;alphas=40;     %�����˲�������
f=[fp,fs];            
m=[1 0]; 
delta1=(10^(alphap/20)-1)/(10^(alphap/20)+1); % ��ͨ�����Ʒ���delta1
delta2=10^(-alphas/20);    %    ��������Ʒ���delta2
delta=[delta1,delta2];
[N,fpts,mag,wt]=remezord(f,m,delta,Fs);    %    ��remezord�����
hn=remez(N,fpts,mag,wt);      %      ��remez���˲�����������Ӧh(n)
[H,w]=freqz(hn,1,512);    %    ��freqz��Ƶ����ӦH
plot(w*2000/pi,20*log10(abs(H)));
grid; xlabel('Frequency/Hz'); ylabel('Amplitude/dB');