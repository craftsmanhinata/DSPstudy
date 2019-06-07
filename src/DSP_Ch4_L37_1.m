% Goertzel算法识别DTMF信号
% 一、案例背景：FFT算法虽然运算速度快，但它需要较大的数据存储空间，并且某些时候我们并不需要全部频点上的频谱，
% 而仅需要部分频点上的频谱值，例如监测某频点是否存在信号。
% 二、原理描述：Goertzel算法利用相位因子kNW的周期性，将DFT运算表示为线性滤波运算。
% Goertzel算法的好处不在于节省时间，而在于节省空间。
% 如果只需要K个DFT样本，可以只用K个并行的单极点滤波器来分别计算K个DFT样本，这样可以大大节省硬软件资源。
% 三、案例描述：DTMF（Double Tone Multi Frequency，双音多频）信号是音频电话拨号信号。
% 在DTMF 通信系统中共有8个频率（4个高频音和4个低频音）。1个高频音和1个低频音的组合来表示一个信号，共提供16种组合，代表16 种信号。
% 首先产生DTMF信号，利用Goertzel算法检测识别。
clear;
close all;

d=input('键入电话号码= ','s');
symbol=abs(d);                      % 求它的ASCII码
tm=[49,50,51,65;52,53,54,66;55,56,57,67;42,48,35,68];        
for p=1:4 
    for q=1:4 
        if tm(p,q)==abs(d) 
            break;
        end
    end
    if tm(p,q)==abs(d)
        break;
    end
end
f1=[697,770,852,941];
f2=[1209,1336,1477,1633];
n=0:2040;
x = sin(2*pi*n*f1(p)/8000) + sin(2*pi*n*f2(q)/8000);
%加噪声
%x = awgn(x, 0.1);
sound(x, 8000);                                                                
disp('双频信号已经生成并发出');
pause;

N=205;
k=round([f1,f2]/8000*N);
for m = 1:8
    X(m)=gfft(x(1:N),k(m));                            % 用Goertzel算法计算8点DFT样本
end
val = abs(X);                           
stem(k,val,'.');
grid;
xlabel('k');ylabel('|X(k)|') 

set(gcf,'color','w');
shg;
disp('图上显示的是检测到的八个近似基频DFT幅度');
pause;
limit = 80;                 
for s=5:8 
    if val(s) > limit
        break, 
    end
end
for r=1:4 
    if val(r) > limit 
        break,
    end
end
disp(['接收方检测到的号码是',setstr(tm(r,s-4))]);