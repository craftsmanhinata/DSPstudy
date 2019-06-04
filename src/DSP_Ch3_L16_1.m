%程序名：DFT与SFT的关系
%一、程序说明：本程序是讲解第三章第二节DFT定义时的实例。强调DFT与SFT的关系。
clear;
close all;
N=16;
x=exp(1i*2*pi/8*(0:N-1));%产生x(n);
xsft=fft(x,1024);%求x（n)的SFT
xf=fft(x,N);%求N点DFT 
figure;plot((0:1023)/512,abs(xsft));grid on;hold on;
stem((0:64:1023)/512,abs(xf),'r'  );%画出DFT图
xlabel('\omega/\pi'   ,'fontsize',14);ylabel('幅度(dB)','fontsize',14);
xlim([0 1023/512]);