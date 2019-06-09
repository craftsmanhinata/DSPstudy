%本程序利用等波纹最佳逼近法设计具有两个通带的带通滤波器

clc;
clear;
close all;
fsl1=15;fpl1=20;fpu1=30;fsu1=35;
fsl2=60;fpl2=70;fpu2=85;fsu2=95;
Fs=200; 
f=[fsl1,fpl1,fpu1,fsu1,fsl2,fpl2,fpu2,fsu2]; 
m=[0,0.5,0,1,0]; 
alphap=1;
alphas=50;
delta1=10^(alphap/20-1)/(alphap/20+1); 
delta2=10^(-alphas/20); 
rip=[delta2,delta1,delta2,delta1,delta2]; 
[L,fo,mo,w]=remezord(f,m,rip,Fs); 
hn=remez(L,fo,mo,w); 
hf=fft(hn,512); 
H=20*log10(abs(hf)/max(abs(hf))); 
P=unwrap(angle(hf)); P=P/pi; 
figure; 
subplot(2,1,1);plot((0:255)/256*100,H(1:256));grid on;
xlabel('f(kHz)'); title('|H(e^j^\omega)|'); 
subplot(2,1,2), plot((0:255)/256*100,P(1:256));grid on; 
xlabel('f(kHz)'); title('相位/\pi');