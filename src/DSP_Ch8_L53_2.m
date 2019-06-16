%本程序用于分析椭圆带通滤波器结构的量化效应，其通带截止频率为π[0.3π 0.55π]，通带最大衰减为0.4dB，最小的阻带衰减为50dB。对滤波器系数分别进行舍入、截尾处理。

clc;
clear;
close all;
qq=5;     %量化位数qq
[b,a]=ellip(4,0.4,50,[0.3 0.55]); %设计椭圆带通滤波器
[h,w]=freqz(b,a,512);
h=20*log10(abs(h)/max(abs(h)));  %求频率响应，幅度归一
bqr=intbR(b,qq); aqr=intbR(a,qq); %滤波器系数舍入量化为qq位
%bqr=intbT(b,qq); aqr=intbT(a,qq); %滤波器系数截尾量化为qq位
[hr,wr]=freqz(bqr,aqr,512);    
hr=20*log10(abs(hr)/max(abs(hr)));     %求量化后滤波器的频率响应，幅度归一
[sos,g]=tf2sos(b,a);    %求滤波器级联子系统的系统函数
b1=sos(1,1:3);a1=sos(1,4:6); 
b2=sos(2,1:3);a2=sos(2,4:6);      
b3=sos(3,1:3);a3=sos(3,4:6); 
b4=sos(4,1:3);a4=sos(4,4:6);

bqr1=intbR(b1,qq); aqr1=intbR(a1,qq); %量化子系统系数
%bqr1=intbT(b1,qq); aqr1=intbT(a1,qq);    %量化子系统系数
[h1,w1]=freqz(bqr1,aqr1,512);       %求量化后子系统的频率响应

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
hhh=20*log10(abs(hhh)/max(abs(hhh)));    %级联子系统系数量化后的频率响应
[z,p,k]=tf2zp(b,a);    %求直接型系统零极点
[zr,pr,kr]=tf2zp(bqr,aqr); %求直接型系数量化后的系统零极点



%子函数
% br=intbR(d,b)将十进制数d利用舍入法得到b(不包括符号位)位的二进制数，然后将该二进制数再转换为十进制数br 
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
% bt = intbT(d,b) 将十进制数d利用截尾法得到b(不包括符号位)位的二进制数，然后将该二进制数再转换为十进制数bt 
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