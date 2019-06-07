%���������FIR��ͨ�˲���
%(һ)����˵�����������ÿ������������FIR��ͨ�˲�����

clc;
clear;
close all;

N1=256;                        %�źŵĲ�������
n=0:N1-1; Fs=10000;f1=1500;f2=2500;alphas=40;    %�����˲����Ĳ���
wp=2*pi*f1/Fs;        %�����˲�����ͨ����ֹƵ��
ws=2*pi*f2/Fs;        %�����˲����������ʼƵ��
beta=0.5842*(alphas-21)^0.4+0.07886*(alphas-21); %���㿭�����Ŀ��Ʋ���
Bt=ws-wp;         %������ɴ�
N=ceil((alphas-8)/(2.285*Bt)); %���㿭�����ĳ���
wd=0.5*(wp+ws);      %���������ͨ�˲�����ͨ����ֹƵ��
hn=fir1(N-1,wd/pi,kaiser(N,beta)); %����fir1�����ͨFIR�˲���
x=cos(2*pi*f1/Fs*n)+cos(2*pi*f2/Fs*n);%ģ���źŲ����õ��������ź�
y=conv(x,hn);          %���źŽ����˲�

M=512;                        %����DFT�ĵ���
X=20*log10(abs(fft(x,M))/max(abs(fft(x,M))));    %����ԭ�źŵķ�Ƶ����
H=20*log10(abs(fft(hn,M))/max(abs(fft(hn,M))));%�����˲����ķ�Ƶ����
Y=20*log10(abs(fft(y,M))/max(abs(fft(y,M))));    %�����˲���ķ�Ƶ����

figure(1);
subplot(1,2,1);
plot((0:M/2-1)/M,X(1:M/2),'--',(0:M/2-1)/M,H(1:M/2));
grid on; 
legend('ԭ�źŷ�Ƶ����','�˲�����Ƶ����'); 
xlabel('\omega/\pi');ylabel('��Ƶ����'); 

subplot(1,2,2);
plot((0:M/2-1)/M,Y(1:M/2));
grid on;
xlabel('\omega/\pi');ylabel('�˲����źŵķ�Ƶ����');
