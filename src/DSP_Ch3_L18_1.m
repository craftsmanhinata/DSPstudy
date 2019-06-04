%程序名：DFT频域循环卷积定理
%一、程序说明：本程序是讲解第三章第四节DFT性质频域循环卷积定理时的实例。
%从wave文件读取一段音乐信号，画出其幅频特性，然后进行DSB（抑制载波双边带调制（乘以cos））和AM调制到8kHz，
%再观察其幅频特性。
clear;%清除内存
close all   ;%关闭所有图形
%filename1='../resource/canon.wav'; 
filename1='../resource/record1.m4a'; 
info = audioinfo(filename1);
[sr,fs]=audioread(filename1);%读取音乐信号，采样频率为fs

siglen = length(sr); % 信号的长度
m = 0 : siglen-1;

N = 128*64; %每次处理的信号长度
n = floor(siglen/N);
A = zeros(N,n);

for i=1:n
    n1 = (i-1)*N+1;
    n2 = n1+(N-1);
    s = sr(n1:n2);
    s = s.*hamming(N);
    z = 20*log10(abs(fft(s)));
    A(:,i) = z(1:N);
end

NN = N/16;
B = A.';
BB = B(:,(1:NN));
y = [0:N-1]*fs/N/1000; %频率
x = [0:n-1]*N/fs;

figure(1);
mesh(y,x,B);
view([0 0 90]);