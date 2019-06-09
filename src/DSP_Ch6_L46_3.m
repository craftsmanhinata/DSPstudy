%本程序利用等波纹最佳逼近法设计带阻滤波器。
clc;
clear;
close all;

f=[0.28,0.32,0.6,0.66];
m=[1,0,1]; 
alphap=1;
alphas=50; 
delta1=10^(alphap/20-1)/(alphap/20+1); 
delta2=10^(-alphas/20); 
rip=[delta1,delta2,delta1]; 
[L,fo,mo,w]=remezord(f,m,rip); 
hn=remez(L,fo,mo,w); 
H=abs(fft(hn,256))/max(abs(fft(hn,256))); 
figure(1);
subplot(1,2,1);plot(hn);xlabel('n');ylabel('h(n)'); 
subplot(1,2,2);plot((0:127)/128,20*log10(abs(H(1:128))));grid;
xlabel('\omega/\pi'); ylabel('20lg|H(\omega)|');