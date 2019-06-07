% 数字上变频器
Fs=50;%采样频率(kHz)
f1=5;%信号频率(kHz)
f0=150;%NCO的频率(kHz)
n=1024;%样点数

x=cos(2*pi*f1/Fs*(0:n-1));
fx=fft(x); 
figure;
subplot(2,1,1);plot(real(x(1:100)),'b'   ,'LineWidth',2);
grid on; xlabel('n','fontsize',12);ylabel('x(n)','fontsize',12);
title('内插前的序列','fontsize',12); 
subplot(2,1,2);plot((0:n-1)/n*Fs,20*log10(abs(fx)),'b','LineWidth',2);
grid on; xlabel('kHz','fontsize',12);ylabel('dB','fontsize',12);
title('内插前序列的幅频特性','fontsize',12); 

I=10;%内插因子
y1=zeros(1,I*length(x));
y1(1:I:length(y1))=x;%内插后的序列
fy1=fft(y1); 
figure; plot((0:length(y1)-1)/length(y1)*I*Fs,20*log10(abs(fy1)),'b','LineWidth',2);
grid on; xlabel('kHz','fontsize',12);ylabel('dB','fontsize',12);
title('插零后序列的幅频特性','fontsize',12); 

b=I*fir1(79,12/(Fs*I),blackman(80));%设计滤波器
y3=conv(b,y1); 
y2=y3(80:length(y3)-80);%去除暂态响应
fy2=fft(y2); 
figure; plot((0:length(y2)-1)/length(y2)*I*Fs,20*log10(abs(fy2)),'b','LineWidth',2);
grid on; xlabel('kHz','fontsize',12);ylabel('dB','fontsize',12);
title('低通滤波后的幅频特性','fontsize',12); 

y=y2.*exp(1i*2*pi*f0/(I*Fs)*(0:length(y2)-1));%乘载频
fy=fft(y); 
figure; 
subplot(2,1,1);plot(real(y(1:500)),'b'   ,'LineWidth',2);
grid on; xlabel('n','fontsize',12);ylabel('x(n)','fontsize',12); 
title('内插后的序列','fontsize',12);
subplot(2,1,2); 
plot((0:length(y)-1)/length(y)*I*Fs,20*log10(abs(fy(1:length(y)))),'b','LineWidth',2);
grid on; xlabel('kHz','fontsize',12);ylabel('dB','fontsize',12); 
title('数字上变频输出信号的幅频特性','fontsize',12); 