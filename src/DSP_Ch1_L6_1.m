%程序名：相关函数在噪声中检测信号的应用
%本程序是第一章第四节离散时间信号的相关性中讲解相关函数应用时举的实例。
%首先产生一路高斯白噪声（均值为零，方差为 1），
%然后在单载波信号上叠加上噪声，求被噪声污染后的信号自相关函数，观察相关函数在噪声中检测信号的应用情况。

clear;%清除内存
close all;%关闭所有图形
xn=randn(1,200);%产生高斯白噪声
r_nn=xcorr(xn,xn);
figure;
subplot(2,1,1),plot(0:199,xn);grid on;
title('噪声的时域图','fontsize',12);
ylabel('N(n)','fontsize',14);xlabel('n','fontsize',14);%标注xy轴坐标

subplot(2,1,2),plot(0:199,r_nn(200:399)/200);grid on;
title('噪声的自相关函数图','fontsize',12);
ylabel('rn(m)','fontsize',14);xlabel('m','fontsize',14);%标注xy轴坐标

SNR=7;%信噪比
A=sqrt(2*10^(SNR/10));%根据信噪比计算信号幅度
x1=A*sin(pi*0.165*(0:199));%％产生单载波信号
x=x1+randn(1,200);%信号加噪声
y=xcorr(x,x); %求x的自相关函数，长度为2N-1
y=y/200; %自相关函数幅度求平均(求功率)
figure;
subplot(3,1,1),plot(0:199,x1);grid on;
title('信号的时域图','fontsize',12);
ylabel('s(n)','fontsize',14);xlabel('n','fontsize',14);%标注xy轴坐标
subplot(3,1,2),plot(0:199,x);grid on;
title('信号加噪声时域图','fontsize',12);
ylabel('x(n)','fontsize',14);xlabel('n','fontsize',14);%标注xy轴坐标
subplot(3,1,3),plot(0:99,y(200:299));grid on;
title('信号加噪声的相关函数图','fontsize',12);
ylabel('r(m)','fontsize',14);xlabel('m','fontsize',14);%标注xy轴坐标