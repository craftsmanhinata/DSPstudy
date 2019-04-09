clear;
close all;

%差分方程系数
a0=1;
a1=-0.7;
b0=1.5;
%系统初始条件
ys=1;

xn=[1,zeros(1,30)];
B=b0;
A=[a0,a1];
xi=filtic(B,A,ys);%xi是等效初始条件的输入序列
yn=filter(B,A,xn,xi);%求解系统输出y(n)
 
figure;stem(0:30,yn);grid on;
title('初始条件y(-1)=1时,系统输出', 'fontsize', 14 );
ylabel('y(n)','fontsize', 14 );xlabel('n','fontsize', 14 );

%差分方程系数
a0=1;
a1=-0.7;
b0=1.5;

xn=[1,zeros(1,30)];
B=b0;
A=[a0,a1];
yn=filter(B,A,xn);%求解系统输出y(n)
 
figure;stem(0:30,yn);grid on;
title('初始条件y(-1)=0时,系统输出', 'fontsize', 14 );
ylabel('y(n)','fontsize', 14 );xlabel('n','fontsize', 14 );