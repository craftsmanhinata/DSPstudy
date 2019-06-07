% ����������
%(һ)����˵�� ��������Ҫ���ڴ��������FIR����������
clc;
clear;
close all; 

N = 91;    % �˲����ĳ���
M = (N-1)/2; 
n = -M:2:M; %n��ȡֵ
h(1:N) = 0; 
h(1:2:end) = 2./(pi*n);% nΪż��ʱh(n)��ֵ��nΪ����ʱh(n)=0 
fh=fft(h,512); 
figure; 
plot((0:255)/512*2,20*log10(abs(fh(1:256))),'linewidth',1.5);
grid on; 
xlabel('\omega/\pi');
ylabel('|H(e^{j\omega})|(dB)');
title('90������FIR��������Ƶ����'); 

figure; 
plot((0:255)/512*2,unwrap(angle(fh(1:256)))/pi*180,'linewidth',1.5);
grid on; 
xlabel('\omega/\pi');
ylabel('Arg(e^{j\omega})');
title('90������FIR��������Ƶ��Ӧ');