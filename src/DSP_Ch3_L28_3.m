% AD9857应用仿真
% 一、案例背景  与数字下变频器的应用场合不同，如需要将基带信号搬移到较高的频率，需要使用数字上变频器。
%  本案例以Analog Devices公司的可编程单通道数字上变频器件AD9857为例，对低采样频率下的基带信号进行数字上变频处理。
% 三、案例描述本案例将载频为5kHz、采样频率为25kHz、调制频率为0.5kHz、调幅度30%的窄带调幅信号，
% 以150kHz为NCO的中心频率进行数字上变频，输出信号的采样频率升为2MHz，也即是内插倍数I=80。
% 根据AD9857对各级内插因子的限制以及内插滤波器的设计，选择I1=2、I2=2和I3=20。
close all;
clear;
Fs=25;%采样频率(kHz)
f1=5;%信号频率(kHz)
f0=150;%NCO的频率(kHz)
n=120;%样点数
x=(1+0.3*sin(2*pi*0.5/Fs*(0:n-1))).*sin(2*pi*f1/Fs*(0:n-1))+0.01*randn(1,n); 
fx=fft(x); 
figure;
subplot(2,1,1);plot(x,'b','LineWidth',2);grid on; 
xlabel('n','fontsize',12);ylabel('x(n)','fontsize',12);
title('内插前的序列','fontsize',12); 
subplot(2,1,2);plot((0:n-1)/n*Fs,20*log10(abs(fx)),'b','LineWidth',2);grid on;
xlabel('kHz','fontsize',12);ylabel('dB','fontsize',12); 
title('内插前序列的幅频特性','fontsize',12); 
I1=2;I2=2;I3=20;%内插因子
%%%%%%%%%%%%%%%% 
y1=zeros(1,I1*length(x)); 
y1(1:I1:length(y1))=x;%第一级内插后的序列
fy1=fft(y1); 
figure;
subplot(2,1,1); plot((0:length(y1)-1)/length(y1)*I1*Fs,20*log10(abs(fy1)),'b'   ,'LineWidth',2);grid on;
xlabel('kHz','fontsize',12);ylabel('dB','fontsize',12); 
title('插零后序列的幅频特性','fontsize',12); 

b1=I1*firhalfband('minorder',2*6.5/(Fs*I1),0.002);%设计滤波器
yf1=conv(b1,y1);
N=length(b1);
yf2=yf1(N:length(yf1)-N);%去除暂态响应
fyf1=fft(yf2); 
subplot(2,1,2); plot((0:length(yf2)-1)/length(yf2)*I1*Fs,20*log10(abs(fyf1)),'b','LineWidth',2);grid on;
xlabel('kHz','fontsize',12);ylabel('dB','fontsize',12); 
title('低通滤波后的幅频特性','fontsize',12); 
%%%%%%%%%%%%%%%%
y2=zeros(1,I2*length(yf2)); 
y2(1:I2:length(y2))=yf2;%第二级内插后的序列
fy2=fft(y2); 
figure;
subplot(2,1,1); plot((0:length(y2)-1)/length(y2)*I2*I1*Fs,20*log10(abs(fy2)),'b','LineWidth',2);grid on;
xlabel('kHz','fontsize',12);ylabel('dB','fontsize',12); 
title('插零后序列的幅频特性','fontsize',12);
b2=I2*firhalfband('minorder',2*6.5/(Fs*I1*I2),0.0002);%设计滤波器
yf3=conv(b2,y2); N=length(b2);
yf4=yf3(N:length(yf3)-N);%去除暂态响应
fyf2=fft(yf4);
subplot(2,1,2); plot((0:length(yf4)-1)/length(yf4)*I2*I1*Fs,20*log10(abs(fyf2)),'b','LineWidth',2);grid on; 
xlabel('kHz','fontsize',12);ylabel('dB','fontsize',12); 
title('低通滤波后的幅频特性','fontsize',12); 
%%%%%%%%%%%%%%%%
y3=zeros(1,I3*length(yf4)); 
y3(1:I3:length(y3))=yf4;%第三级内插后的序列
fy3=fft(y3); 
figure;
subplot(2,1,1); plot((0:length(y3)-1)/length(y3)*I1*I2*I3*Fs,20*log10(abs(fy3)),'b','LineWidth',2);grid on; 
xlabel('kHz','fontsize',12);ylabel('dB','fontsize',12); 
title('插零后序列的幅频特性','fontsize',12); 
cb=1/I3*ones(1,I3);
b=conv(conv(conv(conv(cb,cb),cb),cb),cb);
b3=I3*b;%设计滤波器
N=length(b3);    
yf5=conv(b3,y3); 
yf6=yf5(N:length(yf5)-N);%去除暂态响应
fyf3=fft(yf6);
subplot(2,1,2); plot((0:length(yf6)-1)/length(yf6)*I1*I2*I3*Fs,20*log10(abs(fyf3)),'b','LineWidth',2); grid on;
xlabel('kHz','fontsize',12);ylabel('dB','fontsize',12); 
title('低通滤波后的幅频特性','fontsize',12); 
%%%%%%%%%%%%%%%%
y=yf6.*exp(1i*2*pi*f0/(I1*I2*I3*Fs)*(0:length(yf6)-1));%乘载频
fy=fft(y); 
figure;
subplot(2,1,1);plot(real(y(1:500)),'b','LineWidth',2);grid on; 
xlabel('n','fontsize',12);ylabel('x(n)','fontsize',12); 
title('数字上变频后的序列','fontsize',12);
subplot(2,1,2); 
plot((0:length(y)-1)/length(y)*I1*I2*I3*Fs,20*log10(abs(fy(1:length(y)))),'b','LineWidth',2); 
grid on;
xlabel('kHz','fontsize',12);ylabel('dB','fontsize',12); 
title('数字上变频输出信号的幅频特性','fontsize',12);