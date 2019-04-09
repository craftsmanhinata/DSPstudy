% 程序名：DFT 点数的影响
% 本程序是讲解第三章第二节DFT定义时的实例。对同一个序列，做不同点的DFT结果不同， 
% 原因是在原信号的 SFT 上采样间隔不同得到的结果。

clear;
close all;
x(1:4)=1;%产生R4(n);

xsft=fft(x,1024);%求R4(n)的SFT
x4f=fft(x,4);%求4点DFT
x64f=fft(x,64);%求8点DFT
x256f=fft(x,256);%求32点DFT

figure;

subplot(3,1,1);
plot((0:1023)/512,abs(xsft));
grid on;
hold on;
xlim([0 1023/512]);
grid on;hold on; 
stem((0:256:1023)/512,abs(x4f),'r');
xlabel('\omega/\pi','fontsize',14);ylabel('幅度(dB)','fontsize',14);

subplot(3,1,2),plot((0:1023)/512,abs(xsft));
grid on;hold on;xlim([0 1023/512]);
stem((0:16:1023)/512,abs(x64f),'r')
xlabel('\omega/\pi','fontsize',14);ylabel('幅度(dB)','fontsize',14);

subplot(3,1,3),plot((0:1023)/512,abs(xsft));
grid on;hold on;xlim([0 1023/512]);
stem((0:4:1023)/512,abs(x256f),'r')
xlabel('\omega/\pi','fontsize',14);ylabel('幅度(dB)','fontsize',14);