% 数字下变频器
% 一、程序说明 本程序按照图1所示的原理框图，实现了将输入信号中所含调幅信号变频至零中频同时降低其采样频率，并滤除输入信号中所含的单频干扰。
clear;
close all;

Fs=4000;%采样频率(kHz)
fm=10;f1=200;f2=235;%信号所包含的调制频率及载波频率(kHz)
f0=f1;%NCO的频率
n=4096;%样点数
D=20;%抽取因子
x=((1+0.5*sin(2*pi*fm/Fs*(0:n-1))).*sin(2*pi*f1/Fs*(0:n-1))+0.4*sin(2*pi*f2/Fs*(0:n-1))); 
fx=fft(x); 
figure; 
subplot(2,1,1);plot(x(1:100),'b','LineWidth',2);grid on;
xlabel('n');ylabel('x(n)');title('抽取前的序列'); 
subplot(2,1,2);plot((0:n-1)/n*Fs,20*log10(abs(fx)),'b','LineWidth',2);grid on; 
xlabel('kHz');ylabel('dB');title('抽取前序列的幅频特性'); 

nf=exp(-1i*2*pi*f0/Fs*(0:n-1)); 
x1=x.*nf; 
fx1=fft(x1); 
figure; plot((0:n-1)/n*Fs,20*log10(abs(fx1)),'b','LineWidth',2);grid on; 
xlabel('kHz');ylabel('dB');title('零中频的幅频特性'); 

cicb=1/D*ones(1,D); 
x2=conv(cicb,x1); 
fx2=fft(x2(D:length(x2)-D),n); 
figure; plot((0:n-1)/n*Fs,20*log10(abs(fx2)),'b','LineWidth',2);grid on; 
xlabel('kHz');ylabel('dB');title('CIC滤波后的幅频特性');
x3=x2(D:D:length(x2)-D);%去暂态并抽取
fx3=fft(x3); 
figure; plot((0:length(x3)-1)/length(x3)*(Fs/D),20*log10(abs(fx3)),'b'   ,'LineWidth',2);grid on; 
xlabel('kHz');ylabel('dB');title('抽取后序列的幅频特性'); 

b=fir1(31,20/50);
x5=conv(b,x3);
x4=x5(32:length(x5)-32);
fx4=fft(x4); 
figure; 
subplot(2,1,1);plot(real(x4),'b','LineWidth',2);grid on; 
xlabel('n');ylabel('y(n)');title('抽取后的序列'); 
subplot(2,1,2);plot((0:length(x4)-1)/length(x4)*(Fs/D),20*log10(abs(fx4)),'b','LineWidth',2);grid on;
xlabel('kHz');ylabel('dB');title('数字下变频输出信号的幅频特性');