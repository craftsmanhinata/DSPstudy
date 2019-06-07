% AD6620应用仿真
% 一、案例背景 随着软件无线电的广泛应用，许多信号处理的仪器或设备中都使用了数字下变频技术。
%  因为数字信号处理较模拟信号处理，具有稳定、灵活等特点，所以软件无线电的处理模式是尽可能地在靠近射频前端的节点处进行采样。
%  这种模式下，为了获得较好的处理性能采样频率往往很高。然而，采样频率高会增加系统的存储和计算压力，
%  也会增加后端数字滤波器的设计和实现难度。数字下变频技术的使用，能够在较低的采样频率下对目标信号实施处理。
%  本案例以Analog Devices公司的可编程单通道数字下变频器件AD6620为例，对接收到的高采样频率下的窄带信号进行数字下变频处理。
%  AD6620采用三级抽取级联，各级的抽取因子可分别设置为2~16、1~32和1~32之间的整数，
%  使用的抽取滤波器第一级是2级级联的CIC2，第二级是5级级联的CIC5，最后一级是阶数高达256且系数可设的FIR滤波器，原理框图如图1所示。
%三、案例描述  本案例将载频为41.404MHz、采样频率为40MHz、调制频率为1.4kHz、调幅度50%的窄带调幅信号，
%  以41.4MHz为NCO的中心频率进行数字下变频，输出信号的采样频率降为25kHz，也即是抽取倍数D=1600。
%  根据AD6620对各级抽取因子的限制以及抽取滤波器的设计，选择D1=8、D2=25和D3=8。

clear;
close all;
Fs=40000;%采样频率(kHz)
fm=1.4;f1=41404;%信号所包含的调制频率及载波频率(kHz)
f0=41400;%NCO的频率(kHz)
n=819200;%样点数
D1=8;D2=25;D3=8;%抽取因子
x=(1+0.5*sin(2*pi*fm/Fs*(0:n-1))).*sin(2*pi*f1/Fs*(0:n-1)); 
fx=fft(x(1:4096),4096); 
figure; plot((0:4095)/4096*Fs,20*log10(abs(fx)),'b','LineWidth',2);grid on; 
xlabel('kHz');ylabel('dB');
title('抽取前序列的幅频特性'); 

nf=exp(-1i*2*pi*f0/Fs*(0:n-1)); 
x1=x.*nf; 
fx1=fft(x1(1:4096),4096); 
figure; plot((0:4095)/4096*Fs,20*log10(abs(fx1)),'b','LineWidth',2);grid on;
xlabel('kHz');ylabel('dB');
title('零中频的幅频特性'); 

%%%%%%%%%%%%%第一级
cicb1=1/D1*ones(1,D1); 
x21=conv(cicb1,x1); 
x22=conv(cicb1,x21(D1:length(x21)-D1)); 
fx22=fft(x22(D1:4095+D1),4096); 
figure; plot((0:4095)/4096*Fs,20*log10(abs(fx22)),'b','LineWidth',2);grid on;
xlabel('kHz');ylabel('dB');
title('CIC滤波后的幅频特性');

x2=x22(D1:D1:length(x22)-D1);%去暂态并抽取
fx2=fft(x2(1:4096),4096); 
figure; plot((0:4095)/4096*(Fs/D1),20*log10(abs(fx2)),'b','LineWidth',2);grid on; 
xlabel('kHz');ylabel('dB');title('第一级抽取后序列的幅频特性'); 
%%%%%%%%%%%%%第二级
cicb2=1/D2*ones(1,D2);
x31=conv(cicb2,x2); 
x32=conv(cicb2,x31(D2:length(x31)-D2));
x33=conv(cicb2,x32(D2:length(x32)-D2)); 
x34=conv(cicb2,x33(D2:length(x33)-D2)); 
x35=conv(cicb2,x34(D2:length(x34)-D2)); 
fx35=fft(x35(D2:D2+4095),4096); 
figure; plot((0:4095)/4096*Fs,20*log10(abs(fx35)),'b','LineWidth',2);grid on; 
xlabel('kHz');ylabel('dB');
title('CIC滤波后的幅频特性'); 
x3=x35(D2:D2:length(x35)-D2);%去暂态并抽取
fx3=fft(x3,4096); 
figure; plot((0:4095)/4096*(Fs/D1/D2),20*log10(abs(fx3)),'b','LineWidth',2);grid on; 
xlabel('kHz');ylabel('dB');
title('第二级抽取后序列的幅频特性'); %%%%%%%%%%%%%第三级
b=fir1(255,10/100);
x41=conv(b,x3); 
x4=x41(256:D3:length(x41)-256);%去暂态并抽取
fx4=fft(x4,512); 
figure; subplot(2,1,1);plot(real(x4),'b','LineWidth',2);grid on; 
xlabel('n');ylabel('y(n)');
title('第三级抽取后的序列'); 
subplot(2,1,2);plot((0:511)/512*(Fs/D1/D2/D3),20*log10(abs(fx4)),'b','LineWidth',2);grid on;
xlabel('kHz');ylabel('dB');title('数字下变频输出信号的幅频特性');