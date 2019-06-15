%本程序比较不同的采样间隔，用双线性变换法将模拟滤波器转换为数字滤波器后的幅频响应。
clc;
clear;
close all;

T=0.05; T1=0.02; 
b=[2,1]; a=[1,3,4]; 
w=0:0.1:10;
[h,w]=freqs(b,a,w);
[bz,az]=bilinear(b,a,1/T); %利用双线性变换法，采样频率为20
[bz1,az1]=bilinear(b,a,1/T1); %利用双线性变换法，采样频率为50
wz=0:0.01*pi:0.999*pi;
[hz,wz]=freqz(bz,az,wz);
[hz1,wz]=freqz(bz1,az1,wz);
wz=wz/pi;
figure;plot(w,20*log10(abs(h))); xlabel('kHz');ylabel('幅度（dB）');title('模拟滤波器幅频响应');grid on;
figure;plot(wz,20*log10(abs(hz)),wz,20*log10(abs(hz1)));
legend('T=0.05s','T=0.02s'); 
xlabel('\omega/\pi');ylabel('幅度（dB）');title('数字滤波器幅频响应');grid on;

figure;plot(wz/(2*T),20*log10(abs(hz)));
xlabel('hzi');ylabel('幅度（dB）');
%axis([0,10]);
set(gca,'XLim',[0 10]);

figure;plot(wz/(2*T1),20*log10(abs(hz1)));
xlabel('hz');ylabel('幅度（dB）');
%axis([0,10]);
set(gca,'XLim',[0 10]);