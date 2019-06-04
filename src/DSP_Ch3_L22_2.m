% 一、程序说明  本程序实现了用重叠保留法计算两个序列x(n)和h(n)的线性卷积。
% 若其中的短序列h(n)是某LTI系统的单位脉冲响应，长序列x(n)是该系统的输入，本程序计算了系统的输出y(n)。
% 二、程序清单
close all;
clear;

xk=[1 2 3 4 5];%子序列
h=[1 2 1];%短序列
N=5;M=3;%长度
for k=1:6         
    x((k-1)*N+1:k*N)=xk;%长序列
end
Hk=fft(h,N+M-1);%短序列的DFT

y=zeros(1,M+N*6-1);%规定线性卷积序列的总长度
overlap=zeros(1,M-1);%向前重复取的数据
y(1:N+M-1)=ifft(fft([overlap x(1:N)],N+M-1).*Hk);
y(1:N)=y(M:N+M-1);%舍弃前M-1点

for k=2:6         
    overlap=x((k-1)*N-M+2:(k-1)*N);%向前重复取的数据        
    yk=ifft(fft([overlap  x((k-1)*N+1:k*N)],N+M-1).*Hk);          
    y((k-1)*N+1:k*N)=yk(M:N+M-1);%舍弃前M-1点
end

k=k+1; 
overlap=x((k-1)*N-M+2:(k-1)*N);
yk=ifft(fft([overlap zeros(1,N)],N+M-1).*Hk); 
y((k-1)*N+1:k*N)=yk(M:N+M-1);%舍弃前M-1点

figure; stem(0:length(y)-1,y,'b.','linewidth',2); 
xlabel('n','fontsize',12);ylabel('y(n)','fontsize',12);