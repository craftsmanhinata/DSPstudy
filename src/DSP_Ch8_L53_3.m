%本程序用于分析IIR滤波器直接型、级联型结构系数量化后的零极点变化和对幅频特性的影响。

%当量化方式采用舍入量化时，程序如下：
clc;
clear;
close all;

qq=5;%量化位数qq+1
w=0:0.001*pi:pi;
b=[0.1157 0.271 0.2710 0.1157];
a=[1 -0.7421 0.7211 -0.2057];
bqr=intbR(b,qq);%滤波器系数舍入量化为qq+1位
aqr=intbR(a,qq);
[hr1,w]=freqz(bqr,aqr,w);
hr=20*log10(abs(hr1)/max(abs(hr1)));        %求量化后滤波器的频率响应，幅度归一

[sos,g]=tf2sos(b,a);                   %求滤波器级联子系统的系统函数
b1=sos(1,1:3);a1=sos(1,4:6);
b2=sos(2,1:3);a2=sos(2,4:6); 
bqr1=intbR(b1,qq);%量化子系统系数
aqr1=intbR(a1,qq); 
[h1,w]=freqz(bqr1,aqr1,w);%求量化后子系统的频率响应
bqr2=intbR(b2,qq);
aqr2=intbR(a2,qq);
[h2,w]=freqz(bqr2,aqr2,w); 
hhh=h1.*h2;
hhh=20*log10(abs(hhh)/max(abs(hhh)));    %级联子系统系数量化后的频率响应，幅度归一
[zr,pr,kr]=tf2zp(bqr,aqr);                %求直接型系数量化后的系统零极点
sosqr=[bqr1 aqr1;bqr2 aqr2];
[zqrs,pqrs,kqrs] = sos2zp(sosqr);%求级联型系数量化后的系统零极点


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