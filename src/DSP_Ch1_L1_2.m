%��������A/Dλ����Ӱ��
%����˵�����������������н���A/D��������ʱ��ʵ����
%���ȶԵ�һ�źŽ���6λ������32λ�������۲������źŵ�Ƶ�ס�
%��β��������������45dB�������źţ��۲�Сλ����������С�źŵ�Ӱ�졣

clear;%����ڴ�
close all   ;%�ر�����ͼ��
x=sin(2*pi*(0:200)*0.042/10);%�������ز������ź�
figure;plot(30:90,x(30:90),'b'   );grid on; 
ylabel('x(n)','fontsize',14);xlabel('n','fontsize',14);%��עxy������
hold on;

xd=intbR(x,5);%���źŽ���6λ������
plot(30:90,xd(30:90),'r');
title('16λ����6λ���������ͼ','fontsize',14);

xf=fft(x,512);%���λ�������źŵ�Ƶ��
xdf=fft(xd,512);%��Сλ�������źŵ�Ƶ��
figure;plot((0:255)*10/512,20*log10(abs(xf(1:256))));grid on; 
ylabel('�ź�Ƶ��','fontsize',14);xlabel('kHz','fontsize',14);%��עxy������
title('16λ������Ƶ��ͼ','fontsize',14);
figure;plot((0:255)*10/512,20*log10(abs(xdf(1:256))));grid on; 
ylabel('�ź�Ƶ��','fontsize',12);xlabel('kHz','fontsize',14);%��עxy������
title('6λ������Ƶ��ͼ','fontsize',14);

N=512;
x=sin(2*pi*(0:N/2-1)*0.042/10)+0.0055*sin(2*pi*(0:N/2-1)*2.3/10);%������С��ͬ�����������ź�
xd=intbR(x,5);
xf=fft(x,N);
xdf=fft(xd,N);
figure;plot((0:N/2-1)*10/N,20*log10(abs(xf(1:N/2))));grid on; 
ylabel('�ź�Ƶ��','fontsize',14);xlabel('kHz','fontsize',14);%��עxy������
title('16λ������Ƶ��ͼ','fontsize',14);
figure;plot((0:N/2-1)*10/N,20*log10(abs(xdf(1:N/2))));grid on; 
ylabel('�ź�Ƶ��','fontsize',14);xlabel('kHz','fontsize',14);%��עxy������
title('6λ������Ƶ��ͼ','fontsize',14);

% ��ʮ������d�������뷨�õ�bλ������������λ������������Ȼ���ٽ���������ת��Ϊʮ������br
% ��������Ĳ�����û���ر𶮣��о�����������֮���ֻ�ԭ��ԭ������ֵ�ˣ������Ļ��ʹ�����ֵ���ȵĶ�ʧ�Լ������ֵ��ӳ�䵽ͬһ����ֵ��
function br=intbR(d,b) 
    m=1; 
    dr1=abs(d);
    while fix(dr1)>0
        dr1=abs(d)/(2^m);        
        m=m+1;  
    end
    br=fix(dr1*2^b+.5);  
    br=sign(d).*br.*2^(m-b-1);
end