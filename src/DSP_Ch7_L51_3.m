%IIR数字滤波器设计，分析用巴特沃斯型、切比雪夫I、II型和椭圆型滤波器的性能。
clc;
clear;
close all;

%读取信号
s_in = wavread('music1-32.wav'); 
L = length(s_in);   
Fs = 30000;     %采样频率（单位：Hz）
% 绘制输入信号幅频特性
S_inAA = meanfft(s_in,L); 
plot((-2047:2048)/4096*Fs/1000,20*log10(fftshift(S_inAA))); grid on;
xlabel('kHz'); ylabel('幅频特性'); 
%观察幅频特性可知，有用音乐信号的截止频率为7kHz，干扰1的频率f1 = 9kHz,干扰2的频率f2 = 14kHz
fp = 7000;f1 = 8500; f2 = 14; %设计滤波器
wp = fp/Fs*2;ws = f1/Fs*2; Rp  =  3;        %设定通带最大衰减为1dB
Rs = 50;     %设定阻带最小衰减为50dB
%用切比雪夫I型设计
[N,Wc] = cheb1ord(wp,ws,Rp,Rs); %求切比雪夫I滤波器的阶数和通带截止频率
[b,a] = cheby1(N,Rp,Wc); 
w = 0:0.01*pi:pi;
[h,w] = freqz(b,a,w); 
h=20*log10(abs(h)/max(abs(h))); %求频率响应，幅度归一
y = filter(b,a,s_in); %用未量化滤波器对输入信号进行滤波
Y= meanfft(y,length(y)); 
%量化
qq = 5; bqr=intbR(b,qq); aqr=intbR(a,qq);     %滤波器系数舍入量化为qq位
[hr,wr]=freqz(bqr,aqr,w);           %直接型的系统频率响应
hr=20*log10(abs(hr)/max(abs(hr)));    %求量化后滤波器的频率响应，幅度归一
yd = filter(bqr,aqr,s_in); %用直接型对输入信号进行滤波
Yd= meanfft(yd,length(yd));
[sos,g]=tf2sos(b,a);        %求滤波器级联子系统的系统函数
b1=sos(1,1:3);a1=sos(1,4:6); b2=sos(2,1:3);a2=sos(2,4:6);      
b3=sos(3,1:3);a3=sos(3,4:6); b4=sos(4,1:3);a4=sos(4,4:6);      
%b5=sos(5,1:3);a5=sos(5,4:6);    
bqr1=intbR(b1,qq);  aqr1=intbR(a1,qq);      %量化子系统系数
[h1,w1]=freqz(bqr1,aqr1,w); %求量化后子系统的频率响应
bqr2=intbR(b2,qq); aqr2=intbR(a2,qq); 
[h2,w1]=freqz(bqr2,aqr2,w); 
bqr3=intbR(b3,qq); aqr3=intbR(a3,qq); 
[h3,w1]=freqz(bqr3,aqr3,w); 
bqr4=intbR(b4,qq); aqr4=intbR(a4,qq); 
[h4,w1]=freqz(bqr4,aqr4,w); 
% bqr5=intbR(b5,qq); aqr5=intbR(a5,qq);
% [h5,w1]=freqz(bqr5,aqr5,w);
hhh=h1.*h2.*h3.*h4;    
hhh=20*log10(abs(hhh)/max(abs(hhh)));      %级联子系统系数量化后的频率响应
[z,p,k]=tf2zp(b,a);    %求直接型系统零极点
[zr,pr,kr]=tf2zp(bqr,aqr); %求直接型系数量化后的系统零极点
ysos = sosfilt(sos,s_in); %用级联型对输入信号进行滤波
Ysos= meanfft(ysos,length(ysos)); 
figure;zplane(z,zr);legend('未量化系统零点','直接型量化后零点');grid on;
figure;zplane(p,pr);legend('未量化系统极点','直接型量化后极点');grid on;
figure; plot(w/pi,h,'--',w/pi,hr,'-',w/pi,hhh,'.','LineWidth',2); 
legend('未量化系统','直接型量化','级联量化');xlabel('\omega/\pi');ylabel('dB');grid on; 
title('系统频率响应') 
figure;plot((0:2047)/4096*Fs,20*log10(abs(Y(1:2048))),'k','linewidth',2); grid;
xlabel('kHz'); ylabel('20lg|Y(\omega)|');title('未量化滤波器的输出'); 
figure;plot((0:2047)/4096*Fs,20*log10(abs(Yd(1:2048))),'k','linewidth',2); grid;
xlabel('kHz'); ylabel('20lg|Y(\omega)|');title('直接型滤波器的输出'); 
figure;plot((0:2047)/4096*Fs,20*log10(abs(Ysos(1:2048))),'k','linewidth',2); grid;
xlabel('kHz'); ylabel('20lg|Y(\omega)|');title('级联型滤波器的输出');


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