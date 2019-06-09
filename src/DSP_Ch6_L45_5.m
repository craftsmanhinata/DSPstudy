%各种函数设计FIR滤波器
%(一)程序说明  本程序利用fir1设计一个具有如下指标的线性相位FIR高通滤波器：
%  阻带截止频率为0.4π，通带起始频率为0.55π，最大通带衰减为0.1dB，最小阻带衰减为42dB。
%  分别利用下面窗函数来设计滤波器：汉明窗、汉宁窗、布莱克曼窗和凯塞窗。
%  对于每种情况，给出其脉冲响应系数并画出设计的滤波器的幅频响应。
clc;
clear;
close all;

ws=0.4*pi;wp=0.55*pi;
wd=0.5*(wp+ws);      %计算理想低通滤波器的通带截止频率
Bt=abs(wp-ws);         %计算过渡带
alphas=42; 

N1=ceil(8*pi/Bt); %计算汉宁窗的长度
%!!!!!!!!!高通、带阻滤波器阶数（窗长-1）只能为偶数，否则会在pi处有一个零点，不符合要求!!!!!!!!!
N1 = N1+1-mod(N1,2);
hhan=fir1(N1-1,wd/pi,'high',hann(N1)); %调用fir1计算高通FIR滤波器,滤波器的阶数为窗长-1
HHan=fft(hhan,512); 

N2=ceil(8*pi/Bt); %计算汉明窗的长度
N2 = N2+1-mod(N2,2);
hhm=fir1(N2-1,wd/pi,'high'); %调用fir1计算高通FIR滤波器
HHm=fft(hhm,512); 

N3=ceil(12*pi/Bt); %计算布莱克曼窗的长度
N3 = N3+1-mod(N3,2);
hb=fir1(N3-1,wd/pi,'high',blackman(N3)); %调用fir1计算高通FIR滤波器
HHb=fft(hb,512); 

beta=0.5842*(alphas-21)^0.4+0.07886*(alphas-21); % 凯塞窗控制参数
N4=ceil((alphas-8)/(2.285*Bt));
N4 = N4+1-mod(N4,2);
hks=fir1(N4-1,wd/pi,'high',kaiser(N4,beta)); %调用fir1计算高通FIR滤波器
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