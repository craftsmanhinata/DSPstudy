% conv�����������й�ϵͳ��������
clear;%����ڴ�
close all;

%��ɢ�źţ�128��
x=sin(2*3.14*0.4*(0:127)/10);

%����ϵͳ
h(1:10)=(1:10);
h(11)=11;
h(12:21)=(10:-1:1);

[hf,hw]=freqz(h,1,1024);%��Ƶ��
[xf,xw]=freqz(x,1,1024*1024);

%���
y=conv(h,x);
%�����Ľ��
figure;plot(y);grid on;


figure;plot(hw/pi,20*log(abs(hf)));grid on;
figure;plot(xw/pi,20*log(abs(xf)));grid on;


%����freqz�Ƚ�͸����http://blog.sina.com.cn/s/blog_996d72620101hp0f.html 

