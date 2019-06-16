%���������ڷ�����Բ��ͨ�˲����ṹ������ЧӦ����ͨ����ֹƵ��Ϊ��[0.3�� 0.55��]��ͨ�����˥��Ϊ0.4dB����С�����˥��Ϊ50dB�����˲���ϵ���ֱ�������롢��β����

clc;
clear;
close all;
qq=5;     %����λ��qq
[b,a]=ellip(4,0.4,50,[0.3 0.55]); %�����Բ��ͨ�˲���
[h,w]=freqz(b,a,512);
h=20*log10(abs(h)/max(abs(h)));  %��Ƶ����Ӧ�����ȹ�һ
bqr=intbR(b,qq); aqr=intbR(a,qq); %�˲���ϵ����������Ϊqqλ
%bqr=intbT(b,qq); aqr=intbT(a,qq); %�˲���ϵ����β����Ϊqqλ
[hr,wr]=freqz(bqr,aqr,512);    
hr=20*log10(abs(hr)/max(abs(hr)));     %���������˲�����Ƶ����Ӧ�����ȹ�һ
[sos,g]=tf2sos(b,a);    %���˲���������ϵͳ��ϵͳ����
b1=sos(1,1:3);a1=sos(1,4:6); 
b2=sos(2,1:3);a2=sos(2,4:6);      
b3=sos(3,1:3);a3=sos(3,4:6); 
b4=sos(4,1:3);a4=sos(4,4:6);

bqr1=intbR(b1,qq); aqr1=intbR(a1,qq); %������ϵͳϵ��
%bqr1=intbT(b1,qq); aqr1=intbT(a1,qq);    %������ϵͳϵ��
[h1,w1]=freqz(bqr1,aqr1,512);       %����������ϵͳ��Ƶ����Ӧ

bqr2=intbR(b2,qq); aqr2=intbR(a2,qq); 
%bqr2=intbT(b2,qq); aqr2=intbT(a2,qq);
[h2,w1]=freqz(bqr2,aqr2,512); 

bqr3=intbR(b3,qq); aqr3=intbR(a3,qq); 
%bqr3=intbT(b3,qq); aqr3=intbT(a3,qq); 
[h3,w1]=freqz(bqr3,aqr3,512); 

bqr4=intbR(b4,qq); aqr4=intbR(a4,qq); 
%bqr4=intbT(b4,qq); aqr4=intbT(a4,qq); 
[h4,w1]=freqz(bqr4,aqr4,512); 

hhh=h1.*h2.*h3.*h4;    
hhh=20*log10(abs(hhh)/max(abs(hhh)));    %������ϵͳϵ���������Ƶ����Ӧ
[z,p,k]=tf2zp(b,a);    %��ֱ����ϵͳ�㼫��
[zr,pr,kr]=tf2zp(bqr,aqr); %��ֱ����ϵ���������ϵͳ�㼫��



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