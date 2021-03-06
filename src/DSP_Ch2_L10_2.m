%单频正弦信号测量系统频率响应

%本案例是在讲解第二章第三节 LTI 离散时间系统的频域分析频率响应介绍的。首先给出一个待测系统：
%b=[0.0156 -0.0018 -0.0884 0.0053 0.2136 -0.0035 -0.2816 -0.0035 0.2136 0.0053 -0.0884 -0.0018 0.0156]；
%a=[1.0000 -3.4927 6.2825 -8.4531 10.0038 -10.1966 8.7365 -6.4249 4.1506 -2.2736 0.9828 -0.2889 0.0482]。
%用 MATLAB 编程实现对系统频率响应的测量。计算测量所得系统与待测系统频率响应之间的误差。

%% 待测系统幅频响应
clear;
close all;
snr=40;%在测量信号中引入噪声,定义信噪比
amp=sqrt(2*10^(snr/10));%根据信噪比求信号幅度

w=8000:100:20000;%测量信号的一组频率,单位Hz
Fs=50000;%采样频率,单位Hz
N=Fs/100;%保证测量信号进DFT时频率对应整数k
k0=w(1)/Fs*N;%起始频率所对应DFT中的k

b=[0.0002, 0.0002, -0.0010, -0.0006, 0.0023, 0.0009, -0.0036, -0.0004, 0.0042, -0.0004, -0.0036, 0.0009, 0.0023, -0.0006, -0.0010, 0.0002, 0.0002];
a=[1.0000, 2.6750, 7.8559, 13.6147, 23.8512, 30.8819, 39.6410, 40.2748, 40.3641, 32.5164, 25.8590, 16.1752, 10.0665, 4.5598, 2.1127, 0.5578, 0.1695];
ww=(0:0.005*pi:pi);

hfm=freqz(b,a,ww);%用库函数求待测系统的幅频响应
plot(ww*Fs/2/pi/1000,20*log10(abs(hfm)));grid on;
title('待测系统的幅频响应','fontsize',14);ylim([-100 1]);
xlabel('kHz','fontsize',14);ylabel('dB','fontsize',14);

%% 

for l=1:length(w)
 x=amp*cos(2*pi*w(l)/Fs*(0:(4*N-1))')+randn(4*N,1);%产生测量信号
 y=filter(b,a,x);%获得系统输出信号
 fy=fft(y(N+1:2*N));%去除暂态
 hf2(l)=2*fy(k0+l)/(amp*N)*exp(-1i*N*(k0+l-1)/N*2*pi);%计算系统频率响应
% hf2(l)=2*fy(k0+l)/(amp*N);%计算系统频率响应
end

%%
% %构造实的h(n)
% hf(1:k0)=0;
% hf(k0+1:k0+length(w))=hf2;
% hf(k0+length(w)+1:N/2+1)=0;
% hf(N/2+2:N)=conj(hf(N/2:-1:2));%频率响应具有共轭对称性
% figure;plot(w/1000,20*log10(abs(hf2)));
% title('测量系统的幅频响应','fontsize',14);grid on;ylim([-90 1]);
% xlabel('kHz','fontsize',14);ylabel('dB','fontsize',14);
% hc=real(ifft(hf));%所得系统为实系统
% %比较测量所得系统与已知系统的频率响应误差
% N1=Fs/50;%频谱分辨率为50Hz
% hff=fft(hc,N1);%求测量得到的系统频率响应
% w1=(11000:Fs/N1:18000);%通带内的一组频率
% hf11=freqz(b,a,w1/Fs*2*pi);%求待测系统的频率响应
% hf22=hff(w1*N1/Fs+1);
% figure;
% plot(w1/1000,20*log10(abs(hf22))-20*log10(abs(hf11)));grid on;
% xlabel('kHz','fontsize',14);ylabel('dB','fontsize',14);
% title('通带内系统幅频响应误差','fontsize',14);
% figure;
% plot(w1/1000,unwrap(angle(hf22))/pi*180-unwrap(angle(hf11))/pi*180);grid on;
% xlabel('kHz','fontsize',14);ylabel('度','fontsize',14)
% title('通带内系统相频响应误差','fontsize',14);