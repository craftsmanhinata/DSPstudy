%一、程序说明 本程序实现了用重叠相加法计算两个序列x(n)和h(n)的线性卷积。
%  若其中的短序列h(n)是某LTI系统的单位脉冲响应，长序列x(n)是该系统的输入，本程序计算了系统的输出y(n)。
%二、程序清单
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
y(1:N+M-1)=ifft(fft(x(1:N),N+M-1).*Hk); 

for k=2:6         
    yk=ifft(fft(x((k-1)*N+1:k*N),N+M-1).*Hk);
    y((k-1)*N+1:(k-1)*N+M-1)=yk(1:M-1)+y((k-1)*N+1:(k-1)*N+M-1);%重叠相加
    y((k-1)*N+M:k*N+M-1)=yk(M:N+M-1);  
end

figure; stem(0:length(y)-1,y,'b.','linewidth',2); 
xlabel('n','fontsize',12);ylabel('y(n)','fontsize',12);