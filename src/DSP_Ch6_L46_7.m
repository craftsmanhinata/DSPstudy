%Ƶ�ʲ��������һ����Ϊ23��������λ��ȫƵ������΢����
clc;
clear;
close all;

N=24;    %Ƶ���������
Hg(1:N)=0;
for i=1:N/2
    Hg(i)=i-1;
    Hg(N-i+1)=i;
end        %���������ͨ�˲�����Ƶ����

thetak=-pi/2-(N-1)/N*pi*(0:N-1);  %�����ͨ�˲�������Ƶ����
Hd=Hg.*exp(1i* thetak);    %�����˲�����Ƶ����Ӧ

hn=ifft(Hd); %�õ��˲����ĵ�λ������Ӧ
M=256; %��FFT�ĵ���
hf=fft(hn,M);
H=abs(hf);   %����FIR�˲����ķ�Ƶ����
H1=20*log10(H/max(abs(H)));
thet=unwrap(angle(hf)); 
figure;stem(real(hn));grid;xlabel('n');ylabel('h(n)'); 
figure;subplot(2,1,1);plot((0:255)/512,H1(1:256));grid; 
xlabel('\omega/\pi');ylabel('20lg|H(\omega)|'); 
subplot(2,1,2);plot((0:255)/512,thet(1:256));grid;
xlabel('\omega/\pi');ylabel('\theta(\omega)');