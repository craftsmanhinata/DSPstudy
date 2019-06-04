%一、案例背景  宽带频谱监测设备需要对带宽内的信号进行实时频谱计算，以避免丢失信号。
%  当带宽内有许多功率较大的持续信号时，如果频谱分析使用的参数不正确，
%  容易使功率较小的信号被其附近的强信号泄漏出来的能量所掩盖，从而无法被检测出来如图1所示。
%  本案例从增加信号持续时间和改变窗函数两方面入手，根据实际需求合理选择频谱分析的参数，避免上述情况发生。
%三、案例描述  本案例使用的信号是200kHz带宽内的6个信号，其中5个为持续存在的信号，
%  分别是莫尔斯电报（载波约30kHz）、中央人民广播电台（75kHz）、话音信号（140kHz）、
%  8FSK（50kHz，频差500Hz，200Bd）、2FSK（90kHz，频差2kHz, 40Bd）；
%  1个单频短时弱信号（137kHz），在话音信号附近。
%  数据输入格式是浮点的I、Q两路，采样频率Fs=200kHz。
%  在对上述信号进行频谱分析时，分别选择以下参数：
%    1、矩形窗，长度N=4096；2、汉明窗，长度N=512；3、布莱克曼窗，长度N=512；
clear;
close all;

len=819200; 
fidr=fopen('suju4r.dat','r'   ); 
fidi=fopen('suju4i.dat','r'   ); 
datar=fread(fidr,len,'float'); 
datai=fread(fidi,len,'float'); 
fclose(fidr); 
fclose(fidi); 
x=datar.'+1i*datai.';%从数据文件中读出5个持续信号

dfN=512;%每段信号的长度，也就是窗长度
dd=819200/dfN; 
for i=1:dd         
    y(i,:)=x(1+dfN*(i-1):dfN*i);%将数据分段
end

for i=900:1200 
    y(i,:)=y(i,:)+0.1*(cos(2*pi*137/200*(1+dfN*(i-1):dfN*i))+...
        +1i*sin(2*pi*137/200*(1+dfN*(i-1):dfN*i)));%加短时信号
end

for i=1:dd 
    %  y(i,:)=y(i,:).*(0.54-0.46*cos(2*pi*(0:dfN-1)/(dfN-1)));%加汉明窗或布莱克曼窗
    %  y(i,:)=y(i,:).*(0.42-0.5*cos(2*pi*(0:dfN-1)/(dfN-1))+0.08*cos(4*pi*(0:dfN-1)/(dfN-1)));        
    xf1(i,:)=20*log10(abs(fft(y(i,:))));  
end

m=(1:dd)/20;n=(0:dfN-1)*200/dfN;%瀑布图的坐标
figure;
mesh(n,m,xf1);
xlabel('kHz','fontsize',12);ylabel('t',   'fontsize',12);