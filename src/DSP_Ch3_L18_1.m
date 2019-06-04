%��������DFTƵ��ѭ���������
%һ������˵�����������ǽ�������µ��Ľ�DFT����Ƶ��ѭ���������ʱ��ʵ����
%��wave�ļ���ȡһ�������źţ��������Ƶ���ԣ�Ȼ�����DSB�������ز�˫�ߴ����ƣ�����cos������AM���Ƶ�8kHz��
%�ٹ۲����Ƶ���ԡ�
clear;%����ڴ�
close all   ;%�ر�����ͼ��
%filename1='../resource/canon.wav'; 
filename1='../resource/record1.m4a'; 
info = audioinfo(filename1);
[sr,fs]=audioread(filename1);%��ȡ�����źţ�����Ƶ��Ϊfs

siglen = length(sr); % �źŵĳ���
m = 0 : siglen-1;

N = 128*64; %ÿ�δ�����źų���
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
y = [0:N-1]*fs/N/1000; %Ƶ��
x = [0:n-1]*N/fs;

figure(1);
mesh(y,x,B);
view([0 0 90]);