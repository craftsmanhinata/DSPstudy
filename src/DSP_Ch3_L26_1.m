% 频谱分析之栅栏现象
% 一、案例背景 频谱监测设备对带宽内的信号进行实时频谱计算，当发现目标信号后往往要估计它的频率，
% 便于进一步分析该信号。如利用估计出的频率对该信号进行数字下变频，然后分析其调制方式；
% 利用估计出的频率对该信号实施同步等。对于许多应用而言，频率估计的精度直接影响了后端处理的性能，
% 为此需要合理选择频谱分析的参数，以获得较高的频率估计精度。
% 二、原理描述 利用DFT进行频谱分析，序列x(n)隐含被矩形窗截断成为新序列，
% 求出的DFT是对y(n)的SFT的等间隔采样，不是对原序列SFT的等间隔采样。
% SFT频谱的分辨率决定了谱分析能够区分的两个频率的最小间隔，称为模拟频谱分辨率F=Fs/N，它是窗函数主瓣宽度的一半。
% 当两个频率的间隔大于SFT频谱分辨率时，它们是可分的，而且通过增加DFT点数可以减少栅栏效应，提高频率估计精度。
close all;
clear;

samples=150;FFTN=2048;%信号持续点数及FFT点数
n=0:samples-1; 
Fs=100;%采样频率(kHz)
f1=15.1;f2=16.2;f3=20.5;%信号频率(kHz)
x=sin(2*pi*f1/Fs*n)+2*sin(2*pi*f2/Fs*n)+sin(2*pi*f3/Fs*n); 
fx=fft(x,FFTN);%设定FFT点数为FFTN
df=Fs/samples;%模拟频谱分辨率
dk=floor(df/Fs*FFTN);%与之对应的k 
if dk==0         
    dk=1;  
end
fx1=fx(1:FFTN/2); %实信号只需在0≤k<N/2范围内寻找极大值
[m,n]=max(abs(fx1));%寻找最大值
f1=(n-1)/FFTN*Fs;%第一个估计出的频率
fx1(n-dk:n+dk)=0;
[m,n]=max(abs(fx1));%寻找次大值
f2=(n-1)/FFTN*Fs;%第二个估计出的频率
fx1(n-dk:n+dk)=0;
[m,n]=max(abs(fx1));%寻找第三大值
f3=(n-1)/FFTN*Fs;%第三个估计出的频率
[f1 f2 f3] 
figure; 
plot((0:FFTN/2-1)/FFTN*Fs,20*log10((abs((fx(1:FFTN/2))))),'b','LineWidth',2);
grid on; 
xlabel('kHz','fontsize',12);
ylabel('|X(e^j\omega)|','fontsize',12);
axis([0 50 -10 50]);
