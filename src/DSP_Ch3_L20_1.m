%程序名：频域采样
%本程序是讲解第三章第五节频域采样时的实例。
%对某一信号的 SFT 进行不同点数的采样，观察其对应的时域波形和 SFT。

clear;%清除内存
close all;%关闭所有图形

x=[1 2 3 4 5 6 7 8 9 10 10 9 8 7 6 5 4 3 2 1];%产生信号
xf=fft(x,2048);%求信号的近似SFT
y1f=xf(1:64:2048); %在SFT上采样32点 
y2f=xf(1:128:2048); %在SFT上采样16点

y1=ifft(y1f);%求y1(n)
y1sft=fft(y1,2048);%求32点采样后的SFT

y2=ifft(y2f);%求y2(n)
y2sft=fft(y2,2048);%求16点采样后的SFT

figure;
subplot(3,1,1),stem(0:19,x);grid on;
xlabel('n','fontsize',12);ylabel('x(n)','fontsize',12);
subplot(3,1,2),plot((0:2047)/1024,abs(xf));grid on;hold on;
stem((0:64:2047)/1024,abs(y1f),'r');ylim([0 110]);
xlabel('\omega/\pi','fontsize',14);ylabel('幅度(dB)','fontsize',12);
xlim([0 2048/1024]);
% title('对SFT32点采样','fontsize',12);
subplot(3,1,3),stem(0:31,y1);grid on;ylim([0 10]);
xlabel('n','fontsize',12);ylabel('y1(n)','fontsize',12);

figure;
subplot(3,1,1),stem(0:19,x);grid on;
xlabel('n','fontsize',14);ylabel('x(n)','fontsize',14);
subplot(3,1,2),plot((0:2047)/1024,abs(xf));grid on;hold on; 
stem((0:128:2047)/1024,abs(y2f),'r');ylim([0 110]);
xlabel('\omega/\pi','fontsize',14);ylabel('幅度(dB)','fontsize',14);
xlim([0 2048/1024]);
% title('对SFT16点采样','fontsize',14);
subplot(3,1,3),stem(0:15,y2);grid on;
xlabel('n','fontsize',14);ylabel('y2(n)','fontsize',14);
 
figure;
plot((0:2047)/1024,abs(y1sft),'b',(0:2047)/1024,abs(y2sft),'r');
grid on;hold on;
stem((0:128:2047)/1024,abs(y2f),'black');ylim([0 110]);
xlabel('\omega/\pi','fontsize',14);ylabel('幅度(dB)','fontsize',14);
xlim([0 2048/1024]);title('不同采样点对应的SFT','fontsize',14);
legend('32点SFT','16点SFT');
 