%һ������˵�� ������ʵ�������ص���ӷ�������������x(n)��h(n)�����Ծ����
%  �����еĶ�����h(n)��ĳLTIϵͳ�ĵ�λ������Ӧ��������x(n)�Ǹ�ϵͳ�����룬�����������ϵͳ�����y(n)��
%���������嵥
close all;
clear;

xk=[1 2 3 4 5];%������
h=[1 2 1];%������
N=5;M=3;%����
for k=1:6
    x((k-1)*N+1:k*N)=xk;%������
end

Hk=fft(h,N+M-1);%�����е�DFT
y=zeros(1,M+N*6-1);%�涨���Ծ�����е��ܳ���
y(1:N+M-1)=ifft(fft(x(1:N),N+M-1).*Hk); 

for k=2:6         
    yk=ifft(fft(x((k-1)*N+1:k*N),N+M-1).*Hk);
    y((k-1)*N+1:(k-1)*N+M-1)=yk(1:M-1)+y((k-1)*N+1:(k-1)*N+M-1);%�ص����
    y((k-1)*N+M:k*N+M-1)=yk(M:N+M-1);  
end

figure; stem(0:length(y)-1,y,'b.','linewidth',2); 
xlabel('n','fontsize',12);ylabel('y(n)','fontsize',12);