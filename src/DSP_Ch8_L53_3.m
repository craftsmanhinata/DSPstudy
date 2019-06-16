%���������ڷ���IIR�˲���ֱ���͡������ͽṹϵ����������㼫��仯�ͶԷ�Ƶ���Ե�Ӱ�졣

%��������ʽ������������ʱ���������£�
clc;
clear;
close all;

qq=5;%����λ��qq+1
w=0:0.001*pi:pi;
b=[0.1157 0.271 0.2710 0.1157];
a=[1 -0.7421 0.7211 -0.2057];
bqr=intbR(b,qq);%�˲���ϵ����������Ϊqq+1λ
aqr=intbR(a,qq);
[hr1,w]=freqz(bqr,aqr,w);
hr=20*log10(abs(hr1)/max(abs(hr1)));        %���������˲�����Ƶ����Ӧ�����ȹ�һ

[sos,g]=tf2sos(b,a);                   %���˲���������ϵͳ��ϵͳ����
b1=sos(1,1:3);a1=sos(1,4:6);
b2=sos(2,1:3);a2=sos(2,4:6); 
bqr1=intbR(b1,qq);%������ϵͳϵ��
aqr1=intbR(a1,qq); 
[h1,w]=freqz(bqr1,aqr1,w);%����������ϵͳ��Ƶ����Ӧ
bqr2=intbR(b2,qq);
aqr2=intbR(a2,qq);
[h2,w]=freqz(bqr2,aqr2,w); 
hhh=h1.*h2;
hhh=20*log10(abs(hhh)/max(abs(hhh)));    %������ϵͳϵ���������Ƶ����Ӧ�����ȹ�һ
[zr,pr,kr]=tf2zp(bqr,aqr);                %��ֱ����ϵ���������ϵͳ�㼫��
sosqr=[bqr1 aqr1;bqr2 aqr2];
[zqrs,pqrs,kqrs] = sos2zp(sosqr);%������ϵ���������ϵͳ�㼫��


%�Ӻ���
% br=intbR(d,b)��ʮ������d�������뷨�õ�b(����������λ)λ�Ķ���������Ȼ�󽫸ö���������ת��Ϊʮ������br
function  br=intbR(d,b)
    m=1;
    dr1=abs(d);
    while fix(dr1)>0
        dr1=abs(d)/(2^m);
        m=m+1;
    end
    br=fix(dr1*2^b+.5);
    br=sign(d).*br.*2^(m-b-1); 
end

% bt = intbT(d,b) ��ʮ������d���ý�β���õ�b(����������λ)λ�Ķ���������Ȼ�󽫸ö���������ת��Ϊʮ������bt
function bt= intbT(d,b)     
    m=1; 
    dt1=abs(d); 
    while fix(dt1)>0 
        dt1=abs(d)/(2^m); 
        m=m+1; 
    end
    bt=fix(dt1*2^b); 
    bt=sign(d).*bt.*2^(m-b-1);
end