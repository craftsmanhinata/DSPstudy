% 程序名：DFT循环移位性质
% 
% 本程序是讲解第三章第三节 DFT 循环移位性质时的实例。
% 强调时域循环移位，其离散傅里叶变换的幅频特性不变，相频特性发生了变化。

clear;%清除内存
close all;%关闭所有图形

x1=[1 2 3 4 4 3 2 1];%产生信号x1(n)
x2=[4 3 2 1 1 2 3 4];%x2(n)是x1(n)的循环移位

x1f=fft(x1,2048);%求信号频谱
x2f=fft(x2,2048);%求循环移位后信号频谱

figure;
plot((0:2047)/1024,abs(x1f));%求原信号SFT幅频特性
grid on;hold on; 
stem((0:256:2047)/1024,abs(x1f(1:256:2048)),'r');%求8点DFT幅频特性
xlabel('\omega/\pi','fontsize',14);ylabel('幅度','fontsize',14);
xlim([0 2048/1024]);title('8点DFT幅频特性','fontsize',14);

figure;
plot((0:2047)/1024,abs(x2f));%求信号移位后信号SFT幅频特性
grid on;hold on; 
stem((0:256:2047)/1024,abs(x2f(1:256:2048)),'r');%求循环移位后8点DFT幅频特性
xlabel('\omega/\pi','fontsize',14);ylabel('幅度','fontsize',14);
xlim([0 2048/1024]); title('8点DFT幅频特性','fontsize',14);

figure;
plot((0:2047)/1024,unwrap(angle(x1f)));%求原信号SFT相频特性
grid on;hold on; 
stem((0:256:2047)/1024,unwrap(angle(x1f(1:256:2048))),'r');%求8点DFT相频特性
xlabel('\omega/\pi','fontsize',14);ylabel('幅度','fontsize',14);
xlim([0 2048/1024]);title('8点DFT相频特性','fontsize',14);

figure;
plot((0:2047)/1024,unwrap(angle(x2f)));%求信号移位后信号SFT相频特性
grid on;hold on; 
stem((0:256:2047)/1024,unwrap(angle(x2f(1:256:2048))),'r');%求循环移位后8点DFT相频特性
xlabel('\omega/\pi','fontsize',14);ylabel('幅度','fontsize',14);
xlim([0 2048/1024]); title('8点DFT相频特性','fontsize',14);
 
figure;
plot((0:2047)/1024,abs(x1f));
grid on;hold on; 
stem((0:128:2047)/1024,abs(x1f(1:128:2048)),'r');%求16点DFT幅频特性
xlabel('\omega/\pi','fontsize',14);ylabel('幅度','fontsize',14);
xlim([0 2048/1024]);title('16点DFT幅频特性','fontsize',14);

figure;
plot((0:2047)/1024,abs(x2f));
grid on;hold on; 
stem((0:128:2047)/1024,abs(x2f(1:128:2048)),'r');%求循环移位后16点DFT幅频特性
xlabel('\omega/\pi','fontsize',14);ylabel('幅度','fontsize',14);
xlim([0 2048/1024]); title('16点DFT幅频特性','fontsize',14);