%程序名：A/D位数的影响
%程序说明：本程序是绪论中讲解A/D量化噪声时的实例。
%首先对单一信号进行6位量化和32位量化，观察两个信号的频谱。
%其次产生两个功率相差45dB的两个信号，观察小位数量化对弱小信号的影响。

clear;%清除内存
close all   ;%关闭所有图形
x=sin(2*pi*(0:200)*0.042/10);%产生单载波正弦信号
figure;plot(30:90,x(30:90),'b'   );grid on; 
ylabel('x(n)','fontsize',14);xlabel('n','fontsize',14);%标注xy轴坐标
hold on;

xd=intbR(x,5);%对信号进行6位数量化
plot(30:90,xd(30:90),'r');
title('16位数和6位数量化结果图','fontsize',14);

xf=fft(x,512);%求大位数量化信号的频谱
xdf=fft(xd,512);%求小位数量化信号的频谱
figure;plot((0:255)*10/512,20*log10(abs(xf(1:256))));grid on; 
ylabel('信号频谱','fontsize',14);xlabel('kHz','fontsize',14);%标注xy轴坐标
title('16位数量化频谱图','fontsize',14);
figure;plot((0:255)*10/512,20*log10(abs(xdf(1:256))));grid on; 
ylabel('信号频谱','fontsize',12);xlabel('kHz','fontsize',14);%标注xy轴坐标
title('6位数量化频谱图','fontsize',14);

N=512;
x=sin(2*pi*(0:N/2-1)*0.042/10)+0.0055*sin(2*pi*(0:N/2-1)*2.3/10);%产生大小不同的两个正弦信号
xd=intbR(x,5);
xf=fft(x,N);
xdf=fft(xd,N);
figure;plot((0:N/2-1)*10/N,20*log10(abs(xf(1:N/2))));grid on; 
ylabel('信号频谱','fontsize',14);xlabel('kHz','fontsize',14);%标注xy轴坐标
title('16位数量化频谱图','fontsize',14);
figure;plot((0:N/2-1)*10/N,20*log10(abs(xdf(1:N/2))));grid on; 
ylabel('信号频谱','fontsize',14);xlabel('kHz','fontsize',14);%标注xy轴坐标
title('6位数量化频谱图','fontsize',14);

% 将十进制数d利用舍入法得到b位（不包含符号位）二进制数，然后再将二进制数转换为十进制数br
% 这个量化的操作我没有特别懂，感觉是量化完了之后，又还原成原来的数值了，这样的话就存在数值精度的丢失以及多个数值被映射到同一个数值。
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