%本程序利用Remez算法设计41阶线性相位FIR数字微分器。
%要求通带截止频率为0.6π，阻带截止频率为0.7π，并希望阻带逼近零。

clc;
clear;
close all;

N=42;
f=[0.0,0.6,0.7,1];
m=[0,1,0,0];
hn=remez(N-1,f,m,'defferetiator'); %调用remez函数设计FIR微分器
hf=fft(hn,512); H=abs(hf); 
P=unwrap(angle(hf)); P=P/pi; 
figure; 
subplot(1,2,1);stem(hn);grid;xlabel('n'); title('h(n)'); 
subplot(1,2,2);plot((0:255)/256,H(1:256));grid;xlabel('\omega/\pi'); title('|H(e^j^\omega)|');