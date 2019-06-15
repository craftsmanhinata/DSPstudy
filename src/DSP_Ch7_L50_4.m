%本程序用双线性变换法设计IIR数字带通滤波器，采用切比雪夫II型低通滤波器原型。
%直接用MATLAB库函数用双线性变换法设计数字滤波器
clc;
clear;
close all;

Fs=20000;
fpl=2000;fpu=5000;
fsl=2500;fsu=4000;
Rp=1;Rs=40;
wpz=[2*fpl/Fs,2*fpu/Fs];wsz=[2*fsl/Fs,2*fsu/Fs];
[N1,Wpo]=ellipord(wpz,wsz,Rp,Rs);
[bz1,az1]=ellip(N1,Rp,Rs,Wpo,'stop');
w=0:0.01*pi:pi; 
[h,w]=freqz(bz1,az1,w); 

w=w/pi; 
figure;plot(w,20*log10(abs(h))); xlabel('\omega/\pi');ylabel('幅度（dB）'); grid on; 