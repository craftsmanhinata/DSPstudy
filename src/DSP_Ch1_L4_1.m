%案例名称：利用MATLAB库函数求解有限冲击响应滤波器的输出
%一、案例背景：有限冲击响应（FIR）滤波器属于线性时不变系统，其最大的特点是频率响应具备线性相位，
%因此FIR滤波器在信号滤波中得到了广泛的应用。
%二、原理描述：求解FIR滤波器的输出可以利用MATLAB库函数中的卷积函数conv。
%三、实例描述：本案例是在讲解第一章第一节离散时间系统分析中讲解LTI系统输入输出之间的关系时介绍的。
%首先产生一个正弦信号，令其通过一个FIR低通滤波器，观察系统的输出，
%其次产生两个正弦信号，一个频率在系统的通带内，一个信号的频率在系统阻带，观察系统输出。

clear;%清里内存
close all   ;%关闭所有图像
x=sin(2*pi*0.4*(0:127)/10);%产生单载波正弦信号
figure;plot(0:127,x);xlim([0 127]);grid on; 
xlabel('n','fontsize',14);ylabel('x(n)','fontsize',14);
title('系统输入信号x(n)','fontsize',14);

h(1:10)=(1:10);
h(11)=11;
h(12:21)=(10:-1:1);%产生系统单位脉冲序列
figure;plot(0:20,h);ylim([0 11]);grid on; 
xlabel('n','fontsize',14);ylabel('h(n)','fontsize',14);
title('系统单位脉冲响应h(n)','fontsize',14);

hf=freqz(h,1,1024);%求系统频率响应
xf=freqz(x,1,1024);%求输入信号频谱
figure;
subplot(2,1,1);plot((0:1023)*10/2048,20*log10(abs(hf)/max(abs(hf))));grid on; 
xlabel('kHz','fontsize',14);ylabel('系统频率响应','fontsize',12);
title('系统频率响应','fontsize',14);

subplot(2,1,2),plot((0:1023)*10/2048,20*log10(abs(xf)/max(abs(xf))));grid on;
xlabel('kHz','fontsize',14);ylabel('输入信号频谱','fontsize',12);
title('输入信号频谱','fontsize',14);

y=conv(h,x);%利用卷积求系统输出
figure;plot(0:147,y);grid on; xlim([0 147]);grid on;
xlabel('n','fontsize',14);ylabel('y(n)','fontsize',14);
title('系统输出','fontsize',14);

yf=freqz(y,1,1024);%求输出信号频谱
figure;
plot((0:1023)*10/2048,20*log10(abs(yf)/max(abs(yf))));grid on; 
xlabel('kHz','fontsize',14);ylabel('系统频率响应','fontsize',12);
title('输出信号频谱','fontsize',14);

x=sin(2*pi*0.3*(0:127)/10)+sin(2*pi*2.4*(0:127)/10);%产生两个正弦信号
figure;plot(0:127,x);xlim([0 127]);grid on; 
xlabel('n','fontsize',14);ylabel('x(n)','fontsize',14);
title('系统输入信号x(n)','fontsize',14);

h(1:20)=(1:20);h(21)=21;h(22:41)=(20:-1:1);%产生系统单位脉冲序列（长度变长）
figure;plot(0:40,h);ylim([0 21]);grid on; 
xlabel('n','fontsize',14);ylabel('h(n)','fontsize',14);
title('系统单位脉冲响应h(n)','fontsize',14);

hf=freqz(h,1,1024);%求系统频率响应
xf=freqz(x,1,1024);%求输入信号频谱
figure;
subplot(2,1,1);plot((0:1023)*10/2048,20*log10(abs(hf)/max(abs(hf))));grid on;
xlabel('kHz','fontsize',14);ylabel('系统频率响应','fontsize',12);title('系统频率响应','fontsize',14);

subplot(2,1,2),plot((0:1023)*10/2048,20*log10(abs(xf)/max(abs(xf))));grid on;
xlabel('kHz','fontsize',14);ylabel('输入信号频谱','fontsize',12);title('输入信号频谱','fontsize',14);

y=conv(h,x);%利用卷积求系统输出
figure;plot(0:167,y);grid on; xlim([0 167]);grid on; 
xlabel('n','fontsize',14);ylabel('y(n)','fontsize',14);
title('系统输出','fontsize',14);

yf=freqz(y,1,1024);%求输出信号频谱
figure;
plot((0:1023)*10/2048,20*log10(abs(yf)/max(abs(yf))));grid on; 
xlabel('kHz','fontsize',14);ylabel('系统频率响应','fontsize',12);
title('输出信号频谱','fontsize',14);