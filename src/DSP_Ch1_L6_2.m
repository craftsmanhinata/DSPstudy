%�������ƣ��ź�ʱ�����
%���������ڵ�һ�µ��Ľ���ɢʱ���źŵ�������н�����غ���Ӧ��ʱ�İ�����
%����ԴĿ�귢�� BPSK �źţ�����Ƶ�� 40kHz���ز�Ƶ�� 6kHz�������� 2kHz����·���գ������ź� 1�Ƚ����ź� 2 �ӳ� 60 �����㡣
%���Ƚ�ȡ�źų��� 200 �㣬�۲���غ����ķ�ֵ���ٽ�ȡ�źų��� 2000 �㣬�۲���غ����ķ�ֵ��
%���2019��5��13�տ�����������Ҫѧϰ��ͨ��ԭ���������BPSK�źž���Ϊʲô��ô���ɡ�


clear; %��������ͺ������ڴ�
clc;close all;
Fs=40000; %����Ƶ��
t=0.4; %�źų���ʱ�� ��λ��
N=t*Fs; %�źŵ���

%%%%%%%%%%%%%%����һ��BPSK�ź�
If2=6000; %�ź��ز�Ƶ��
Rb2=2000; %��Ԫ����
amp=1; %�źŷ���
rcosa=0.7; %����ϵ�� 0~1��
theta=0; %�źų���
M=2; %PSK���ƽ�����
snr=25; %�����
S=GetMPSK(Fs,amp,N,If2,Rb2,theta,rcosa,M);%����һ·BPSK���ź�
S4=(S(60:2060));%������һ·���ո��źţ��ӳ�60������
S4=awgn(S4,snr);%���ϸ�˹������
S3=awgn(S,snr);%���ϸ�˹������
y=xcorr(S3(1:200),S4(1:200)); %����·�Ļ���غ���������Ϊ2N-1
figure;plot(0:199,real(S3(1:200)));grid on;
ylabel('x1(n)','fontsize',14);xlabel('n','fontsize',14);%��עxy������
title('x1(n)�ź�ʱ��ͼ','fontsize',14);
figure;plot(0:199,real(S4(1:200)));grid on;
ylabel('x2(n)','fontsize',14);xlabel('n','fontsize',14);%��עxy������
title('x2(n)�ź�ʱ��ͼ','fontsize',14);
figure;plot(1:200,abs(y(200:399))/2000);grid on;
ylabel('r(m)','fontsize',14);xlabel('m','fontsize',14);%��עxy������
title('������ź�ʱ��ͼ','fontsize',14);

function Signal=GetMPSK(Fs,amp,snapshot,fc,Rb,theta,rcosa,M)
%�������˲�������M����PSK�ź�
%fcΪ��Ƶ��FsΪ�����ʣ�rateΪ���٣�unitnumΪ�źų���ʱ��
%MΪ��������sphaseΪ����λ��SNR_dbΪ�����,rcosaΪ�������˲�������ϵ��
R=rcosa;
Delay = 3; % �������˲���������Ԫ����
codelen=floor(snapshot/(Fs/Rb));%ȫ����Ԫ����
allcode=floor(rand(1,codelen)*M);%�����������
SI=cos(2*pi*allcode/M);%��������
SQ=-sin(2*pi*allcode/M);%ͬ�����
[yf, tf] = rcosine(Rb, Fs, 'fir', R, Delay);
% Upsample and filter.
[Y_I, t1] = rcosflt(SI, Rb, Fs, 'filter', yf);
[Y_Q, t2] = rcosflt(SQ, Rb, Fs, 'filter', yf);
t=t1';
sig1=amp*(Y_I.*cos(2*pi*fc*t+theta)+Y_Q.*sin(2*pi*fc*t+theta));
sig2=amp*(Y_I.*sin(2*pi*fc*t+theta)-Y_Q.*cos(2*pi*fc*t+theta));
sig=sig1(Delay*(Fs/Rb)+1:length(sig1)-Delay*(Fs/Rb));
sigg=sig2(Delay*(Fs/Rb)+1:length(sig2)-Delay*(Fs/Rb));
% Data1=sig+j*sigg;
Data1=sigg+j*sig;
Signal=Data1';
end