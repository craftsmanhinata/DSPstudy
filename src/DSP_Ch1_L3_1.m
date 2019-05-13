% conv函数，求序列过系统后的输出。
clear;%清除内存
close all;

%离散信号，128点
x=sin(2*3.14*0.4*(0:127)/10);

%线性系统
h(1:10)=(1:10);
h(11)=11;
h(12:21)=(10:-1:1);

[hf,hw]=freqz(h,1,1024);%求频谱
[xf,xw]=freqz(x,1,1024*1024);

%卷积
y=conv(h,x);
%卷积后的结果
figure;plot(y);grid on;


figure;plot(hw/pi,20*log(abs(hf)));grid on;
figure;plot(xw/pi,20*log(abs(xf)));grid on;


%讲解freqz比较透彻：http://blog.sina.com.cn/s/blog_996d72620101hp0f.html 

