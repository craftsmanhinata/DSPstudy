close all;
clear;

clear;%清除内存
close all   ;%关闭所有图形
filename1='../resource/canon.wav'; 
info = audioinfo(filename1);
[s1,fs]=audioread(filename1);%读取音乐信号，采样频率为fs


%改变dfN可以观察DFT点数对提高频谱分辨率的作用 
dfN=1024;%每段信号的长度，也就是窗长度
dd=819200/dfN; 

for i=1:dd         
    y(i,:)=x(1+dfN*(i-1):dfN*i);%将数据分段        
    xf1(i,:)=20*log10(abs(fft(y(i,:))));  
end

m=(1:dd)/20;n=(0:dfN-1)*200/dfN;%瀑布图的坐标
figure;
mesh(n,m,xf1);
xlabel('kHz','fontsize',12);ylabel('t',   'fontsize',12); %降低采样频率对提高频谱分辨率的作用
x1=x.*exp(-2*1i*pi*135/200*(1:length(x))); %频谱向下搬移135kHz
h(1:5)=0.2; %滤波器
y1=filter(h,1,x1);
y2=filter(h,1,y1(6:length(y1))); 
y3=filter(h,1,y2(6:length(y2)));
y4=filter(h,1,y3(6:length(y3)));
y5=filter(h,1,y4(6:length(y4))); 
y=y5(6:5:length(y5)); %保留了话音信号
for i=1:150     
    xf(i,:)=20*log10(abs(fft(y(1+1024*(i-1):1024+1024*(i-1))))); %DFT点数1024 
end

m=(1:150)/10;n=(0:1023)*40/1024;%采样频率降为40kHz
figure;
mesh(n,m,xf); 
xlabel('kHz','fontsize',12);
ylabel('t',   'fontsize',12);

