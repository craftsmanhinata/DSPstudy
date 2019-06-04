%һ������˵�� ����������˵�Ƶ�����ź�SFTƵ�׵��γ�ԭ���Լ�DFT��SFT�Ĺ�ϵ��
close all;
clear;

samples=8;FFTN=2048;%�źų���������FFT����
n=0:samples-1; 

m=2;N=8; 
x1=exp(-1i*2*pi*m/N*n);
x2=exp(1i*2*pi*m/N*n); 
fx1=fft(x1,FFTN);
fx2=fft(x2,FFTN);%�趨FFT����ΪFFTN
fx=(fx1+fx2)/2; 
figure; 
plot((0:FFTN-1)/FFTN*2,(real((fx1))),'b',(0:FFTN-1)/FFTN*2,(real((fx2))),'r','LineWidth',2); 
grid on;xlabel('\omega/\pi','fontsize',12);ylabel('X(e^j\omega)','fontsize',12); 

figure; 
plot((0:FFTN-1)/FFTN*2,(imag((fx1))),'b',(0:FFTN-1)/FFTN*2,(imag((fx2))),'r','LineWidth',2); 
grid on;xlabel('\omega/\pi','fontsize',12);ylabel('X(e^j\omega)','fontsize',12); 

figure; 
plot((0:FFTN-1)/FFTN*2,(abs((fx))),'b','LineWidth',2);
grid on; xlabel('\omega/\pi','fontsize',12);ylabel('|X(e^j\omega)|','fontsize',12);
hold on; 
stem((0:256:FFTN-1)/FFTN*2,(abs((fx(1:256:FFTN)))),'r.','LineWidth',2); 