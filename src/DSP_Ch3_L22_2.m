% һ������˵��  ������ʵ�������ص�������������������x(n)��h(n)�����Ծ����
% �����еĶ�����h(n)��ĳLTIϵͳ�ĵ�λ������Ӧ��������x(n)�Ǹ�ϵͳ�����룬�����������ϵͳ�����y(n)��
% ���������嵥
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
overlap=zeros(1,M-1);%��ǰ�ظ�ȡ������
y(1:N+M-1)=ifft(fft([overlap x(1:N)],N+M-1).*Hk);
y(1:N)=y(M:N+M-1);%����ǰM-1��

for k=2:6         
    overlap=x((k-1)*N-M+2:(k-1)*N);%��ǰ�ظ�ȡ������        
    yk=ifft(fft([overlap  x((k-1)*N+1:k*N)],N+M-1).*Hk);          
    y((k-1)*N+1:k*N)=yk(M:N+M-1);%����ǰM-1��
end

k=k+1; 
overlap=x((k-1)*N-M+2:(k-1)*N);
yk=ifft(fft([overlap zeros(1,N)],N+M-1).*Hk); 
y((k-1)*N+1:k*N)=yk(M:N+M-1);%����ǰM-1��

figure; stem(0:length(y)-1,y,'b.','linewidth',2); 
xlabel('n','fontsize',12);ylabel('y(n)','fontsize',12);