%频率采样法设计一阶数为23的线性相位的全频带数字微分器
clc;
clear;
close all;

N=24;    %频域采样点数
Hg(1:N)=0;
for i=1:N/2
    Hg(i)=i-1;
    Hg(N-i+1)=i;
end        %设置理想低通滤波器幅频函数

thetak=-pi/2-(N-1)/N*pi*(0:N-1);  %计算低通滤波器的相频函数
Hd=Hg.*exp(1i* thetak);    %计算滤波器的频率响应

hn=ifft(Hd); %得到滤波器的单位脉冲响应
M=256; %设FFT的点数
hf=fft(hn,M);
H=abs(hf);   %计算FIR滤波器的幅频特性
H1=20*log10(H/max(abs(H)));
thet=unwrap(angle(hf)); 
figure;stem(real(hn));grid;xlabel('n');ylabel('h(n)'); 
figure;subplot(2,1,1);plot((0:255)/512,H1(1:256));grid; 
xlabel('\omega/\pi');ylabel('20lg|H(\omega)|'); 
subplot(2,1,2);plot((0:255)/512,thet(1:256));grid;
xlabel('\omega/\pi');ylabel('\theta(\omega)');