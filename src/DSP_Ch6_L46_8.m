%��������Ƶ�ʲ��������������λFIR��ͨ�˲���;
clc;
clear;
close all;

N=21;              %Ƶ���������
wd=0.15*pi;                %�����ͨ�˲����Ľ�ֹƵ��
kc=ceil(wd*N/(2*pi));      %����kc
Hg(1:N)=0;Hg(1:kc+1)=1;Hg(N-kc+1:N)=1;        %���������ͨ�˲�����Ƶ����
thetak=-(N-1)/N*pi*(0:N-1);      %�����ͨ�˲�������Ƶ����
Hd=Hg.*exp(1i * thetak);              %�����˲�����Ƶ����Ӧ
hn=ifft(Hd);              %�õ��˲����ĵ�λ������Ӧ
M=512;                                    %��FFT�ĵ���
hf=fft(hn,M);
H=abs(hf);                             %����FIR�˲����ķ�Ƶ����
H1=20*log10(H/max(abs(H)));
thet=unwrap(angle(hf)); 
figure;stem(real(hn),'.');grid;xlabel('n');title('h(n)'); 
figure; subplot(2,1,1);plot((0:255)/256,H1(1:256));grid;
xlabel('\omega/\pi');title('20lg|H(\omega)|'); 
subplot(2,1,2);plot((0:255)/256,thet(1:256));grid;
xlabel('\omega/\pi');title('\theta(\omega)'); 