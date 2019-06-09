%窗化法设计FIR滤波器，分析各种窗函数对近端干扰和远端干扰的滤除性能。
%一、案例背景：处理信号中经常会碰到有多个干扰存在的情况，如近端干扰1和远端干扰2，
%需要设计一个滤波器不仅能滤除近端干扰1，还要能滤除远端干扰2。
%然而，在用窗化法设计FIR滤波器时，窗的类型不同，对近端和远端的衰减也是不一样的，
%因此需要分析各种窗函数对近端干扰和远端干扰的滤除性能，总结出窗函数的选取原则。

clc;
clear;
close all;

%读取信号
filename = '../resource/canon.wav';
s_in = audioread(filename);
s_info = audioinfo(filename);

%L = length(s_in);
L = s_info.TotalSamples;
Fs = s_info.SampleRate / 1000;     %采样频率（单位：kHz）

% 绘制输入信号幅频特性
S_inAA = meanfft(s_in,L);
plot((-2047:2048)/4096*Fs,20*log10(fftshift(S_inAA)));
grid;xlabel('kHz'); ylabel('幅频特性');
%观察幅频特性可知，有用音乐信号的截止频率为7kHz，干扰1的频率为9kHz,干扰2的频率为14kHz

fp = 2; %设定低通滤波器的通带截止频率
f1 = 2.5;%设定低通滤波器的阻带起始频率
%设计滤波器
wp = fp/Fs*2*pi;
ws = f1/Fs*2*pi;
wd=0.5*(wp+ws);      %计算理想低通滤波器的通带截止频率
Bt=abs(wp-ws);        %计算过渡带
alphas=40;                %设定阻带最小衰减为40dB

%用汉宁窗设计
N1=ceil(8*pi/Bt); %计算汉宁窗的长度
hhan=fir1(N1-1,wd/pi,'low',hann(N1)); %调用fir1计算低通FIR滤波器
HHan=fft(hhan,512);
yhhan = conv(hhan,s_in); %对输入信号进行滤波
Yhhan = meanfft(yhhan,length(yhhan));

%用汉明窗设计
N2=ceil(8*pi/Bt); %计算汉明窗的长度
hhm=fir1(N2-1,wd/pi,'low',hamming(N2)); %调用fir1计算低通FIR滤波器
HHm=fft(hhm,512);
yhhm = conv(hhm,s_in);
Yhhm = meanfft(yhhm,length(yhhm));

%用布莱克曼窗设计
N3=ceil(12*pi/Bt); %计算布莱克曼窗的长度
hb=fir1(N3-1,wd/pi,'low',blackman(N3)); %调用fir1计算低通FIR滤波器
HHb=fft(hb,512);
yhb = conv(hb,s_in);
Yhb = meanfft(yhb,length(yhb));

%用凯塞窗设计
beta=0.5842*(alphas-21)^0.4+0.07886*(alphas-21);        % 凯塞窗控制参数
N4=ceil((alphas-8)/(2.285*Bt));
hks=fir1(N4-1,wd/pi,'low',kaiser(N4,beta)); %调用fir1计算低通FIR滤波器
Hks=fft(hks,512);
yhks = conv(hks,s_in);
Yhks = meanfft(yhks,length(yhks));

%用矩形窗设计
N5 = ceil(4*pi/Bt); %计算矩形窗的长度
hr =fir1(N5-1,wd/pi,'low',rectwin(N5)); %调用fir1设计低通FIR滤波器
Hr=fft(hr,512);
yhr = conv(hr,s_in);
Yhr = meanfft(yhr,length(yhr));

%用三角窗设计
N6 = ceil(8*pi/Bt); %计算三角窗的长度
hba =fir1(N6-1,wd/pi,'low',bartlett(N6)); %调用fir1计算低通FIR滤波器
Hba=fft(hba,512);yhba = conv(hba,s_in);
Yhba = meanfft(yhba,length(yhba));

%绘图
figure;
plot((0:255)/512*Fs,20*log10(abs(HHan(1:256))),'b-','linewidth',2);
grid;xlabel('kHz'); ylabel('20lg|H(\omega)|');
hold on;
plot((0:255)/512*Fs,20*log10(abs(HHm(1:256))),'k--','linewidth',2);
plot((0:255)/512*Fs,20*log10(abs(HHb(1:256))),'r->','linewidth',2);
plot((0:255)/512*Fs,20*log10(abs(Hks(1:256))),'c-*','linewidth',2);
plot((0:255)/512*Fs,20*log10(abs(Hr(1:256))),'m-o','linewidth',2);
plot((0:255)/512*Fs,20*log10(abs(Hba(1:256))),'g-p','linewidth',2);
legend('汉宁窗','汉明窗','布莱克曼窗','凯塞窗','矩形窗','三角窗');

figure;plot((0:2047)/4096*Fs,20*log10(abs(Yhhan(1:2048))),'k','linewidth',2);grid;xlabel('kHz'); ylabel('20lg|Y(\omega)|');title('用汉宁窗设计滤波器');
figure;plot((0:2047)/4096*Fs,20*log10(abs(Yhhm(1:2048))),'k','linewidth',2);grid;xlabel('kHz'); ylabel('20lg|Y(\omega)|');title('用汉明窗设计滤波器');
figure;plot((0:2047)/4096*Fs,20*log10(abs(Yhb(1:2048))),'k','linewidth',2);grid;xlabel('kHz'); ylabel('20lg|Y(\omega)|');title('用布莱克曼窗设计滤波器');
figure;plot((0:2047)/4096*Fs,20*log10(abs(Yhks(1:2048))),'k','linewidth',2);grid;xlabel('kHz'); ylabel('20lg|Y(\omega)|');title('用凯塞窗设计滤波器');
figure;plot((0:2047)/4096*Fs,20*log10(abs(Yhr(1:2048))),'k','linewidth',2);grid;xlabel('kHz'); ylabel('20lg|Y(\omega)|');title('用矩形窗设计滤波器');
figure;plot((0:2047)/4096*Fs,20*log10(abs(Yhba(1:2048))),'k','linewidth',2);grid;xlabel('kHz'); ylabel('20lg|Y(\omega)|');title('用三角窗设计滤波器');

function XX = meanfft(s_in,L) % 求fft的均值
    % s_in为输入信号
    % L为信号长度
    % XX为输出信号
    for i = 1: floor(L/4096)         
        S_inA(i,:)  =  abs(fft(s_in((i-1)*4096+1:i*4096)));  
    end
    S_inAA = mean(S_inA); 
    XX= S_inAA;
end