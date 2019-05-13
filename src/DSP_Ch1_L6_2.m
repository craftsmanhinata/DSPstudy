%案例名称：信号时差估计
%本案例是在第一章第四节离散时间信号的相关性中讲解相关函数应用时的案例。
%假设源目标发射 BPSK 信号，采样频率 40kHz，载波频率 6kHz，波特率 2kHz，两路接收，接收信号 1比接收信号 2 延迟 60 个样点。
%首先截取信号长度 200 点，观察相关函数的峰值，再截取信号长度 2000 点，观察相关函数的峰值。
%这个2019年5月13日看不懂，可能要学习了通信原理后，在来看BPSK信号究竟为什么这么生成。


clear; %清除变量和函数的内存
clc;close all;
Fs=40000; %采样频率
t=0.4; %信号持续时间 单位秒
N=t*Fs; %信号点数

%%%%%%%%%%%%%%产生一个BPSK信号
If2=6000; %信号载波频率
Rb2=2000; %码元速率
amp=1; %信号幅度
rcosa=0.7; %滚将系数 0~1；
theta=0; %信号初相
M=2; %PSK调制进制数
snr=25; %信噪比
S=GetMPSK(Fs,amp,N,If2,Rb2,theta,rcosa,M);%产生一路BPSK复信号
S4=(S(60:2060));%产生另一路接收复信号，延迟60个样点
S4=awgn(S4,snr);%加上高斯白噪声
S3=awgn(S,snr);%加上高斯白噪声
y=xcorr(S3(1:200),S4(1:200)); %求两路的互相关函数，长度为2N-1
figure;plot(0:199,real(S3(1:200)));grid on;
ylabel('x1(n)','fontsize',14);xlabel('n','fontsize',14);%标注xy轴坐标
title('x1(n)信号时域图','fontsize',14);
figure;plot(0:199,real(S4(1:200)));grid on;
ylabel('x2(n)','fontsize',14);xlabel('n','fontsize',14);%标注xy轴坐标
title('x2(n)信号时域图','fontsize',14);
figure;plot(1:200,abs(y(200:399))/2000);grid on;
ylabel('r(m)','fontsize',14);xlabel('m','fontsize',14);%标注xy轴坐标
title('互相关信号时域图','fontsize',14);

function Signal=GetMPSK(Fs,amp,snapshot,fc,Rb,theta,rcosa,M)
%经成形滤波后，生成M进制PSK信号
%fc为载频，Fs为采样率，rate为码速，unitnum为信号持续时间
%M为进制数，sphase为初相位，SNR_db为信噪比,rcosa为升余弦滤波器滚降系数
R=rcosa;
Delay = 3; % 升余弦滤波器持续码元长度
codelen=floor(snapshot/(Fs/Rb));%全部码元个数
allcode=floor(rand(1,codelen)*M);%生成随机码字
SI=cos(2*pi*allcode/M);%正交分量
SQ=-sin(2*pi*allcode/M);%同相分量
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