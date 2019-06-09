%本程序用频率采样法设计线性相位FIR低通滤波器;
clc;
clear;
close all;

N=21;              %频域采样点数
wd=0.15*pi;                %理想低通滤波器的截止频率
kc=ceil(wd*N/(2*pi));      %计算kc
Hg(1:N)=0;Hg(1:kc+1)=1;Hg(N-kc+1:N)=1;        %设置理想低通滤波器幅频函数
thetak=-(N-1)/N*pi*(0:N-1);      %计算低通滤波器的相频函数
Hd=Hg.*exp(1i * thetak);              %计算滤波器的频率响应
hn=ifft(Hd);              %得到滤波器的单位脉冲响应
M=512;                                    %设FFT的点数
hf=fft(hn,M);
H=abs(hf);                             %计算FIR滤波器的幅频特性
H1=20*log10(H/max(abs(H)));
thet=unwrap(angle(hf)); 
figure;stem(real(hn),'.');grid;xlabel('n');title('h(n)'); 
figure; subplot(2,1,1);plot((0:255)/256,H1(1:256));grid;
xlabel('\omega/\pi');title('20lg|H(\omega)|'); 
subplot(2,1,2);plot((0:255)/256,thet(1:256));grid;
xlabel('\omega/\pi');title('\theta(\omega)'); 