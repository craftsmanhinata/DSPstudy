%程序名：零极点位置对幅频特性的影响
%本程序是讲解第二章第三节LTI离散时间系统的频域分析零极点位置对幅频响应影响的实例。
%通过改变已知系统的零极点位置，改变系统的幅频响应特性。

clear;%清除内存
close all;%关闭所有图形
z0 = 0.9;
p0 = 0.9;
z1=z0*exp(1i*0.4*pi);z2=z0*exp(-1i*0.4*pi); %设置系统的零点
p1=p0*exp(1i*0.2*pi);p2=p0*exp(-1i*0.2*pi); %设置系统的极点
z=[z1,z2]';
p=[p1,p2]';
figure;zplane(z,p);grid on;%画出系统的零极点图
title('系统的零极点图','fontsize',14);

[b,a]=zp2tf(z,p,1);%根据零极点求系统函数的系数
w=0:0.005*pi:pi;
h=freqz(b,a,w);%求系统的频率响应
hmax=max(abs(h));
w=w/pi; 
figure;
plot(w,20*log10(abs(h)/hmax));grid on;
xlabel('\omega/\pi','fontsize',14);ylabel('幅度(dB)','fontsize',14);
title('系统的频率响应','fontsize',14);