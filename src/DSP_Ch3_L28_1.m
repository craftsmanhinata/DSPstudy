% 内插前后序列的频谱
% 一、程序说明 本程序将序列x(n) 3倍内插，比较内插前后的频谱。
close all;
clear;

x=[0:7 8 7:-1:0];%低采样速率的序列
I=3;%内插因子
y=zeros(1,I*length(x));
y(1:I:length(y))=x;%内插后的序列
fx=fft(x,512);%设定FFT点数为512 
fy=fft(y,512);

figure;plot((0:511)/512*2,20*log10(abs(fx)),'linewidth',2);
xlabel('\omega/\pi','fontsize',12); ylabel('|X(e^{j\omega})|', 'fontsize',12);
grid on; 

figure;plot((0:511)/512*2,20*log10(abs(fy)),'linewidth',2);
xlabel('\omega/\pi','fontsize',12);ylabel('|Y(e^{j\omega})|','fontsize',12);
grid on; 