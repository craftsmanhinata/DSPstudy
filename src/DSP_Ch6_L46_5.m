%���õȲ�����ѱƽ������22��FIRϣ�����ر任��

clc;
clear;
close all;
N=23;
f=[0.3,0.7]; 
m=[1,1];
hn=remez(N-1,f,m,'hilbert');
hf=fft(hn,512);
H=abs(hf);
P=unwrap(angle(hf));
P=P/pi;
subplot(1,3,1);stem((0:N-1),hn,'.');grid; xlabel('n');title('h(n)');
subplot(1,3,2);plot((0:511)/256,H);grid; xlabel('\omega/\pi'); title('|H(e^j^\omega)|'); 
subplot(1,3,3);plot((0:511)/256,P);grid; xlabel('\omega/\pi'); title('��λ/\pi');